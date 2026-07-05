// Run fuzzer with different seeds.

// Run with top-down analysis.

// Test without analysis: Insert a copy on every buffer write.

func.func @no_conflict(%fill: f32, %f: f32, %idx: index) -> tensor<3xf32> {
  %t = tensor.from_elements %fill, %fill, %fill : tensor<3xf32>
  %i = tensor.insert %f into %t[%idx] : tensor<3xf32>
  return %i : tensor<3xf32>
}

// -----

func.func @use_tensor_func_arg(%A : tensor<?xf32>) -> (vector<4xf32>) {
  %c0 = arith.constant 0 : index
  %f0 = arith.constant 0.0 : f32

  %0 = vector.transfer_read %A[%c0], %f0 : tensor<?xf32>, vector<4xf32>

  return %0 : vector<4xf32>
}

// -----

func.func @return_tensor(%A : tensor<?xf32>, %v : vector<4xf32>) -> (tensor<?xf32>) {
  %c0 = arith.constant 0 : index

  %0 = vector.transfer_write %v, %A[%c0] : vector<4xf32>, tensor<?xf32>

  return %0 : tensor<?xf32>
}

// -----

func.func @func_without_tensor_args(%v : vector<10xf32>) -> () {
  %0 = bufferization.alloc_tensor() : tensor<10xf32>

  %c0 = arith.constant 0 : index
  %1 = vector.transfer_write %v, %0[%c0] : vector<10xf32>, tensor<10xf32>

  %cst = arith.constant 0.0 : f32
  %r = vector.transfer_read %1[%c0], %cst : tensor<10xf32>, vector<11xf32>

  vector.print %r : vector<11xf32>
  return
}

// -----

func.func private @private_func(tensor<?xf32>) -> ()

func.func @empty_func() -> () {
  return
}

// -----

func.func @read_after_write_conflict(%cst : f32, %idx : index, %idx2 : index)
    -> (f32, f32) {
  %t = "test.dummy_op"() : () -> (tensor<10xf32>)

  %write = tensor.insert %cst into %t[%idx2] : tensor<10xf32>

  %read = "test.some_use"(%t) : (tensor<10xf32>) -> (f32)
  %read2 = tensor.extract %write[%idx] : tensor<10xf32>

  return %read, %read2 : f32, f32
}

// -----

func.func @copy_deallocated() -> tensor<10xf32> {
  %0 = bufferization.alloc_tensor() : tensor<10xf32>
  return %0 : tensor<10xf32>
}

// -----

func.func @select_different_tensors(%t: tensor<?xf32>, %sz: index, %pos: index, %c: i1) -> f32 {
  %0 = bufferization.alloc_tensor(%sz) : tensor<?xf32>

  // A cast must be inserted because %t and %0 have different memref types.
  %1 = arith.select %c, %0, %t : tensor<?xf32>
  %2 = tensor.extract %1[%pos] : tensor<?xf32>
  return %2 : f32
}

// -----

// moment because this would create a tensor op during bufferization. That is
// currently forbidden.
func.func @alloc_tensor_with_copy(%t: tensor<5xf32>) -> tensor<5xf32> {
  %0 = bufferization.alloc_tensor() copy(%t) : tensor<5xf32>
  return %0 : tensor<5xf32>
}

// -----

func.func @alloc_tensor_with_memory_space() -> tensor<5xf32> {
  %0 = bufferization.alloc_tensor() {memory_space = 1 : i64} : tensor<5xf32>
  return %0 : tensor<5xf32>
}

// -----

func.func @read_of_alias(%t: tensor<100xf32>, %pos1: index, %pos2: index,
                         %pos3: index, %pos4: index, %sz: index, %f: f32)
  -> (f32, f32)
{
  %0 = tensor.insert %f into %t[%pos1] : tensor<100xf32>
  %1 = tensor.extract_slice %t[%pos2][%sz][1] : tensor<100xf32> to tensor<?xf32>
  %2 = tensor.extract %1[%pos3] : tensor<?xf32>
  %3 = tensor.extract %0[%pos3] : tensor<100xf32>
  return %2, %3 : f32, f32
}

// -----

func.func @from_unranked_to_unranked(%arg0: tensor<*xi32>) -> tensor<*xi32> {
  %0 = tensor.cast %arg0 : tensor<*xi32> to tensor<*xi32>
  return %0 : tensor<*xi32>
}

// -----

func.func @tensor_copy(%arg0: tensor<5xf32>) -> tensor<5xf32> {
  %dest = bufferization.alloc_tensor() : tensor<5xf32>
  %0 = bufferization.materialize_in_destination %arg0 in %dest
      : (tensor<5xf32>, tensor<5xf32>) -> tensor<5xf32>
  return %0 : tensor<5xf32>
}

// -----

func.func @materialize_in_destination_buffer(%t: tensor<5xf32>, %m: memref<5xf32>) {
  bufferization.materialize_in_destination %t in restrict writable %m
      : (tensor<5xf32>, memref<5xf32>) -> ()
  return
}

// -----

func.func @materialize_in_func_bbarg(%t: tensor<?xf32>, %dest: tensor<?xf32>)
    -> tensor<?xf32> {
  // This op is not bufferizable because function block arguments are
  // read-only in regular One-Shot Bufferize. (Run One-Shot Module
  // Bufferization instead.)
  // expected-error @below{{not bufferizable under the given constraints: would write to read-only buffer}}
  %0 = bufferization.materialize_in_destination %t in %dest
      : (tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>
  return %0 : tensor<?xf32>
}

// -----

func.func @materialize_in_dest_raw(%f: f32, %f2: f32, %idx: index) -> (tensor<5xf32>, f32) {
  %dest = bufferization.alloc_tensor() : tensor<5xf32>
  // Note: The location of the RaW conflict may not be accurate (such as in this
  // example). This is because the analysis operates on "alias sets" and not
  // single SSA values. The location may point to any SSA value in the alias set
  // that participates in the conflict.
  // expected-error @below{{not bufferizable under the given constraints: cannot avoid RaW conflict}}
  %dest_filled = linalg.fill ins(%f : f32) outs(%dest : tensor<5xf32>) -> tensor<5xf32>
  %src = bufferization.alloc_tensor() : tensor<5xf32>
  %src_filled = linalg.fill ins(%f2 : f32) outs(%src : tensor<5xf32>) -> tensor<5xf32>

  %0 = bufferization.materialize_in_destination %src_filled in %dest_filled
      : (tensor<5xf32>, tensor<5xf32>) -> tensor<5xf32>
  // Read from %dest_filled, which makes it impossible to bufferize the
  // materialize_in_destination op in-place.
  %r = tensor.extract %dest_filled[%idx] : tensor<5xf32>

  return %0, %r : tensor<5xf32>, f32
}

// -----

func.func @custom_op(%arg: !test.test_tensor<[32, 64], f64>)
    -> !test.test_tensor<[32, 128], f64> {
  %out = "test.dummy_tensor_op"(%arg) : (!test.test_tensor<[32, 64], f64>)
    -> !test.test_tensor<[32, 128], f64>

  return %out : !test.test_tensor<[32, 128], f64>
}

// -----

func.func @custom_origin_op() -> !test.test_tensor<[42], f64> {
  %in = "test.create_tensor_op"() : () -> !test.test_tensor<[21], f64>
  %out = "test.dummy_tensor_op"(%in) : (!test.test_tensor<[21], f64>)
    -> !test.test_tensor<[42], f64>

  return %out : !test.test_tensor<[42], f64>
}
