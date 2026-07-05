// Note: Default is function-boundary-type-conversion=infer-layout-map

// Run fuzzer with different seeds.

// Test bufferization using memref types that have no layout map.

// Test bufferization using memref types that have fully dynamic layout maps.


// Bufferization of bodiless function with no tensor return value.

func.func private @private_func(tensor<?xf32>) -> ()

func.func private @private_func_2d(tensor<?x?xf32>) -> ()

func.func @empty_func() -> () {
  return
}

// -----

// A bodiless function that returns something that is not a tensor.

func.func private @external_func_with_return_val(tensor<4xi32>) -> f32

// -----

// Bufferization of bodiless function that returns a tensor.

func.func private @foo(%t : tensor<?xf32>) -> (f32, tensor<?xf32>, f32)

func.func @call_to_unknown_tensor_returning_func(%t : tensor<?xf32>) {
  call @foo(%t) : (tensor<?xf32>) -> (f32, tensor<?xf32>, f32)
  return
}

// -----

// A function that returns a non-equivalent tensor with layout map.


// buffers that are inserted due to to_tensor/to_buffer canonicalization (when
// the buffer types have different layout maps).

func.func @return_extract_slice(%idx: index, %sz: index) -> (tensor<2x?xf32>)
{
  %t = bufferization.alloc_tensor() : tensor<20x10xf32>
  %0 = tensor.extract_slice %t[%idx, %idx][2, %sz][1, 1]
      : tensor<20x10xf32> to tensor<2x?xf32>
  return %0 : tensor<2x?xf32>
}

// -----

func.func @foo(%arg0: tensor<3x8xf16>) -> tensor<3x8xf16> {
  return %arg0 : tensor<3x8xf16>
}

func.func @call_extract_slice(%arg0: tensor<4x8xf16>) -> (tensor<3x8xf16>) {
  %0 = tensor.extract_slice %arg0[1, 0] [3, 8] [1, 1] : tensor<4x8xf16> to tensor<3x8xf16>
  %1 = call @foo(%0) : (tensor<3x8xf16>) -> tensor<3x8xf16>
  return %1 : tensor<3x8xf16>
}

// -----

func.func private @private_func(tensor<?xf32>) -> (f32)

// private_func may modify the buffer arg, but that's OK because %t is writable.
// No alloc/copy should be inserted.

func.func @main(%t: tensor<?xf32> {bufferization.writable = true}) -> (f32) {
  %0 = call @private_func(%t) : (tensor<?xf32>) -> (f32)
  return %0 : f32
}

// -----

func.func private @private_func(tensor<?xf32>) -> (f32)

// private_func may modify the buffer arg, %t is not writable. A copy is needed.

func.func @main(%t: tensor<?xf32> {bufferization.writable = false}) -> (f32) {
  %0 = call @private_func(%t) : (tensor<?xf32>) -> (f32)
  return %0 : f32
}

// -----

// Test bufferization of a function without tensor args.

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

// Bufferization of a function that is reading and writing. %t0 is writable, so
// no copy should be inserted.

func.func private @inner_func(%t: tensor<?xf32>) -> (tensor<?xf32>, f32) {
  %f = arith.constant 1.0 : f32
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %0 = tensor.insert %f into %t[%c0] : tensor<?xf32>
  %1 = tensor.extract %0[%c1] : tensor<?xf32>
  return %0, %1 : tensor<?xf32>, f32
}

func.func private @call_func_with_non_tensor_return(
    %t0: tensor<?xf32> {bufferization.writable = true}) -> (f32, tensor<?xf32>) {
  %0, %1 = call @inner_func(%t0) : (tensor<?xf32>) -> (tensor<?xf32>, f32)
  return %1, %0 : f32, tensor<?xf32>
}

// -----

// Bufferization of a function that is reading and writing. %t0 is not writable,
// so a copy is needed.

func.func private @inner_func(%t: tensor<?xf32>) -> (tensor<?xf32>, f32) {
  %f = arith.constant 1.0 : f32
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %0 = tensor.insert %f into %t[%c0] : tensor<?xf32>
  %1 = tensor.extract %0[%c1] : tensor<?xf32>
  return %0, %1 : tensor<?xf32>, f32
}

