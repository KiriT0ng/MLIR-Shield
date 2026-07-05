func.func @cast(%arg0: tensor<*xf32>, %arg1 : tensor<4x4xf32>, %arg2: tensor<?x?xf32>) {
  %0 = tensor.cast %arg0 : tensor<*xf32> to tensor<?x?xf32>
  %1 = tensor.cast %arg1 : tensor<4x4xf32> to tensor<*xf32>
  %2 = tensor.cast %arg2 : tensor<?x?xf32> to tensor<4x?xf32>
  %3 = tensor.cast %2 : tensor<4x?xf32> to tensor<?x?xf32>
  return
}

// -----

func.func @concat(%arg0: tensor<4x7x3xf32>, %arg1 : tensor<4x4x3xf32>, %arg2: tensor<?x?x?xf32>) {
  %0 = tensor.concat dim(0) %arg0 : (tensor<4x7x3xf32>) -> tensor<4x7x3xf32>
  %1 = tensor.concat dim(1) %arg0, %arg1 : (tensor<4x7x3xf32>, tensor<4x4x3xf32>) -> tensor<4x11x3xf32>
  %2 = tensor.concat dim(2) %arg0, %arg2 : (tensor<4x7x3xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
  %3 = tensor.concat dim(1) %arg2, %arg2 : (tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> tensor<?x10x?xf32>
  %4 = tensor.concat dim(1) %arg2, %arg1, %arg0 : (tensor<?x?x?xf32>, tensor<4x4x3xf32>, tensor<4x7x3xf32>) -> tensor<4x?x3xf32>
  return
}

// -----

func.func @empty(%sz: index) -> tensor<5x?x6xf32> {
  %0 = tensor.empty(%sz) : tensor<5x?x6xf32>
  return %0 : tensor<5x?x6xf32>
}

// -----

func.func @empty_with_encoding(%sz: index) -> tensor<5x?x6xf32, "foo"> {
  %0 = tensor.empty(%sz) : tensor<5x?x6xf32, "foo">
  return %0 : tensor<5x?x6xf32, "foo">
}

// -----

func.func @extract(%arg0: tensor<?x?x?xf32>, %arg1: index) {
  %0 = tensor.extract %arg0[%arg1, %arg1, %arg1] : tensor<?x?x?xf32>
  return
}

// -----

func.func @insert(%arg0: f32, %arg1: index, %arg2: tensor<?x?x?xf32>) {
  %0 = tensor.insert %arg0 into %arg2[%arg1, %arg1, %arg1] : tensor<?x?x?xf32>
  return
}

// -----

func.func @tensor.from_elements() {
  %c0 = "arith.constant"() {value = 0: index} : () -> index
  %0 = tensor.from_elements %c0 : tensor<1xindex>

  %c1 = "arith.constant"() {value = 1: index} : () -> index
  %1 = tensor.from_elements %c0, %c1 : tensor<2xindex>

  %c0_f32 = "arith.constant"() {value = 0.0: f32} : () -> f32
  %2 = tensor.from_elements %c0_f32 : tensor<1xf32>

  %3 = tensor.from_elements : tensor<0xindex>

  %4 = tensor.from_elements %c0, %c1, %c0, %c1, %c0, %c1 : tensor<2x3xindex>

  %5 = tensor.from_elements %c0 : tensor<index>
  return
}

// -----

func.func @tensor.generate(%m : index, %n : index)
    -> tensor<?x3x?xf32> {
  %tnsr = tensor.generate %m, %n {
    ^bb0(%i : index, %j : index, %k : index):
      %elem = arith.constant 8.0 : f32
      tensor.yield %elem : f32
  } : tensor<?x3x?xf32>
  return %tnsr : tensor<?x3x?xf32>
}

// -----

func.func @tensor_reshape(%unranked: tensor<*xf32>, %shape1: tensor<1xi32>,
         %shape2: tensor<2xi32>, %shape3: tensor<?xi32>) -> tensor<*xf32> {
  %dyn_vec = tensor.reshape %unranked(%shape1)
               : (tensor<*xf32>, tensor<1xi32>) -> tensor<?xf32>
  %dyn_mat = tensor.reshape %dyn_vec(%shape2)
               : (tensor<?xf32>, tensor<2xi32>) -> tensor<?x?xf32>
  %new_unranked = tensor.reshape %dyn_mat(%shape3)
               : (tensor<?x?xf32>, tensor<?xi32>) -> tensor<*xf32>
  return %new_unranked : tensor<*xf32>
}

// -----

func.func @slice(%t: tensor<8x16x4xf32>, %idx : index) {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index

  %1 = tensor.extract_slice %t[%c0, %c0, %c0][%idx, %idx, %idx][%c1, %c1, %c1]
    : tensor<8x16x4xf32> to tensor<?x?x?xf32>

  %2 = tensor.extract_slice %t[0, 2, 0][4, 4, 4][1, 1, 1]
    : tensor<8x16x4xf32> to tensor<4x4x4xf32>

  %3 = tensor.extract_slice %t[0, 2, 0][4, 1, 4][1, 1, 1]
    : tensor<8x16x4xf32> to tensor<4x4xf32>

  return
}

// -----

func.func @insert_slice(
    %t: tensor<8x16x4xf32>,
    %td: tensor<8x?x4xf32>,
    %t2: tensor<16x32x8xf32>,
    %t3: tensor<4x4xf32>,
    %idx : index,
    %sz : index) {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index

  %1 = tensor.insert_slice %t into %t2[%c0, %c0, %c0][8, 16, 4][%c1, %c1, %c1]
    : tensor<8x16x4xf32> into tensor<16x32x8xf32>

  %2 = tensor.insert_slice %t into %t2[%c0, %idx, %c0][8, 16, 4][%c1, 1, %c1]
    : tensor<8x16x4xf32> into tensor<16x32x8xf32>

  %3 = tensor.insert_slice %t3 into %t[0, 2, 0][4, 1, 4][1, 1, 1]
    : tensor<4x4xf32> into tensor<8x16x4xf32>

  %4 = tensor.insert_slice %td into %t[0, %idx, 0][8, %sz, 4][1, 1, 1]
    : tensor<8x?x4xf32> into tensor<8x16x4xf32>

  return
}

// -----

func.func @tensor_reshape_zero_dim(%arg0 : tensor<1x1xf32>, %arg1 : tensor<f32>)
    -> (tensor<f32>, tensor<1x1xf32>) {
  %0 = tensor.collapse_shape %arg0 [] : tensor<1x1xf32> into tensor<f32>
  %1 = tensor.expand_shape %0 [] output_shape [1, 1] : tensor<f32> into tensor<1x1xf32>
  return %0, %1 : tensor<f32>, tensor<1x1xf32>
}

// -----

func.func @tensor_expand_shape_dynamic_dim(%arg0 : tensor<?x?xf32>, %sz0 : index, %sz1 : index, %sz2 : index)
    -> (tensor<5x?x?x?xf32>) {
  %1 = tensor.expand_shape %arg0 [[0, 1], [2, 3]] output_shape [5, %sz0, %sz1, %sz2] : tensor<?x?xf32> into tensor<5x?x?x?xf32>
  return %1 : tensor<5x?x?x?xf32>
}



// -----

func.func @legal_collapsing_reshape_dynamic_tensor
  (%arg0: tensor<?x?x?x4x?xf32>) -> tensor<?x?x?xf32>
{
  %0 = tensor.collapse_shape %arg0 [[0], [1], [2, 3, 4]] :
    tensor<?x?x?x4x?xf32> into tensor<?x?x?xf32>
  return %0 : tensor<?x?x?xf32>
}

// -----

func.func @rank(%t : tensor<4x4x?xf32>) {
  %0 = "tensor.rank"(%t) : (tensor<4x4x?xf32>) -> index

  %1 = tensor.rank %t : tensor<4x4x?xf32>
  return
}

// -----

func.func @pad_dynamic(%arg0: tensor<1x2x2x?xf32>, %low: index, %high: index,
                  %pad_value: f32) -> tensor<6x?x?x?xf32> {
  %0 = tensor.pad %arg0 low[2, %low, 3, 3] high[3, 3, %high, 2] {
    ^bb0(%arg1: index, %arg2: index, %arg3: index, %arg4: index):
      tensor.yield %pad_value : f32
    } : tensor<1x2x2x?xf32> to tensor<6x?x?x?xf32>
  return %0 : tensor<6x?x?x?xf32>
}

// -----

func.func @pad_static(%arg0: tensor<3x4xf32>, %pad_value: f32) -> tensor<6x9xf32> {
  %0 = tensor.pad %arg0 low[1, 2] high[2, 3] {
    ^bb0(%arg1 : index, %arg2 : index):
      tensor.yield %pad_value : f32
    } : tensor<3x4xf32> to tensor<6x9xf32>
  return %0 : tensor<6x9xf32>
}

// -----

func.func @pad_asymmetrical(%arg0: tensor<2x3xf32>, %ub0: index, %ub1: index,
                       %pad_value: f32) -> tensor<?x?xf32> {
  %0 = tensor.pad %arg0 low[0, 0] high[%ub0, %ub1] {
    ^bb0(%arg1: index, %arg2: index):
      tensor.yield %pad_value : f32
    } : tensor<2x3xf32> to tensor<?x?xf32>
  return %0 : tensor<?x?xf32>
}

// -----

func.func @pad_to_static_size(%arg0: tensor<?x?xf32>, %ub0: index, %ub1: index,
                         %pad_value: f32) -> tensor<2x3xf32> {
  %0 = tensor.pad %arg0 low[0, 0] high[%ub0, %ub1] {
    ^bb0(%arg1: index, %arg2: index):
      tensor.yield %pad_value : f32
    } : tensor<?x?xf32> to tensor<2x3xf32>
  return %0 : tensor<2x3xf32>
}

// -----

func.func @test_splat_op(%s : f32, %p : !llvm.ptr) {
  %v = tensor.splat %s : tensor<8xf32>

  %u = "tensor.splat"(%s) : (f32) -> tensor<4xf32>

  %w = tensor.splat %p : tensor<8x!llvm.ptr>
  return
}

func.func @test_splat_op_dynamic(%s: f32, %m: index, %n: index) {
  %v = tensor.splat %s[%m, %n] : tensor<?x8x?xf32>
  return
}

// -----

func.func @gather_scatter(
    %dest : tensor<4x5x6xf32>, %indices: tensor<1x3x2xindex>, %indices_i32: tensor<1x3x2xi32>) {
  %gathered = tensor.gather %dest[%indices_i32] gather_dims([1, 2]) unique:
    (tensor<4x5x6xf32>, tensor<1x3x2xi32>) -> tensor<1x3x4x1x1xf32>
  %rank_reduced_gathered = tensor.gather %dest[%indices] gather_dims([1, 2]) unique:
    (tensor<4x5x6xf32>, tensor<1x3x2xindex>) -> tensor<1x3x4xf32>

  %scattered = tensor.scatter %gathered into %dest[%indices]
      scatter_dims([1, 2]) unique:
    (tensor<1x3x4x1x1xf32>, tensor<4x5x6xf32>, tensor<1x3x2xindex>) -> tensor<4x5x6xf32>
  %rank_reduced_scattered = tensor.scatter %rank_reduced_gathered into %dest[%indices_i32]
      scatter_dims([1, 2]) unique:
    (tensor<1x3x4xf32>, tensor<4x5x6xf32>, tensor<1x3x2xi32>) -> tensor<4x5x6xf32>
  return
}