func.func @call_func_with_non_tensor_return(
    %t0: tensor<?xf32> {bufferization.writable = false}) -> (f32, tensor<?xf32>) {
  %0, %1 = call @inner_func(%t0) : (tensor<?xf32>) -> (tensor<?xf32>, f32)

  // Note: The tensor return value cannot fold away because the CallOp
  // bufferized out-of-place.
  return %1, %0 : f32, tensor<?xf32>
}

// -----

// A chain of function calls. The last function f0 is potentially writing to the
// buffer. This becomes a problem when bufferizing main and a copy must be
// inserted then. (No copies in the other functions.)

func.func private @f0(tensor<?xf32>) -> (f32)

func.func @f1(%t: tensor<?xf32>) -> (f32) {
  %0 = call @f0(%t) : (tensor<?xf32>) -> (f32)
  return %0 : f32
}

func.func @f2(%t: tensor<?xf32>) -> (f32) {
  %0 = call @f1(%t) : (tensor<?xf32>) -> (f32)
  return %0 : f32
}

func.func @main(%t: tensor<?xf32> {bufferization.writable = false}) -> (f32) {
  %0 = call @f2(%t) : (tensor<?xf32>) -> (f32)
  return %0 : f32
}

// -----

// This function does not read, just write. We need an alloc, but no copy.

func.func private @does_not_read(%t: tensor<?xf32>) -> tensor<?xf32> {
  %f0 = arith.constant 0.0 : f32
  %r = linalg.fill ins(%f0 : f32) outs(%t : tensor<?xf32>) -> tensor<?xf32>
  return %r : tensor<?xf32>
}

func.func @main(%t: tensor<?xf32> {bufferization.writable = false}) -> f32 {
  %0 = call @does_not_read(%t) : (tensor<?xf32>) -> (tensor<?xf32>)
  %idx = arith.constant 4 : index
  %r = tensor.extract %0[%idx] : tensor<?xf32>
  return %r : f32
}

// -----

// Alloc and copy must be inserted because the arith.constant is read-only.

func.func private @some_external_func(tensor<4xi32>)

func.func @main() {
  %A = arith.constant dense<[1, 2, 3, 4]> : tensor<4xi32>

  call @some_external_func(%A) : (tensor<4xi32>) -> ()

  return
}

// -----

// Alloc and copy must be inserted because the arith.constant is read-only. The
// function call is inside of an scf.execute_region.

func.func private @some_external_func_within_scf_execute(tensor<4xi32>)

func.func @main() {
  %A = arith.constant dense<[1, 2, 3, 4]> : tensor<4xi32>

// Note: The scf.execute_region canonicalizes away.

  scf.execute_region {
    func.call @some_external_func_within_scf_execute(%A) : (tensor<4xi32>) -> ()
    scf.yield
  }

  return
}

// -----

// A write inside an scf.execute_region. An equivalent tensor is yielded.

func.func private @execute_region_test(%t1 : tensor<?xf32>)
    -> (f32, tensor<?xf32>, f32)
{
  %f1 = arith.constant 0.0 : f32
  %f2 = arith.constant 1.0 : f32
  %idx = arith.constant 7 : index

  // scf.execute_region is canonicalized away after bufferization. So just the
  // memref.store is left over.

  %0, %1, %2 = scf.execute_region -> (f32, tensor<?xf32>, f32) {
    %t2 = tensor.insert %f2 into %t1[%idx] : tensor<?xf32>
    scf.yield %f1, %t2, %f2 : f32, tensor<?xf32>, f32
  }

  return %0, %1, %2 : f32, tensor<?xf32>, f32
}

// -----

module {
  func.func private @foo()->()
  func.func @no_inline_execute_region_not_canonicalized() {
    %c = arith.constant 42 : i32
    %v = scf.execute_region -> i32 no_inline {
      func.call @foo():()->()
      scf.yield %c : i32
    }
    return
  }
}

// -----

func.func private @some_external_func(tensor<?xf32>)

func.func private @scf_for_with_tensor_insert_slice(
    %A : tensor<?xf32>, %B : tensor<?xf32>, %C : tensor<4xf32>,
    %lb : index, %ub : index, %step : index)
  -> (tensor<?xf32>, tensor<?xf32>)
{
  %r0:2 = scf.for %i = %lb to %ub step %step iter_args(%tA = %A, %tB = %B)
      -> (tensor<?xf32>, tensor<?xf32>)
  {
    %ttA = tensor.insert_slice %C into %tA[%i][4][1] : tensor<4xf32> into tensor<?xf32>

    %ttB = tensor.insert_slice %C into %tB[%i][4][1] : tensor<4xf32> into tensor<?xf32>

    // scf.yield is empty and is elided
    scf.yield %ttA, %ttB : tensor<?xf32>, tensor<?xf32>
  }

  // Swaparoo requires bufferizing the whole function to figure out who's who.
  return %r0#1, %r0#0: tensor<?xf32>, tensor<?xf32>
}

func.func @bar(
    %A : tensor<?xf32> {bufferization.writable = true},
    %B : tensor<?xf32> {bufferization.writable = true},
    %C : tensor<4xf32> {bufferization.writable = true},
    %lb : index, %ub : index, %step : index)
  -> (tensor<?xf32>, tensor<?xf32>)
{
  %r0:2 = call @scf_for_with_tensor_insert_slice(%A, %B, %C, %lb, %ub, %step) :
      (tensor<?xf32>, tensor<?xf32>, tensor<4xf32>, index, index, index)
        -> (tensor<?xf32>, tensor<?xf32>)

  // %r0#0 requires a copy because we have no idea what the function is doing.
  call @some_external_func(%r0#0) : (tensor<?xf32>) -> ()

  return %r0#0, %r0#1: tensor<?xf32>, tensor<?xf32>
}

// -----

func.func private @init_and_dot(%a: tensor<64xf32>, %b: tensor<64xf32>, %c: tensor<f32>) -> tensor<f32> {
  %v0 = arith.constant 0.0 : f32

  %d = linalg.fill ins(%v0 : f32) outs(%c : tensor<f32>) -> tensor<f32>

  %e = linalg.dot ins(%a, %b : tensor<64xf32>,tensor<64xf32>)
    outs(%d: tensor<f32>) -> tensor<f32>

  return %e : tensor<f32>
}

func.func @main() {
  %v0 = arith.constant 0.0 : f32
  %v1 = arith.constant 1.0 : f32
  %v2 = arith.constant 2.0 : f32

  %A = bufferization.alloc_tensor() : tensor<64xf32>
  %B = bufferization.alloc_tensor() : tensor<64xf32>
  %C = bufferization.alloc_tensor() : tensor<f32>

  %AA = linalg.fill ins(%v1 : f32) outs(%A : tensor<64xf32>) -> tensor<64xf32>
  %BB = linalg.fill ins(%v2 : f32) outs(%B : tensor<64xf32>) -> tensor<64xf32>
  %CC = linalg.fill ins(%v0 : f32) outs(%C : tensor<f32>) -> tensor<f32>

  %res = call @init_and_dot(%AA, %BB, %CC) :
    (tensor<64xf32>, tensor<64xf32>, tensor<f32>) -> tensor<f32>

  %res2 = tensor.cast %res: tensor<f32> to tensor<*xf32>

  call @printMemrefF32(%res2) : (tensor<*xf32>) -> ()

  return
}

func.func private @printMemrefF32(tensor<*xf32>)

// -----

func.func private @external_func(tensor<?xf32>)

func.func @callee(
    %A : tensor<?xf32> {bufferization.buffer_layout = affine_map<(i)[s0, s1] -> (i)>},
    %B : tensor<?xf32>,
    %C : tensor<?xf32>) {
  call @external_func(%A) : (tensor<?xf32>) -> ()

  call @external_func(%B) : (tensor<?xf32>) -> ()

  call @external_func(%C) : (tensor<?xf32>) -> ()

  return
}

func.func @entry(%A : tensor<?xf32> {bufferization.buffer_layout = affine_map<(i)[s0, s1] -> (i)>, bufferization.writable = false},
                 %B : tensor<?xf32> {bufferization.buffer_layout = affine_map<(i)[s0, s1] -> (i)>, bufferization.writable = false},
                 %C : tensor<?xf32> {bufferization.writable = false}) {
// Note: `callee` does not write to its bbArg directly, but `external_func`
// does. Inside `callee`, the writes via `external_func` do not cause a
// conflict. However, inside `entry`, the writes do cause a conflict because
// %A, %B and %C are not inplaceable. This test case shows that this kind of
// conflict detection has a "transitive" nature.
  call @callee(%A, %B, %C) : (tensor<?xf32>, tensor<?xf32>, tensor<?xf32>) -> ()
  return
}

// -----

// No alloc or copy inside of the loop.

func.func private @inner_func(%t: tensor<?xf32>) -> tensor<?xf32> {
  %f = arith.constant 1.0 : f32
  %c0 = arith.constant 0 : index
  %0 = tensor.insert %f into %t[%c0] : tensor<?xf32>
  return %0 : tensor<?xf32>
}

func.func @equivalent_func_arg(%t0: tensor<?xf32> {bufferization.writable = true},
                               %c0: index, %c10: index, %c1: index) -> tensor<?xf32> {
  %1 = scf.for %iv = %c0 to %c10 step %c1 iter_args(%t1 = %t0) -> (tensor<?xf32>) {
    %3 = func.call @inner_func(%t1) : (tensor<?xf32>) -> tensor<?xf32>
    scf.yield %3 : tensor<?xf32>
  }
  return %1: tensor<?xf32>
}

// -----

// inner_func_2 modifies the bbArg, but the loop yields the original value. A
// buffer copy must be inserted inside the loop.

func.func @inner_func_2(%t: tensor<?xf32>) -> tensor<?xf32> {
  %f = arith.constant 1.0 : f32
  %c0 = arith.constant 0 : index
  %0 = tensor.insert %f into %t[%c0] : tensor<?xf32>
  return %0 : tensor<?xf32>
}

func.func @equivalent_func_arg_2(%t0: tensor<?xf32> {bufferization.writable = true},
                                 %c0: index, %c10: index, %c1: index) -> tensor<?xf32> {
  %1 = scf.for %iv = %c0 to %c10 step %c1 iter_args(%t1 = %t0) -> (tensor<?xf32>) {
    %3 = func.call @inner_func_2(%t1) : (tensor<?xf32>) -> tensor<?xf32>
    scf.yield %t1 : tensor<?xf32>
  }
  return %1: tensor<?xf32>
}

// -----

// Bufferize without fully dynamic layout maps.

func.func @transfer_read(
    %A : tensor<?xf32> {bufferization.writable = false})
  -> (vector<4xf32>)
{
  %c0 = arith.constant 0 : index
  %f0 = arith.constant 0.0 : f32

  %0 = vector.transfer_read %A[%c0], %f0 : tensor<?xf32>, vector<4xf32>

  return %0 : vector<4xf32>
}

// -----

func.func @main() {
  %t = arith.constant dense<[1.0, 2.0, 3.0]> : tensor<3xf32>
  %unranked = tensor.cast %t : tensor<3xf32> to tensor<*xf32>
  func.call @maybe_writing_func(%unranked) : (tensor<*xf32>) -> ()
  return
}

// This function may write to buffer(%ptr).
func.func private @maybe_writing_func(%ptr : tensor<*xf32>)

// -----

// Test if other callables are left intact and don't cause trouble.

llvm.func @llvm_func()

func.func @call_llvm_func() {
  llvm.call @llvm_func() : () -> ()
  return
}

// -----

func.func @to_buffer_op_unsupported(
    %t1: tensor<?xf32> {bufferization.writable = true}, %idx1: index,
    %idx2: index, %idx3: index, %v1: vector<5xf32>) -> (vector<5xf32>) {

  // Insert a copy because we cannot analyze what happens with the result of a
  // to_buffer op.
  %0 = bufferization.to_buffer %t1 : tensor<?xf32> to memref<?xf32>
  "test.foo"(%0) : (memref<?xf32>) -> ()

  %cst = arith.constant 0.0 : f32
  %r1 = vector.transfer_read %t1[%idx3], %cst : tensor<?xf32>, vector<5xf32>

  return %r1 : vector<5xf32>
}

// -----

// Note: The cf.br canonicalizes away, so there's nothing to check here. There
// is a detailed test in ControlFlow/bufferize.mlir.

func.func @br_in_func(%t: tensor<5xf32>) -> tensor<5xf32> {
  cf.br ^bb1(%t : tensor<5xf32>)
^bb1(%arg1 : tensor<5xf32>):
  func.return %arg1 : tensor<5xf32>
}

// -----

// Cyclic call graphs with tensors are not supported by One-Shot Bufferize.
// However, if a function signature does not have any tensor arguments or
// results, calls to that function are not seen as an "edge" in the fuction
// call graph.

func.func @foo(%m: memref<5xf32>) -> memref<5xf32> {
  %0 = tensor.empty() : tensor<5xf32>
  %1 = func.call @bar(%0, %m)
      : (tensor<5xf32>, memref<5xf32>) -> (memref<5xf32>)
  return %1 : memref<5xf32>
}

func.func @bar(%t: tensor<5xf32>, %m: memref<5xf32>) -> memref<5xf32> {
  %0 = func.call @foo(%m) : (memref<5xf32>) -> (memref<5xf32>)
  return %0 : memref<5xf32>
}

// -----

// A recursive function.

func.func @foo(%t: tensor<5xf32>) -> tensor<5xf32> {
  // We are conservative around recursive functions. The analysis cannot handle
  // them, so we have to assume the op operand of the call op bufferizes to a
  // memory read and write. This causes a copy in this test case.
  %0 = call @foo(%t) : (tensor<5xf32>) -> (tensor<5xf32>)

  %c0 = arith.constant 0 : index
  %extr = tensor.extract %t[%c0] : tensor<5xf32>
  vector.print %extr : f32

  return %0 : tensor<5xf32>
}

// -----

// Two functions calling each other recursively.

func.func @foo(%t: tensor<5xf32>) -> tensor<5xf32> {
  %0 = call @bar(%t) : (tensor<5xf32>) -> (tensor<5xf32>)
  return %0 : tensor<5xf32>
}

func.func @bar(%t: tensor<5xf32>) -> tensor<5xf32>{
  %0 = call @foo(%t) : (tensor<5xf32>) -> (tensor<5xf32>)
  return %0 : tensor<5xf32>
}

// -----

// The two func.return operands have different types after bufferization. Make
// sure that memref.cast ops are inserted.

func.func @result_type_mismatch(%c: i1) -> tensor<5xf32> {
  %t = tensor.empty() : tensor<10xf32>
  cf.cond_br %c, ^bb1, ^bb2
^bb1:
  %0 = tensor.extract_slice %t[0][5][2] : tensor<10xf32> to tensor<5xf32>
  return %0 : tensor<5xf32>
^bb2:
  %1 = tensor.extract_slice %t[2][5][1] : tensor<10xf32> to tensor<5xf32>
  return %1 : tensor<5xf32>
}


// -----

func.func @outer_func(%t: tensor<5xf32>) -> tensor<5xf32> {
  return %t : tensor<5xf32>
}

module @inner_module {
  func.func @inner_func(%t: tensor<5xf32> {bufferization.writable = false}) -> tensor<5xf32> {
    return %t : tensor<5xf32>
  }
}

// -----

func.func @custom_types(%arg: !test.test_tensor<[4, 4], f64>)
    -> (!test.test_tensor<[4, 8], f64>, !test.test_tensor<[4, 8], f64>) {
  %out1 = "test.dummy_tensor_op"(%arg) : (!test.test_tensor<[4, 4], f64>)
    -> !test.test_tensor<[4, 8], f64>

  %alloc = "test.create_tensor_op"() : () -> !test.test_tensor<[4, 4], f64>
  %out2 = "test.dummy_tensor_op"(%alloc) : (!test.test_tensor<[4, 4], f64>)
    -> !test.test_tensor<[4, 8], f64>

  return %out1, %out2 :
    !test.test_tensor<[4, 8], f64>, !test.test_tensor<[4, 8], f64>
}

// -----

func.func @custom_types_foo(%arg: !test.test_tensor<[4, 4], f64>)
    -> !test.test_tensor<[4, 4], f64> {
  %out = "test.dummy_tensor_op"(%arg) : (!test.test_tensor<[4, 4], f64>)
    -> !test.test_tensor<[4, 4], f64>
  return %out : !test.test_tensor<[4, 4], f64>
}

func.func @custom_types_bar(%arg: !test.test_tensor<[4, 4], f64>)
    -> !test.test_tensor<[4, 8], f64> {
  %call = func.call @custom_types_foo(%arg) : (!test.test_tensor<[4, 4], f64>)
    -> !test.test_tensor<[4, 4], f64>

  %out = "test.dummy_tensor_op"(%call) : (!test.test_tensor<[4, 4], f64>)
    -> !test.test_tensor<[4, 8], f64>

  return %out : !test.test_tensor<[4, 8], f64>
}

// -----

// Test that foldMemRefCasts does not downgrade a ranked return type to unranked
// when the return value is produced by a memref.cast from unranked to ranked.
func.func @ranked_return_via_unranked_call(%arg0: tensor<64x20x40xf32>) -> tensor<64x20x40xf32> {
  %u = tensor.cast %arg0 : tensor<64x20x40xf32> to tensor<*xf32>
  %r = call @relu_unranked(%u) : (tensor<*xf32>) -> tensor<*xf32>
  %b = tensor.cast %r : tensor<*xf32> to tensor<64x20x40xf32>
  return %b : tensor<64x20x40xf32>
}
func.func private @relu_unranked(tensor<*xf32>) -> tensor<*xf32>

// -----

func.func @custom_types_scf_for_inplace(
    %arg: !test.test_tensor<[4, 4], f64>,
    %lb: index, %ub: index, %step: index)
    -> !test.test_tensor<[4, 4], f64> {
  %loop = scf.for %i = %lb to %ub step %step
      iter_args(%iter = %arg) -> (!test.test_tensor<[4, 4], f64>) {
    // Inside loop: use iter_args directly (this is inplace modifiable op)
    %call = "test.dummy_tensor_op"(%iter) : (!test.test_tensor<[4, 4], f64>)
      -> !test.test_tensor<[4, 4], f64>
    // Yield: return the same iter_args value (or result of inplace op on it)
    scf.yield %call : !test.test_tensor<[4, 4], f64>
  }

  return %loop : !test.test_tensor<[4, 4], f64>
}

// -----

func.func private @custom_types_identity_2d(%arg: !test.test_tensor<[4, 4], f64>)
    -> !test.test_tensor<[4, 4], f64> {
  %out = "test.dummy_tensor_op"(%arg) : (!test.test_tensor<[4, 4], f64>)
    -> !test.test_tensor<[4, 4], f64>
  return %out : !test.test_tensor<[4, 4], f64>
}

// Same as @custom_types_scf_for_inplace, but with an inner call to test alias analysis
// through function boundaries.
func.func @custom_types_scf_for_inplace_with_call(
    %arg: !test.test_tensor<[4, 4], f64>,
    %lb: index, %ub: index, %step: index)
    -> !test.test_tensor<[4, 4], f64> {
  %loop = scf.for %i = %lb to %ub step %step
      iter_args(%iter = %arg) -> (!test.test_tensor<[4, 4], f64>) {
    %call = func.call @custom_types_identity_2d(%iter)
      : (!test.test_tensor<[4, 4], f64>) -> !test.test_tensor<[4, 4], f64>
    scf.yield %call : !test.test_tensor<[4, 4], f64>
  }

  return %loop : !test.test_tensor<[4, 4], f64>
}

// -----

func.func @custom_types_scf_if_inplace(
    %arg: !test.test_tensor<[4, 4], f64>,
    %cond: i1)
    -> !test.test_tensor<[4, 4], f64> {
  %res = scf.if %cond -> (!test.test_tensor<[4, 4], f64>) {
    %dummy = "test.dummy_tensor_op"(%arg) : (!test.test_tensor<[4, 4], f64>)
      -> !test.test_tensor<[4, 4], f64>
    scf.yield %dummy : !test.test_tensor<[4, 4], f64>
  } else {
    scf.yield %arg : !test.test_tensor<[4, 4], f64>
  }
  return %res : !test.test_tensor<[4, 4], f64>
}

// -----

func.func private @custom_types_identity_2d(%arg: !test.test_tensor<[4, 4], f64>)
    -> !test.test_tensor<[4, 4], f64> {
  %out = "test.dummy_tensor_op"(%arg) : (!test.test_tensor<[4, 4], f64>)
    -> !test.test_tensor<[4, 4], f64>
  return %out : !test.test_tensor<[4, 4], f64>
}

func.func @custom_types_scf_if_inplace_with_call(
    %arg: !test.test_tensor<[4, 4], f64>,
    %cond: i1)
    -> !test.test_tensor<[4, 4], f64> {
  %res = scf.if %cond -> (!test.test_tensor<[4, 4], f64>) {
    %call = func.call @custom_types_identity_2d(%arg)
      : (!test.test_tensor<[4, 4], f64>) -> !test.test_tensor<[4, 4], f64>
    scf.yield %call : !test.test_tensor<[4, 4], f64>
  } else {
    scf.yield %arg : !test.test_tensor<[4, 4], f64>
  }
  return %res : !test.test_tensor<[4, 4], f64>
}

// -----

func.func @scf_while_inplace(
    %arg: !test.test_tensor<[4, 4], f64>,
    %cond: i1)
    -> !test.test_tensor<[4, 4], f64> {
  %loop = scf.while (%iter = %arg)
      : (!test.test_tensor<[4, 4], f64>) -> !test.test_tensor<[4, 4], f64> {
    scf.condition(%cond) %iter : !test.test_tensor<[4, 4], f64>
  } do {
  ^bb0(%current: !test.test_tensor<[4, 4], f64>):
    %dummy = "test.dummy_tensor_op"(%current) : (!test.test_tensor<[4, 4], f64>)
      -> !test.test_tensor<[4, 4], f64>
    scf.yield %dummy : !test.test_tensor<[4, 4], f64>
  }
  return %loop : !test.test_tensor<[4, 4], f64>
}

// -----

func.func private @custom_types_identity_2d(%arg: !test.test_tensor<[4, 4], f64>)
    -> !test.test_tensor<[4, 4], f64> {
  %out = "test.dummy_tensor_op"(%arg) : (!test.test_tensor<[4, 4], f64>)
    -> !test.test_tensor<[4, 4], f64>
  return %out : !test.test_tensor<[4, 4], f64>
}

func.func @scf_while_inplace(
    %arg: !test.test_tensor<[4, 4], f64>,
    %cond: i1)
    -> !test.test_tensor<[4, 4], f64> {
  %loop = scf.while (%iter = %arg)
      : (!test.test_tensor<[4, 4], f64>) -> !test.test_tensor<[4, 4], f64> {
    scf.condition(%cond) %iter : !test.test_tensor<[4, 4], f64>
  } do {
  ^bb0(%current: !test.test_tensor<[4, 4], f64>):
    %call = func.call @custom_types_identity_2d(%current)
      : (!test.test_tensor<[4, 4], f64>) -> !test.test_tensor<[4, 4], f64>
    scf.yield %call : !test.test_tensor<[4, 4], f64>
  }
  return %loop : !test.test_tensor<[4, 4], f64>
}
