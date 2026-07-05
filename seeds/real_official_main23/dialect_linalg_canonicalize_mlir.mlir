func.func @memref_cast(%a: index, %b: index) -> memref<?x?xf32> {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c8 = arith.constant 8 : index
  %c16 = arith.constant 16 : index
  %1 = memref.alloc (%b) : memref<?xi8>
  %2 = memref.view %1[%c0][] : memref<?xi8> to memref<16x16xf32>
  %3 = memref.cast %2 : memref<16x16xf32> to memref<?x?xf32>

  linalg.matmul ins(%3, %3: memref<?x?xf32>, memref<?x?xf32>)
               outs(%3: memref<?x?xf32>)
  return %3: memref<?x?xf32>
}

// -----

#accesses = [
  affine_map<(i) -> (i)>
]

#trait = {
  indexing_maps = #accesses,
  iterator_types = ["parallel"]
}

func.func @dce_zero_memref(%arg0 : memref<0xf32>, %arg1: tensor<0xf32>) -> tensor<0xf32> {
  // memref<0x32> is expected to be dce'ed
  memref.copy %arg0, %arg0 : memref<0xf32> to memref<0xf32>

  // tensor<0xf32> cannot be dce'ed
  %1 = linalg.generic #trait outs(%arg1 : tensor<0xf32>) {
  ^bb(%0: f32) :
    linalg.yield %0 : f32
  } -> tensor<0xf32>

  return %1: tensor<0xf32>
}

// -----

func.func @dce_self_linalg_copy(%arg0 : memref<?xf32>) {
  linalg.copy ins(%arg0: memref<?xf32>) outs(%arg0: memref<?xf32>)
  return
}


// -----

func.func @tensor.cast(%a : tensor<3x4xf32>, %b : tensor<4x?xf32>, %c : tensor<3x?xf32>)
  -> tensor<3x?xf32>
{
  %ta = tensor.cast %a : tensor<3x4xf32> to tensor<?x?xf32>
  %tb = tensor.cast %b : tensor<4x?xf32> to tensor<?x?xf32>
  %tc = tensor.cast %c : tensor<3x?xf32> to tensor<?x?xf32>

  %0 = linalg.matmul ins(%ta, %tb: tensor<?x?xf32>, tensor<?x?xf32>)
                    outs(%tc: tensor<?x?xf32>) -> tensor<?x?xf32>

  %1 = tensor.cast %0 : tensor<?x?xf32> to tensor<3x?xf32>

  return %1: tensor<3x?xf32>
}

// -----

func.func @tensor.cast.unranked(%a : tensor<*xf32>, %b : tensor<*xf32>, %c : tensor<*xf32>)
  -> tensor<*xf32>
{
  %ta = tensor.cast %a : tensor<*xf32> to tensor<?x?xf32>
  %tb = tensor.cast %b : tensor<*xf32> to tensor<?x?xf32>
  %tc = tensor.cast %c : tensor<*xf32> to tensor<?x?xf32>

  %0 = linalg.matmul ins(%ta, %tb: tensor<?x?xf32>, tensor<?x?xf32>)
                    outs(%tc: tensor<?x?xf32>) -> tensor<?x?xf32>

  %1 = tensor.cast %0 : tensor<?x?xf32> to tensor<*xf32>

  return %1: tensor<*xf32>
}

// -----

func.func @linalg_effects(
    %a : tensor<?x?xf32>, %b : tensor<?x?xf32>, %c : tensor<?x?xf32>,
    %d : memref<?x?xf32>, %e : memref<?x?xf32>, %f : memref<?x?xf32>) {
  %t = linalg.matmul ins(%a, %b : tensor<?x?xf32>, tensor<?x?xf32>)
                    outs(%c : tensor<?x?xf32>) -> tensor<?x?xf32>

  linalg.matmul ins(%d, %e : memref<?x?xf32>, memref<?x?xf32>)
               outs(%f : memref<?x?xf32>)
  return
}

// -----

#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
func.func @remove_no_op(%arg0 : tensor<?x?x?xf32>, %arg1 : tensor<?x?x?xf32>)
  -> (tensor<?x?x?xf32>, tensor<?x?x?xf32>) {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c2 = arith.constant 2 : index
  %0 = tensor.dim %arg0, %c0 : tensor<?x?x?xf32>
  %1 = tensor.dim %arg0, %c1 : tensor<?x?x?xf32>
  %2 = tensor.dim %arg0, %c2 : tensor<?x?x?xf32>
  %3 = tensor.empty(%0, %1, %2) : tensor<?x?x?xf32>
  %4, %5 = linalg.generic {
    indexing_maps = [#map, #map, #map, #map],
    iterator_types = ["parallel", "parallel", "parallel"]
  } ins(%arg0, %arg1 : tensor<?x?x?xf32>, tensor<?x?x?xf32>)
    outs(%3, %3 : tensor<?x?x?xf32>, tensor<?x?x?xf32>) {
  ^bb0(%arg2 : f32, %arg3 : f32, %arg4 : f32, %arg5 : f32):
    linalg.yield %arg3, %arg2 : f32, f32
  } -> (tensor<?x?x?xf32>, tensor<?x?x?xf32>)
  return %4, %5 : tensor<?x?x?xf32>, tensor<?x?x?xf32>
}

// -----

#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
func.func @remove_no_op_mismatched_types(%arg0 : tensor<?x?x?xf32>)
  -> tensor<1x2x3xf32> {
  %out = tensor.empty() : tensor<1x2x3xf32>
  %g = linalg.generic {
    indexing_maps = [#map, #map],
    iterator_types = ["parallel", "parallel", "parallel"]
  } ins(%arg0 : tensor<?x?x?xf32>)
    outs(%out : tensor<1x2x3xf32>) {
  ^bb0(%arg2 : f32, %arg3 : f32):
    linalg.yield %arg2 : f32
  } -> (tensor<1x2x3xf32>)
  return %g : tensor<1x2x3xf32>
}

// -----

#map = affine_map<() -> ()>
func.func @cant_fold_to_tensor_cast(%arg0 : f32) -> tensor<f32> {
  %out = tensor.empty() : tensor<f32>
  %g = linalg.generic {
    indexing_maps = [#map, #map],
    iterator_types = []
  } ins(%arg0 : f32)
    outs(%out : tensor<f32>) {
  ^bb0(%arg2 : f32, %arg3 : f32):
    linalg.yield %arg2 : f32
  } -> (tensor<f32>)
  return %g : tensor<f32>
}

// -----

#map = affine_map<(d0, d1) -> (d0, d1)>
func.func @keep_not_noop(%arg0 : tensor<?x?xf32>) -> tensor<?x?xf32> {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %cst = arith.constant 1.000000e+00 : f32
  %0 = tensor.dim %arg0, %c0 : tensor<?x?xf32>
  %1 = tensor.dim %arg0, %c1 : tensor<?x?xf32>
  %2 = tensor.empty(%0, %1) : tensor<?x?xf32>
  cf.br ^bb1(%cst : f32)

^bb1(%arg1 : f32):
  %3 = linalg.generic
    {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel"]}
    ins(%arg0 : tensor<?x?xf32>) outs(%2 : tensor<?x?xf32>) {
    ^bb0(%arg2: f32, %arg3 : f32):
      linalg.yield %arg1 : f32
    } -> tensor<?x?xf32>
  return %3 : tensor<?x?xf32>
}

// -----

#map = affine_map<(d0, d1) -> (d0, d1)>
func.func @keep_not_noop(%arg0 : tensor<?x?xf32>, %arg1 : tensor<?x?xf32>)
  -> (tensor<?x?xf32>, tensor<?x?xf32>) {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %cst = arith.constant 1.000000e+00 : f32
  %0 = tensor.dim %arg0, %c0 : tensor<?x?xf32>
  %1 = tensor.dim %arg0, %c1 : tensor<?x?xf32>
  %2 = tensor.empty(%0, %1) : tensor<?x?xf32>
  cf.br ^bb1(%cst : f32)

^bb1(%arg2 : f32):
  %3:2 = linalg.generic
    {indexing_maps = [#map, #map, #map, #map],
     iterator_types = ["parallel", "parallel"]}
    ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>)
    outs(%2, %2 : tensor<?x?xf32>, tensor<?x?xf32>) {
    ^bb0(%arg3: f32, %arg4 : f32, %arg5 : f32, %arg6 : f32):
      linalg.yield %arg2, %arg4 : f32, f32
    } -> (tensor<?x?xf32>, tensor<?x?xf32>)
  return %3#0, %3#1 : tensor<?x?xf32>, tensor<?x?xf32>
}

// -----

#accesses = [
  affine_map<(i, j) -> (i, j)>
]

#trait = {
  indexing_maps = #accesses,
  iterator_types = ["parallel", "parallel"]
}

func.func @dead_linalg_tensor(%arg0 : tensor<7x7xi32>, %arg1 : tensor<7x7xf32>,
                         %arg2: tensor<?x?xf32>, %high : index) {
  %c0_i32 = arith.constant 0 : i32
  %c0 = arith.constant 0 : index
  %cst = arith.constant 0.000000e+00 : f32
  %0 = linalg.fill ins(%c0_i32 : i32) outs(%arg0 : tensor<7x7xi32>) -> tensor<7x7xi32>
  %1 = linalg.matmul ins(%arg1, %arg1: tensor<7x7xf32>, tensor<7x7xf32>)
                     outs(%arg1: tensor<7x7xf32>) -> tensor<7x7xf32>
  %2 = linalg.generic #trait outs(%arg0 : tensor<7x7xi32>) {
  ^bb(%3: i32) :
    linalg.yield %3 : i32
  } -> tensor<7x7xi32>
  %3 = tensor.pad %arg2 low[%c0, %c0] high[%high, %high] {
        ^bb0(%arg9: index, %arg10: index):
          tensor.yield %cst : f32
  } : tensor<?x?xf32> to tensor<2x4xf32>
  return
}

// -----

func.func @propagate_casts(%arg0 : tensor<?x?xf32>, %arg1 : f32, %arg2 : index,
    %arg3 : index) -> tensor<?x?xf32> {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c21 = arith.constant 21 : index
  %c42 = arith.constant 42 : index
  %0 = tensor.empty(%c21, %c42) : tensor<?x?xf32>
  %1 = linalg.fill ins(%arg1 : f32) outs(%0 : tensor<?x?xf32>) -> tensor<?x?xf32>
  %2 = tensor.dim %arg0, %c0 : tensor<?x?xf32>
  %3 = tensor.dim %arg0, %c1 : tensor<?x?xf32>
  %4 = tensor.insert_slice %arg0 into %1[%arg2, %arg3] [%2, %3] [1, 1] : tensor<?x?xf32> into tensor<?x?xf32>
  return %4 : tensor<?x?xf32>
}

// -----

func.func @self_copy(%arg0 : memref<2x3x?x4xf32>) {

  memref.copy %arg0, %arg0 : memref<2x3x?x4xf32> to memref<2x3x?x4xf32>

  return
}

// -----

func.func @fold_linalg_index_tensor_static(%0: tensor<4x16xi32>, %1: tensor<1x16xi32>,
                                           %2: tensor<4x1xi32>) -> tensor<4x1xi32> {
  %res = linalg.generic {indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>,
                                          affine_map<(d0, d1, d2) -> (d1, d2)>,
                                          affine_map<(d0, d1, d2) -> (d0, d1)>],
                         iterator_types = ["parallel", "parallel", "reduction"]}
    ins(%0, %1 : tensor<4x16xi32>, tensor<1x16xi32>)
    outs(%2 : tensor<4x1xi32>) {
      ^bb0(%lhs: i32, %rhs: i32, %out: i32):
        %idx0 = linalg.index 0 : index
        %idx1 = linalg.index 1 : index
        %idx2 = linalg.index 2 : index
        %add0 = arith.addi %idx0, %idx1 : index
        %add1 = arith.addi %add0, %idx2 : index
        %int = arith.index_cast %add1 : index to i32
        linalg.yield %int : i32
    } -> tensor<4x1xi32>
  return %res : tensor<4x1xi32>
}

// -----

func.func @fold_linalg_index_tensor_dynamic(%0: tensor<?x1xi32>,
                                            %1: tensor<?x1xi32>) -> tensor<?x1xi32> {
  %res = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>,
                                          affine_map<(d0, d1) -> (d1, d1)>],
                         iterator_types = ["parallel", "parallel"]}
    ins(%0 : tensor<?x1xi32>)
    outs(%1 : tensor<?x1xi32>) {
      ^bb0(%lhs: i32, %out: i32):
        %idx0 = linalg.index 0 : index
        %idx1 = linalg.index 1 : index
        %add = arith.addi %idx0, %idx1 : index
        %int = arith.index_cast %add : index to i32
        linalg.yield %int : i32
    } -> tensor<?x1xi32>
  return %res : tensor<?x1xi32>
}

// -----

func.func @fold_linalg_index_memref(%0: memref<1x?xi32>, %1: memref<1x?xi32>) {
  linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>,
                                   affine_map<(d0, d1) -> (d1, d1)>],
                  iterator_types = ["parallel", "parallel"]}
    ins(%0 : memref<1x?xi32>)
    outs(%1 : memref<1x?xi32>) {
      ^bb0(%lhs: i32, %out: i32):
        %idx0 = linalg.index 0 : index
        %idx1 = linalg.index 1 : index
        %add = arith.addi %idx0, %idx1 : index
        %int = arith.index_cast %add : index to i32
        linalg.yield %int : i32
    }
  return
}

// -----

func.func @fold_fill_reshape() -> tensor<6x4xf32> {
  %zero = arith.constant 0.0 : f32
  %empty = tensor.empty() : tensor<1x2x3x4xf32>
  %fill = linalg.fill ins(%zero : f32) outs(%empty : tensor<1x2x3x4xf32>) -> tensor<1x2x3x4xf32>
  %reshape = tensor.collapse_shape %fill [[0, 1, 2], [3]]
      : tensor<1x2x3x4xf32> into tensor<6x4xf32>
  return %reshape : tensor<6x4xf32>
}

// -----

func.func @fold_fill_reshape_dynamic(%arg0 : tensor<?x?x?x?x?xf32>) -> tensor<?x?xf32> {
  %zero = arith.constant 0.0 : f32
  %0 = linalg.fill ins(%zero : f32) outs(%arg0 : tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32>
  %1 = tensor.collapse_shape %0 [[0, 1, 2], [3, 4]]
      : tensor<?x?x?x?x?xf32> into tensor<?x?xf32>
  return %1 : tensor<?x?xf32>
}

// -----
func.func @fold_fill_extract(%arg0 : i1) -> i1 {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index

  %empty_dynamic = tensor.empty(%c1) : tensor<1x2x3x?xi1>
  %filled = linalg.fill ins(%arg0 : i1) outs(%empty_dynamic : tensor<1x2x3x?xi1>) -> tensor<1x2x3x?xi1>

  %extracted = tensor.extract %filled[%c0, %c0, %c0, %c0] : tensor<1x2x3x?xi1>

  return %extracted : i1
}

// -----

func.func @fill_pack() -> tensor<24x32x16x16xf32> {
  %dest = tensor.empty() : tensor<384x512xf32>
  %cst = arith.constant 0.000000e+00 : f32
  %0 = tensor.empty() : tensor<24x32x16x16xf32>
  %1 = linalg.fill ins(%cst : f32) outs(%dest : tensor<384x512xf32>) -> tensor<384x512xf32>
  %pack = linalg.pack %1 inner_dims_pos = [0, 1] inner_tiles = [16, 16] into %0 : tensor<384x512xf32> -> tensor<24x32x16x16xf32>
  return %pack : tensor<24x32x16x16xf32>
}

// -----

func.func @fill_pack_general() -> tensor<1x1x8x4x4x8xi32>{
  %c0_i32 = arith.constant 0 : i32
  %alloc = memref.alloc() : memref<1x1x8x4x4x8xi32>
  %9 = tensor.empty() : tensor<1x1x16x64xi32>
  %extracted_slice_15 = tensor.extract_slice %9[0, 0, 0, 0] [1, 1, 16, 64] [1, 1, 1, 1] : tensor<1x1x16x64xi32> to tensor<1x1x16x64xi32>
  %16 = linalg.fill ins(%c0_i32 : i32) outs(%extracted_slice_15 : tensor<1x1x16x64xi32>) -> tensor<1x1x16x64xi32>
  %0 = bufferization.to_tensor %alloc restrict writable : memref<1x1x8x4x4x8xi32> to tensor<1x1x8x4x4x8xi32>
  %pack_18 = linalg.pack %16 outer_dims_perm = [0, 1, 3, 2] inner_dims_pos = [2, 3] inner_tiles = [4, 8] into %0 : tensor<1x1x16x64xi32> -> tensor<1x1x8x4x4x8xi32>
  return %pack_18 : tensor<1x1x8x4x4x8xi32>
}


// -----

#map = affine_map<()[s0] -> (s0 ceildiv 16)>
func.func @dynamic_fill_pack(%arg0: tensor<?x?xf32>) -> tensor<?x?x16x16xf32> {
  %cst = arith.constant 0.000000e+00 : f32
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %0 = linalg.fill ins(%cst : f32) outs(%arg0 : tensor<?x?xf32>) -> tensor<?x?xf32>
  %dim = tensor.dim %0, %c0 : tensor<?x?xf32>
  %dim_0 = tensor.dim %0, %c1 : tensor<?x?xf32>
  %1 = affine.apply #map()[%dim]
  %2 = affine.apply #map()[%dim_0]
  %3 = tensor.empty(%1, %2) : tensor<?x?x16x16xf32>
  %pack = linalg.pack %0 padding_value(%cst : f32) inner_dims_pos = [0, 1] inner_tiles = [16, 16] into %3 : tensor<?x?xf32> -> tensor<?x?x16x16xf32>
  return %pack : tensor<?x?x16x16xf32>
}

// -----

func.func @fold_self_copy(%0 : memref<4x16xf32>) {
  linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>,
                                   affine_map<(d0, d1) -> (d0, d1)>],
                  iterator_types = ["parallel", "parallel"]}
    ins(%0 : memref<4x16xf32>)
    outs(%0 : memref<4x16xf32>) {
      ^bb0(%arg4: f32, %arg5: f32):
        linalg.yield %arg4 : f32
    }
  return
}

// -----

func.func @negative_fold_fill_like_memref(%in_out : memref<4x16xf32>, %fill_val : f32) {
  linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>,
                                   affine_map<(d0, d1) -> (d0, d1)>],
                  iterator_types = ["parallel", "parallel"]}
    ins(%in_out : memref<4x16xf32>)
    outs(%in_out : memref<4x16xf32>) {
      ^bb0(%arg0: f32, %arg1: f32):
        linalg.yield %fill_val : f32
  }
  return
}

// -----

func.func @negative_fold_fill_like_tensor(%in_out : tensor<4x16xf32>, %fill_val : f32) -> tensor<4x16xf32> {
  %result = linalg.generic {indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>,
                                   affine_map<(d0, d1) -> (d0, d1)>],
                  iterator_types = ["parallel", "parallel"]}
    ins(%in_out : tensor<4x16xf32>)
    outs(%in_out : tensor<4x16xf32>) {
      ^bb0(%arg0: f32, %arg1: f32):
        linalg.yield %fill_val : f32
  } -> tensor<4x16xf32>
  return %result : tensor<4x16xf32>
}

func.func @fold_static_pad_fill() -> tensor<412x276xf32> {
  %f0 = arith.constant 0.0 : f32
  %empty = tensor.empty() : tensor<400x273xf32>
  %fill = linalg.fill ins(%f0 : f32) outs(%empty : tensor<400x273xf32>) -> tensor<400x273xf32>
  %pad = tensor.pad %fill low[4, 1] high[8, 2] {
  ^bb0(%arg1: index, %arg2: index):
    tensor.yield %f0 : f32
  } : tensor<400x273xf32> to tensor<412x276xf32>
  return %pad : tensor<412x276xf32>
}

// -----



func.func @fold_dynamic_pad_fill(%empty: tensor<8x?x16x32xf32>, %low0: index, %low3: index, %high2: index, %high3: index) -> tensor<?x?x?x?xf32> {
  %f0 = arith.constant 0.0 : f32
  %fill = linalg.fill ins(%f0 : f32) outs(%empty : tensor<8x?x16x32xf32>) -> tensor<8x?x16x32xf32>
  %pad = tensor.pad %fill low[%low0, 8, 7, %low3] high[1, 2, %high2, %high3] {
  ^bb0(%arg1: index, %arg2: index, %arg3: index, %arg4: index):
    tensor.yield %f0 : f32
  } : tensor<8x?x16x32xf32> to tensor<?x?x?x?xf32>
  return %pad : tensor<?x?x?x?xf32>
}

// -----

func.func @negative_fold_pad_fill_value_mismatch() -> tensor<412x276xf32> {
  %f0 = arith.constant 0.0 : f32
  %f1 = arith.constant 1.0 : f32
  %empty = tensor.empty() : tensor<400x273xf32>
  %fill = linalg.fill ins(%f0 : f32) outs(%empty : tensor<400x273xf32>) -> tensor<400x273xf32>
  %pad = tensor.pad %fill low[4, 1] high[8, 2] {
  ^bb0(%arg1: index, %arg2: index):
    tensor.yield %f1 : f32
  } : tensor<400x273xf32> to tensor<412x276xf32>
  return %pad : tensor<412x276xf32>
}

// -----

// Tests below verify whether static information is propagated through all the operands of generic op.
// 1. If one of the inputs of generic op has static info and it has no cast source.
// 2. If one of the inputs of generic op has static info and it is coming from tensr.cast operation.
// 3. If one of the outputs of generic op has static info and it is coming from tenso.cast operation.
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
func.func @static_input_without_cast(%arg0 : tensor<2x3x4xf32>, %arg1: tensor<?x?x?xf32>) -> tensor<2x3x4xf32> {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c2 = arith.constant 2 : index
  %0 = tensor.dim %arg0, %c0 : tensor<2x3x4xf32>
  %1 = tensor.dim %arg0, %c1 : tensor<2x3x4xf32>
  %2 = tensor.dim %arg0, %c2 : tensor<2x3x4xf32>
  %3 = tensor.empty(%0, %1, %2) : tensor<?x?x?xf32>
  %4 = linalg.generic {
    indexing_maps = [#map, #map, #map],
    iterator_types = ["parallel", "parallel", "parallel"]
  } ins(%arg0, %arg1 : tensor<2x3x4xf32>, tensor<?x?x?xf32>)
    outs(%3 : tensor<?x?x?xf32>) {
  ^bb0(%arg2 : f32, %arg3 : f32, %arg4 : f32):
    %9 = arith.addf %arg2, %arg3 : f32
    linalg.yield %9 : f32
  } -> (tensor<?x?x?xf32>)
  %5 = tensor.cast %4 : tensor<?x?x?xf32> to tensor<2x3x4xf32>
  return %5 : tensor<2x3x4xf32>
}

// -----

#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
func.func @static_input_with_cast(%arg0 : tensor<2x3x4xf32>, %arg1: tensor<?x?x?xf32>) -> tensor<2x3x4xf32> {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c2 = arith.constant 2 : index
  %0 = tensor.dim %arg0, %c0 : tensor<2x3x4xf32>
  %1 = tensor.dim %arg0, %c1 : tensor<2x3x4xf32>
  %2 = tensor.dim %arg0, %c2 : tensor<2x3x4xf32>
  %3 = tensor.empty(%0, %1, %2) : tensor<?x?x?xf32>
  %4 = tensor.cast %arg1 : tensor<?x?x?xf32> to tensor<2x?x?xf32>
  %5 = linalg.generic {
    indexing_maps = [#map, #map, #map],
    iterator_types = ["parallel", "parallel", "parallel"]
  } ins(%arg0, %4 : tensor<2x3x4xf32>, tensor<2x?x?xf32>)
    outs(%3 : tensor<?x?x?xf32>) {
  ^bb0(%arg2 : f32, %arg3 : f32, %arg4 : f32):
    %9 = arith.addf %arg2, %arg3 : f32
    linalg.yield %9 : f32
  } -> (tensor<?x?x?xf32>)
  %6 = tensor.cast %5 : tensor<?x?x?xf32> to tensor<2x3x4xf32>
  return %6: tensor<2x3x4xf32>
}

// -----

#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
func.func @static_output_with_cast(%arg0 : tensor<?x?x?xf32>, %arg1: tensor<?x?x?xf32>, %arg2: tensor<2x3x4xf32>) -> tensor<2x3x4xf32> {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c2 = arith.constant 2 : index
  %0 = tensor.dim %arg2, %c0 : tensor<2x3x4xf32>
  %1 = tensor.dim %arg2, %c1 : tensor<2x3x4xf32>
  %2 = tensor.dim %arg2, %c2 : tensor<2x3x4xf32>
  %3 = tensor.empty(%0, %1, %2) : tensor<?x?x?xf32>
  %4 = tensor.cast %3 : tensor<?x?x?xf32> to tensor<2x3x4xf32>
  %5 = tensor.cast %arg1 : tensor<?x?x?xf32> to tensor<2x?x?xf32>
  %6 = linalg.generic {
    indexing_maps = [#map, #map, #map],
    iterator_types = ["parallel", "parallel", "parallel"]
  } ins(%arg0, %5 : tensor<?x?x?xf32>, tensor<2x?x?xf32>)
    outs(%4 : tensor<2x3x4xf32>) {
  ^bb0(%arg3 : f32, %arg4 : f32, %arg5 : f32):
    %9 = arith.addf %arg3, %arg4 : f32
    linalg.yield %9 : f32
  } -> (tensor<2x3x4xf32>)
  return %6: tensor<2x3x4xf32>
}

// -----

// This test checks the folding of tensor.cast operation when the source value of cast
// has more static information than the destination value.
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
func.func @cast_source(%arg0 : tensor<2x3x4xf32>, %arg1: tensor<2x3x4xf32>) -> tensor<2x3x4xf32> {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c2 = arith.constant 2 : index
  %0 = tensor.dim %arg0, %c0 : tensor<2x3x4xf32>
  %1 = tensor.dim %arg0, %c1 : tensor<2x3x4xf32>
  %2 = tensor.dim %arg0, %c2 : tensor<2x3x4xf32>
  %3 = tensor.empty(%0, %1, %2) : tensor<?x?x?xf32>
  %4 = tensor.cast %arg0 : tensor<2x3x4xf32> to tensor<2x?x?xf32>
  %5 = tensor.cast %arg1 : tensor<2x3x4xf32> to tensor<2x?x?xf32>
  %6 = linalg.generic {
    indexing_maps = [#map, #map, #map],
    iterator_types = ["parallel", "parallel", "parallel"]
  } ins(%4, %5 : tensor<2x?x?xf32>, tensor<2x?x?xf32>)
    outs(%3 : tensor<?x?x?xf32>) {
  ^bb0(%arg2 : f32, %arg3 : f32, %arg4 : f32):
    %9 = arith.addf %arg2, %arg3 : f32
    linalg.yield %9 : f32
  } -> (tensor<?x?x?xf32>)
  %7 = tensor.cast %6 : tensor<?x?x?xf32> to tensor<2x3x4xf32>
  return %7: tensor<2x3x4xf32>
}

// -----

#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
func.func @cast_dest(%arg0: tensor<?x?x?xf32>, %arg1: tensor<1x?x?xf32>, %arg2: index, %arg3: index, %arg4: index) -> tensor<?x?x?xf32> {
  %0 = tensor.empty(%arg2, %arg3, %arg4) : tensor<?x?x?xf32>
  %1 = tensor.cast %arg1 : tensor<1x?x?xf32> to tensor<?x?x?xf32>
  %2 = linalg.generic {
    indexing_maps = [#map, #map, #map],
    iterator_types = ["parallel", "parallel", "parallel"]
  } ins(%arg0, %arg1 : tensor<?x?x?xf32>, tensor<1x?x?xf32>)
    outs(%0 : tensor<?x?x?xf32>) {
  ^bb0(%arg5: f32, %arg6: f32, %arg7: f32):
    %3 = arith.subf %arg5, %arg6 : f32
    linalg.yield %3 : f32
  } -> tensor<?x?x?xf32>
  return %2 : tensor<?x?x?xf32>
}

// -----

#map = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
func.func @static_shape_inference_with_encoding(%arg0: tensor<?x?xf32, #sparse>, %arg1: tensor<?x?xf32>) -> tensor<3x4xf32> {
  %0 = tensor.empty() : tensor<3x4xf32>
  %1 = linalg.generic {
    indexing_maps = [#map, #map, #map],
    iterator_types = ["parallel", "parallel"]
  } ins(%arg0, %arg1 : tensor<?x?xf32, #sparse>, tensor<?x?xf32>)
    outs(%0 : tensor<3x4xf32>) {
  ^bb0(%in: f32, %in_0: f32, %out: f32):
    %2 = arith.addf %in, %in_0 : f32
    linalg.yield %2 : f32
  } -> tensor<3x4xf32>
  return %1 : tensor<3x4xf32>
}

// -----

func.func @insert_pad_into_fill(%input: tensor<?x?x?xf32>, %low0: index, %low1: index, %high1: index, %high2: index) -> tensor<8x384x384xf32> {
  %f0 = arith.constant 0.0 : f32
  %c0 = arith.constant 0 : index
  %pad = tensor.pad %input low[%low0, %low1, %c0] high[%c0, %high1, %high2] {
  ^bb0(%arg3: index, %arg4: index, %arg5: index):
    tensor.yield %f0 : f32
  } : tensor<?x?x?xf32> to tensor<8x128x128xf32>
  %empty = tensor.empty() : tensor<8x384x384xf32>
  %fill = linalg.fill ins(%f0 : f32) outs(%empty : tensor<8x384x384xf32>) -> tensor<8x384x384xf32>
  %0 = tensor.insert_slice %pad into %fill[0, 1, 2] [8, 128, 128] [1, 1, 1] : tensor<8x128x128xf32> into tensor<8x384x384xf32>
  return %0: tensor<8x384x384xf32>
}

// -----

func.func @multi_insert_pad_into_fill(%input: tensor<7x123x124xf32>, %a: tensor<8x128x128xf32>, %offset: index) -> tensor<8x384x384xf32> {
  %f0 = arith.constant 0.0 : f32
  %c0 = arith.constant 0 : index
  %pad = tensor.pad %input low[1, 2, 0] high[0, 3, 4] {
  ^bb0(%arg3: index, %arg4: index, %arg5: index):
    tensor.yield %f0 : f32
  } : tensor<7x123x124xf32> to tensor<8x128x128xf32>
  %empty = tensor.empty() : tensor<8x384x384xf32>
  %fill = linalg.fill ins(%f0 : f32) outs(%empty : tensor<8x384x384xf32>) -> tensor<8x384x384xf32>
  %0 = tensor.insert_slice %a   into %fill[%offset, 0, 0]  [8, 128, 128] [1, 1, 1] : tensor<8x128x128xf32> into tensor<8x384x384xf32>
  %1 = tensor.insert_slice %a   into %0   [0, 128, %offset][8, 128, 128] [1, 1, 1] : tensor<8x128x128xf32> into tensor<8x384x384xf32>
  %2 = tensor.insert_slice %pad into %1   [0, 0, 256]      [8, 128, 128] [1, 1, 1] : tensor<8x128x128xf32> into tensor<8x384x384xf32>
  return %2: tensor<8x384x384xf32>
}

// -----

func.func @multi_insert_pad_into_fill_overlap(%input: tensor<7x123x124xf32>, %a: tensor<8x128x128xf32>, %offset: index) -> tensor<8x384x384xf32> {
  %f0 = arith.constant 0.0 : f32
  %c0 = arith.constant 0 : index
  %pad = tensor.pad %input low[1, 2, 0] high[0, 3, 4] {
  ^bb0(%arg3: index, %arg4: index, %arg5: index):
    tensor.yield %f0 : f32
  } : tensor<7x123x124xf32> to tensor<8x128x128xf32>
  %empty = tensor.empty() : tensor<8x384x384xf32>
  %fill = linalg.fill ins(%f0 : f32) outs(%empty : tensor<8x384x384xf32>) -> tensor<8x384x384xf32>
  %0 = tensor.insert_slice %a   into %fill[%offset, 0, 0]  [8, 128, 128] [1, 1, 1] : tensor<8x128x128xf32> into tensor<8x384x384xf32>
  %1 = tensor.insert_slice %a   into %0   [0, 0, 129]      [8, 128, 128] [1, 1, 1] : tensor<8x128x128xf32> into tensor<8x384x384xf32>
  // Range overlap with %1 at dim#3
  %2 = tensor.insert_slice %pad into %1   [0, 0, 256]      [8, 128, 128] [1, 1, 1] : tensor<8x128x128xf32> into tensor<8x384x384xf32>
  return %2: tensor<8x384x384xf32>
}

// -----

func.func @multi_insert_pad_into_fill_overlap(%input: tensor<7x123x124xf32>, %a: tensor<8x128x128xf32>, %offset: index) -> tensor<8x384x384xf32> {
  %f0 = arith.constant 0.0 : f32
  %c0 = arith.constant 0 : index
  %pad = tensor.pad %input low[1, 2, 0] high[0, 3, 4] {
  ^bb0(%arg3: index, %arg4: index, %arg5: index):
    tensor.yield %f0 : f32
  } : tensor<7x123x124xf32> to tensor<8x128x128xf32>
  %empty = tensor.empty() : tensor<8x384x384xf32>
  %fill = linalg.fill ins(%f0 : f32) outs(%empty : tensor<8x384x384xf32>) -> tensor<8x384x384xf32>
  %0 = tensor.insert_slice %a   into %fill[0, 0, %offset]  [8, 128, 128] [1, 1, 1] : tensor<8x128x128xf32> into tensor<8x384x384xf32>
  %1 = tensor.insert_slice %a   into %0   [0, 128, 255]    [8, 128, 128] [1, 1, 1] : tensor<8x128x128xf32> into tensor<8x384x384xf32>
  // Range overlap with %0 at dim#3
  %2 = tensor.insert_slice %pad into %1   [0, 0, 256]      [8, 128, 128] [1, 1, 1] : tensor<8x128x128xf32> into tensor<8x384x384xf32>
  return %2: tensor<8x384x384xf32>
}

// -----

func.func @multi_insert_pad_into_fill(%input: tensor<7x123x124xf32>, %a: tensor<8x128x128xf32>, %offset: index) -> tensor<8x384x384xf32> {
  %f0 = arith.constant 0.0 : f32
  %c0 = arith.constant 0 : index
  %pad = tensor.pad %input low[1, 2, 0] high[0, 3, 4] {
  ^bb0(%arg3: index, %arg4: index, %arg5: index):
    tensor.yield %f0 : f32
  } : tensor<7x123x124xf32> to tensor<8x128x128xf32>
  %empty = tensor.empty() : tensor<8x384x384xf32>
  %fill = linalg.fill ins(%f0 : f32) outs(%empty : tensor<8x384x384xf32>) -> tensor<8x384x384xf32>
  // Overlap btween %0 and %1 is fine but not with %2 is fine.
  %0 = tensor.insert_slice %a   into %fill[0, 0, %offset]  [8, 128, 128] [1, 1, 1] : tensor<8x128x128xf32> into tensor<8x384x384xf32>
  %1 = tensor.insert_slice %a   into %0   [0, 1, %offset]  [8, 128, 128] [1, 1, 1] : tensor<8x128x128xf32> into tensor<8x384x384xf32>
  %2 = tensor.insert_slice %pad into %1   [0, 256, 256]    [8, 128, 128] [1, 1, 1] : tensor<8x128x128xf32> into tensor<8x384x384xf32>
  return %2: tensor<8x384x384xf32>
}

// -----

func.func @multi_insert_pad_into_fill_mismatch(%input: tensor<7x123x124xf32>, %a: tensor<8x128x128xf32>, %offset: index) -> tensor<8x384x384xf32> {
  %f0 = arith.constant 0.0 : f32
  %f1 = arith.constant 1.0 : f32
  %c0 = arith.constant 0 : index
  %pad = tensor.pad %input low[1, 2, 0] high[0, 3, 4] {
  ^bb0(%arg3: index, %arg4: index, %arg5: index):
    tensor.yield %f0 : f32
  } : tensor<7x123x124xf32> to tensor<8x128x128xf32>
  %empty = tensor.empty() : tensor<8x384x384xf32>
  // Different filling value than padding value.
  %fill = linalg.fill ins(%f1 : f32) outs(%empty : tensor<8x384x384xf32>) -> tensor<8x384x384xf32>
  %0 = tensor.insert_slice %a   into %fill[%offset, 0, 0]  [8, 128, 128] [1, 1, 1] : tensor<8x128x128xf32> into tensor<8x384x384xf32>
  %1 = tensor.insert_slice %a   into %0   [0, 128, %offset][8, 128, 128] [1, 1, 1] : tensor<8x128x128xf32> into tensor<8x384x384xf32>
  %2 = tensor.insert_slice %pad into %1   [0, 0, 256]      [8, 128, 128] [1, 1, 1] : tensor<8x128x128xf32> into tensor<8x384x384xf32>
  return %2: tensor<8x384x384xf32>
}

// -----

func.func @fold_linalgop_with_cast_consumer(%arg0 : tensor<?x?xf32>, %arg1 : tensor<?x?xf32>,
    %arg2 : tensor<?x?xf32>) -> (tensor<4x8xf32>, tensor<?x?xf32>) {
  %0 = linalg.matmul ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>)
      outs(%arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
  %1 = tensor.cast %0 : tensor<?x?xf32> to tensor<4x8xf32>
  return %1, %0 : tensor<4x8xf32>, tensor<?x?xf32>
}

// -----

func.func private @some_use(%0 : tensor<4x8xf32>)

func.func @linalgop_with_cond_cast_consumer(%arg0 : tensor<?x?xf32>, %arg1 : tensor<?x?xf32>,
    %arg2 : tensor<?x?xf32>, %arg3 : i1) -> tensor<?x?xf32> {
  %0 = linalg.matmul ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>)
      outs(%arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
  scf.if %arg3 {
    %1 = tensor.cast %0 : tensor<?x?xf32> to tensor<4x8xf32>
    func.call @some_use(%1) : (tensor<4x8xf32>) -> ()
  }
  return %0 : tensor<?x?xf32>
}

// Check conditionally reachable cast is not folded into producer.


// -----

func.func @fold_conv_op_with_cast_consumer(%arg0 : tensor<?x?x?x?xf32>,
    %arg1 : tensor<?x?x?x?xf32>,  %arg2 : tensor<?x?x?x?xf32>) ->
    (tensor<4x8x12x16xf32>, tensor<?x?x?x?xf32>) {
  %0 = linalg.conv_2d_nchw_fchw ins(%arg0, %arg1 : tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>)
      outs(%arg2 : tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
  %1 = tensor.cast %0 : tensor<?x?x?x?xf32> to tensor<4x8x12x16xf32>
  return %1, %0 : tensor<4x8x12x16xf32>, tensor<?x?x?x?xf32>
}

// -----

func.func @fold_multi_use_generic_op_with_consumer(%arg0 : tensor<?x?x?xf32>) -> (tensor<?x?x?xf32>, tensor<2x3x4xf32>) {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c2 = arith.constant 2 : index
  %d0 = tensor.dim %arg0, %c0 : tensor<?x?x?xf32>
  %d1 = tensor.dim %arg0, %c1 : tensor<?x?x?xf32>
  %d2 = tensor.dim %arg0, %c2 : tensor<?x?x?xf32>
  %empty1 = tensor.empty(%d1, %d2, %d0) : tensor<?x?x?xf32>
  %empty2 = tensor.empty(%d2, %d1, %d0) : tensor<?x?x?xf32>
  %0:2 = linalg.generic {
      iterator_types = ["parallel", "parallel", "parallel"],
      indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>,
                       affine_map<(d0, d1, d2) -> (d1, d2, d0)>,
                       affine_map<(d0, d1, d2) -> (d2, d1, d0)>]}
      ins(%arg0 : tensor<?x?x?xf32>) outs(%empty1, %empty2 : tensor<?x?x?xf32>, tensor<?x?x?xf32>) {
    ^bb0(%b0 : f32, %b1 : f32, %b2 : f32) :
      linalg.yield %b0, %b0 : f32, f32
    } -> (tensor<?x?x?xf32>, tensor<?x?x?xf32>)
  %1 = tensor.cast %0#1 : tensor<?x?x?xf32> to tensor<2x3x4xf32>
  return %0#0, %1 : tensor<?x?x?xf32>, tensor<2x3x4xf32>
}

// -----

#map = affine_map<(d0) -> (d0)>
func.func @identity_buffer(%arg0 : memref<?xf32>, %arg1: memref<?xf32>) {
  linalg.generic {
    indexing_maps = [#map, #map],
    iterator_types = ["parallel"]
  } ins(%arg0 : memref<?xf32>)
    outs(%arg1 : memref<?xf32>) {
  ^bb0(%arg2 : f32, %arg3 : f32):
    linalg.yield %arg2 : f32
  }
  return
}

// Do not erase ops with buffer semantics.

// -----

#map = affine_map<(d0, d1) -> (d1, d0)>
func.func @erase_non_identity_noop(%arg0 : tensor<?x?xf32>, %arg1: tensor<?x?xf32>) -> tensor<?x?xf32> {
  %0 = linalg.generic {
    indexing_maps = [#map, #map],
    iterator_types = ["parallel", "parallel"]
  } ins(%arg0 : tensor<?x?xf32>)
    outs(%arg1 : tensor<?x?xf32>) {
  ^bb0(%in: f32, %out: f32):
    linalg.yield %in: f32
  } -> tensor<?x?xf32>
  return %0 : tensor<?x?xf32>
}

// Do not erase ops with buffer semantics.

// -----

// Just make sure that we don't crash.

func.func @dedeplicate_regression_test(%0: tensor<4xf32>, %1: tensor<4xf32>) {
  %36 = linalg.generic
    {indexing_maps = [affine_map<(d0) -> (d0)>,
                      affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>],
     iterator_types = ["parallel"]}
    ins(%1, %1 : tensor<4xf32>, tensor<4xf32>)
    outs(%0 : tensor<4xf32>) {
  ^bb0(%in: f32, %in_24: f32, %out: f32):
    linalg.yield %in : f32
  } -> tensor<4xf32>
  %53 = linalg.generic {indexing_maps = [affine_map<(d0) -> (d0)>],
                        iterator_types = ["parallel"]}
                        outs(%36 : tensor<4xf32>) {
  ^bb0(%out: f32):
    linalg.yield %out : f32
  } -> tensor<4xf32>
  return
}

// -----

func.func @dead_softmax(%arg0: tensor<16x64x256xf32>) -> tensor<16x64x256xf32> {
  %0 = tensor.empty() : tensor<16x64x256xf32>
  %1 = linalg.softmax dimension(1)
    ins(%arg0 : tensor<16x64x256xf32>) outs(%0 : tensor<16x64x256xf32>) -> tensor<16x64x256xf32>
  return %arg0 : tensor<16x64x256xf32>
}

// -----

func.func @canonicalize_dim_of_dest_style_op(%arg0 : tensor<?x?xf32>) -> tensor<?x?xf32> {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %dim0_0 = tensor.dim %arg0, %c0 : tensor<?x?xf32>
  %dim1_0 = tensor.dim %arg0, %c1 : tensor<?x?xf32>
  %0 = tensor.empty(%dim0_0, %dim1_0) : tensor<?x?xf32>
  %1 = linalg.copy ins(%arg0 : tensor<?x?xf32>) outs(%0 : tensor<?x?xf32>) -> tensor<?x?xf32>
  %dim0_1 = tensor.dim %1, %c0 : tensor<?x?xf32>
  %dim1_1 = tensor.dim %1, %c1 : tensor<?x?xf32>
  %2 = tensor.empty(%dim0_1, %dim1_1) : tensor<?x?xf32>
  %3 = linalg.copy ins(%1 : tensor<?x?xf32>) outs(%2 : tensor<?x?xf32>) -> tensor<?x?xf32>
  return %3: tensor<?x?xf32>
}
// -----

func.func @canonicalize_fill_to_copy_input(%arg0 : tensor<?x?xf32>, %arg1 : tensor<?x?xf32>) -> tensor<?x?xf32> {
  %c0 = arith.constant 0.0 : f32
  %fill = linalg.fill ins(%c0 : f32) outs(%arg0 : tensor<?x?xf32>) -> tensor<?x?xf32>
  %copy = linalg.copy ins(%fill : tensor<?x?xf32>) outs(%arg1 : tensor<?x?xf32>) -> tensor<?x?xf32>
  return %copy : tensor<?x?xf32>
}

// -----

func.func @canonicalize_fill_to_copy_dest(%arg0 : tensor<?x?xf32>, %arg1 : tensor<?x?xf32>) -> tensor<?x?xf32> {
  %c0 = arith.constant 0.0 : f32
  %fill = linalg.fill ins(%c0 : f32) outs(%arg0 : tensor<?x?xf32>) -> tensor<?x?xf32>
  %copy = linalg.copy ins(%arg1 : tensor<?x?xf32>) outs(%fill : tensor<?x?xf32>) -> tensor<?x?xf32>
  return %copy : tensor<?x?xf32>
}

// -----

func.func @canonicalize_fill_to_transpose_input(%arg0 : tensor<?x?xf32>, %arg1 : tensor<?x?xf32>) -> tensor<?x?xf32> {
  %c0 = arith.constant 0.0 : f32
  %fill = linalg.fill ins(%c0 : f32) outs(%arg0 : tensor<?x?xf32>) -> tensor<?x?xf32>
  %transpose = linalg.transpose ins(%fill : tensor<?x?xf32>) outs(%arg1 : tensor<?x?xf32>) permutation = [1, 0]
  return %transpose : tensor<?x?xf32>
}

// -----

func.func @broadcast_same_shape(%input: tensor<2x3xf32>, %init: tensor<2x3xf32>) -> tensor<2x3xf32> {
  %0 = linalg.broadcast ins(%input: tensor<2x3xf32>) outs(%init: tensor<2x3xf32>) dimensions = []
  return %0 : tensor<2x3xf32>
}

// -----

func.func @broadcast_splat_constant_to_dense(%init: tensor<2x3xf32>) -> tensor<2x3xf32> {
  %cst = arith.constant dense<1.000000e+00> : tensor<3xf32>
  %0 = linalg.broadcast
      ins(%cst: tensor<3xf32>)
      outs(%init: tensor<2x3xf32>)
      dimensions = [0]
  return %0 : tensor<2x3xf32>
}

// -----

func.func @broadcast_splat_constant_dynamic_shape(%init: tensor<?x3xf32>) -> tensor<?x3xf32> {
  %cst = arith.constant dense<1.000000e+00> : tensor<3xf32>
  %0 = linalg.broadcast
      ins(%cst: tensor<3xf32>)
      outs(%init: tensor<?x3xf32>)
      dimensions = [0]
  return %0 : tensor<?x3xf32>
}

// -----

func.func @broadcast_non_splat_constant(%init: tensor<2x3xf32>) -> tensor<2x3xf32> {
  %cst = arith.constant dense<[1.000000e+00, 2.000000e+00, 3.000000e+00]> : tensor<3xf32>
  %0 = linalg.broadcast
      ins(%cst: tensor<3xf32>)
      outs(%init: tensor<2x3xf32>)
      dimensions = [0]
  return %0 : tensor<2x3xf32>
}

// -----

func.func @broadcast_broadcast_fold(%input: tensor<2xf32>,
                                    %init1: tensor<2x3xf32>,
                                    %init2: tensor<2x3x4xf32>) -> tensor<2x3x4xf32> {
  %broadcast1 = linalg.broadcast
      ins(%input: tensor<2xf32>)
      outs(%init1: tensor<2x3xf32>)
      dimensions = [1]
  %broadcast2 = linalg.broadcast
      ins(%broadcast1: tensor<2x3xf32>)
      outs(%init2: tensor<2x3x4xf32>)
      dimensions = [2]
  func.return %broadcast2 : tensor<2x3x4xf32>
}

// -----

func.func @broadcast_broadcast_fold(%input: tensor<2xf32>,
                                    %init1: tensor<2x4xf32>,
                                    %init2: tensor<2x3x4xf32>) -> tensor<2x3x4xf32> {
  %broadcast1 = linalg.broadcast
      ins(%input: tensor<2xf32>)
      outs(%init1: tensor<2x4xf32>)
      dimensions = [1]
  %broadcast2 = linalg.broadcast
      ins(%broadcast1: tensor<2x4xf32>)
      outs(%init2: tensor<2x3x4xf32>)
      dimensions = [1]
  func.return %broadcast2 : tensor<2x3x4xf32>
}

// -----

func.func @transpose_1d(%input: tensor<16xf32>,
                        %init: tensor<16xf32>) -> tensor<16xf32> {
  %transpose = linalg.transpose
      ins(%input:tensor<16xf32>)
      outs(%init:tensor<16xf32>)
      permutation = [0]
  func.return %transpose : tensor<16xf32>
}


// -----

func.func @transpose_identity_perm(%input: tensor<16x32x64xf32>,
                                   %init: tensor<16x32x64xf32>) -> tensor<16x32x64xf32> {
  %transpose = linalg.transpose
      ins(%input:tensor<16x32x64xf32>)
      outs(%init:tensor<16x32x64xf32>)
      permutation = [0, 1, 2]
  func.return %transpose : tensor<16x32x64xf32>
}


// -----

func.func @transpose_splat_constant_to_dense(%init: tensor<3x2xf32>) -> tensor<3x2xf32> {
  %cst = arith.constant dense<1.000000e+00> : tensor<2x3xf32>
  %transpose = linalg.transpose
      ins(%cst:tensor<2x3xf32>)
      outs(%init:tensor<3x2xf32>)
      permutation = [1, 0]
  func.return %transpose : tensor<3x2xf32>
}

// -----

func.func @transpose_splat_constant_same_shape_permutations(
    %init0: tensor<3x3x3xf32>,
    %init1: tensor<3x3x3xf32>) -> (tensor<3x3x3xf32>, tensor<3x3x3xf32>) {
  %cst = arith.constant dense<1.000000e+00> : tensor<3x3x3xf32>
  %transpose0 = linalg.transpose
      ins(%cst:tensor<3x3x3xf32>)
      outs(%init0:tensor<3x3x3xf32>)
      permutation = [0, 1, 2]
  %transpose1 = linalg.transpose
      ins(%cst:tensor<3x3x3xf32>)
      outs(%init1:tensor<3x3x3xf32>)
      permutation = [2, 0, 1]
  func.return %transpose0, %transpose1 : tensor<3x3x3xf32>, tensor<3x3x3xf32>
}

// -----

func.func @transpose_non_splat_constant(%init: tensor<3x2xf32>) -> tensor<3x2xf32> {
  %cst = arith.constant dense<[[1.000000e+00, 2.000000e+00, 3.000000e+00], [4.000000e+00, 5.000000e+00, 6.000000e+00]]> : tensor<2x3xf32>
  %transpose = linalg.transpose
      ins(%cst:tensor<2x3xf32>)
      outs(%init:tensor<3x2xf32>)
      permutation = [1, 0]
  func.return %transpose : tensor<3x2xf32>
}

// -----

func.func @transpose_transpose_cancel(%input: tensor<5x4x3xf32>,
                                      %init1: tensor<4x3x5xf32>,
                                      %init2: tensor<5x4x3xf32>) -> tensor<5x4x3xf32> {
  %transpose1 = linalg.transpose
      ins(%input:tensor<5x4x3xf32>)
      outs(%init1:tensor<4x3x5xf32>)
      permutation = [1, 2, 0]
  %transpose2 = linalg.transpose
      ins(%transpose1:tensor<4x3x5xf32>)
      outs(%init2:tensor<5x4x3xf32>)
      permutation = [2, 0, 1]
  func.return %transpose2 : tensor<5x4x3xf32>
}

// -----

func.func @transpose_transpose_fold(%input: tensor<5x4x3xf32>,
                                    %init1: tensor<4x3x5xf32>,
                                    %init2: tensor<3x4x5xf32>) -> tensor<3x4x5xf32> {
  %transpose1 = linalg.transpose
      ins(%input:tensor<5x4x3xf32>)
      outs(%init1:tensor<4x3x5xf32>)
      permutation = [1, 2, 0]
  %transpose2 = linalg.transpose
      ins(%transpose1:tensor<4x3x5xf32>)
      outs(%init2:tensor<3x4x5xf32>)
      permutation = [1, 0, 2]
  func.return %transpose2 : tensor<3x4x5xf32>
}

// -----

func.func @broadcast_transpose_fold(%input: tensor<2x4x5xf32>,
                                    %init1: tensor<1x2x3x4x5x6xf32>,
                                    %init2: tensor<1x6x2x3x5x4xf32>) -> tensor<1x6x2x3x5x4xf32> {
  %broadcast = linalg.broadcast
      ins(%input : tensor<2x4x5xf32>)
      outs(%init1 : tensor<1x2x3x4x5x6xf32>)
      dimensions = [0, 2, 5]
  %transpose = linalg.transpose
      ins(%broadcast : tensor<1x2x3x4x5x6xf32>)
      outs(%init2 : tensor<1x6x2x3x5x4xf32>)
      permutation = [0, 5, 1, 2, 4, 3]
  func.return %transpose : tensor<1x6x2x3x5x4xf32>
}

// -----

func.func @broadcast_transpose_fold_dynamic(%input: tensor<?x?x5xf32>,
                                            %init1: tensor<1x?x3x?x5x6xf32>,
                                            %init2: tensor<1x3x?x6x5x?xf32>) -> tensor<1x3x?x6x5x?xf32> {
  %broadcast = linalg.broadcast
      ins(%input : tensor<?x?x5xf32>)
      outs(%init1 : tensor<1x?x3x?x5x6xf32>)
      dimensions = [0, 2, 5]
  %transpose = linalg.transpose
      ins(%broadcast : tensor<1x?x3x?x5x6xf32>)
      outs(%init2 : tensor<1x3x?x6x5x?xf32>)
      permutation = [0, 2, 3, 5, 4, 1]
  func.return %transpose : tensor<1x3x?x6x5x?xf32>
}

// -----

func.func @broadcast_transpose_fold_2dim(%input: tensor<2xf32>,
                                         %init1: tensor<2x4xf32>,
                                         %init2: tensor<4x2xf32>) -> tensor<4x2xf32> {
  %broadcast = linalg.broadcast
      ins(%input : tensor<2xf32>)
      outs(%init1 : tensor<2x4xf32>)
      dimensions = [1]
  %transpose = linalg.transpose
      ins(%broadcast : tensor<2x4xf32>)
      outs(%init2 : tensor<4x2xf32>)
      permutation = [1, 0]
  func.return %transpose : tensor<4x2xf32>
}

// -----

func.func @concats_of_fill(
    %arg0 : index, %arg1 : index, %arg2 : index, %arg3 : index)
    -> tensor<5x?x?xf32>
{
  %cst0 = arith.constant 0.0 : f32
  %cst1 = arith.constant 0.0 : f32
  %0 = tensor.empty(%arg0, %arg1) : tensor<5x?x?xf32>
  %1 = linalg.fill ins(%cst0 : f32) outs(%0 : tensor<5x?x?xf32>) -> tensor<5x?x?xf32>
  %2 = tensor.empty(%arg2, %arg3) : tensor<5x?x?xf32>
  %3 = linalg.fill ins(%cst1 : f32) outs(%2 : tensor<5x?x?xf32>) -> tensor<5x?x?xf32>
  %4 = tensor.concat dim(1) %1, %3 : (tensor<5x?x?xf32>, tensor<5x?x?xf32>) -> tensor<5x?x?xf32>
  return %4 : tensor<5x?x?xf32>
}

// -----

func.func @transpose_buffer(%input: memref<?xf32>,
                            %init: memref<?xf32>) {
  linalg.transpose ins(%input:memref<?xf32>)
                   outs(%init:memref<?xf32>)
                   permutation = [0]
  func.return
}


// -----

// This test checks linalg op has a recursive memory effect. Otherwise
// linalg.map without a user would be DCEd.
func.func @recursive_effect(%arg : tensor<1xf32>) {
  %init = arith.constant dense<0.0> : tensor<1xf32>
  %mapped = linalg.map ins(%arg:tensor<1xf32>) outs(%init :tensor<1xf32>)
            (%in : f32, %out: f32) {
              vector.print %in : f32
              linalg.yield %in : f32
            }
  func.return
}


// -----

//===----------------------------------------------------------------------===//
// linalg.pack
//===----------------------------------------------------------------------===//

func.func @fold_pack_constant_splat(%dest : tensor<4x8x8x32xf32>) -> tensor<4x8x8x32xf32> {
  %cst = arith.constant dense<1.000000e-01> : tensor<64x128xf32>
  %0 = linalg.pack %cst outer_dims_perm = [1, 0] inner_dims_pos = [0, 1]
    inner_tiles = [8, 32] into %dest : tensor<64x128xf32> -> tensor<4x8x8x32xf32>
  return %0 : tensor<4x8x8x32xf32>
}

// -----

// A dynamic tile size must not be folded into a static dimension, even when
// the dynamic value is a constant zero at the point of canonicalization.
func.func @negative_fold_pack_zero_tile(%A: tensor<7x16xi32>) -> tensor<1x16x?x1xi32> {
  %pad_val = arith.constant 123 : i32
  %tile_size = arith.constant 0 : index
  %empty = tensor.empty(%tile_size) : tensor<1x16x?x1xi32>
  %pack = linalg.pack %A
    padding_value(%pad_val : i32)
    inner_dims_pos = [0, 1]
    inner_tiles = [%tile_size, 1]
    into %empty : tensor<7x16xi32> -> tensor<1x16x?x1xi32>
  return %pack : tensor<1x16x?x1xi32>
}

// -----

func.func @fold_padding_value_pack_constant_splat(%dest : tensor<4x8x8x32xf32>) -> tensor<4x8x8x32xf32> {
  %pad = arith.constant 1.000000e-01 : f32
  %cst = arith.constant dense<1.000000e-01> : tensor<63x127xf32>
  %0 = linalg.pack %cst
    padding_value(%pad : f32)
    outer_dims_perm = [1, 0] inner_dims_pos = [0, 1]
    inner_tiles = [8, 32] into %dest : tensor<63x127xf32> -> tensor<4x8x8x32xf32>
  return %0 : tensor<4x8x8x32xf32>
}

// -----

func.func @negative_fold_padding_value_pack_constant_splat(%dest : tensor<4x8x8x32xf32>) -> tensor<4x8x8x32xf32> {
  %pad = arith.constant 0.0 : f32
  %cst = arith.constant dense<1.000000e-01> : tensor<63x127xf32>
  %0 = linalg.pack %cst
    padding_value(%pad : f32)
    outer_dims_perm = [1, 0]
    inner_dims_pos = [0, 1]
    inner_tiles = [8, 32]
    into %dest : tensor<63x127xf32> -> tensor<4x8x8x32xf32>
  return %0 : tensor<4x8x8x32xf32>
}

// -----

func.func @fold_padding_value_pack(%arg0: tensor<1200x500000xf32>) -> tensor<31250x1200x16x1xf32> {
  %cst = arith.constant 0.000000e+00 : f32
  %0 = tensor.empty() : tensor<31250x1200x16x1xf32>
  %pack = linalg.pack %arg0
    padding_value(%cst : f32)
    outer_dims_perm = [1, 0]
    inner_dims_pos = [1, 0]
    inner_tiles = [16, 1]
    into %0 : tensor<1200x500000xf32> -> tensor<31250x1200x16x1xf32>
  return %pack : tensor<31250x1200x16x1xf32>
}

// -----

func.func @infer_src_shape_pack(%src: tensor<?x?x?x?xf32>, %dest: tensor<10x20x30x40x16xf32>) -> tensor<10x20x30x40x16xf32> {
  %cst = arith.constant 0.000000e+00 : f32
   %pack = linalg.pack %src
    padding_value(%cst : f32)
    outer_dims_perm = [2, 1, 3, 0]
    inner_dims_pos = [2]
    inner_tiles = [16]
    into %dest : tensor<?x?x?x?xf32> -> tensor<10x20x30x40x16xf32>
  return %pack : tensor<10x20x30x40x16xf32>
}

// -----

func.func @infer_dest_shape_pack(%src: tensor<30x20x?x10xf32>, %dest: tensor<?x?x?x?x16xf32>) -> tensor<?x?x?x?x16xf32> {
  %cst = arith.constant 0.000000e+00 : f32
   %pack = linalg.pack %src
    padding_value(%cst : f32)
    outer_dims_perm = [2, 1, 3, 0]
    inner_dims_pos = [2]
    inner_tiles = [16]
    into %dest : tensor<30x20x?x10xf32> -> tensor<?x?x?x?x16xf32>
  return %pack : tensor<?x?x?x?x16xf32>
}

// -----

func.func @negative_infer_pack_shape(%arg0: tensor<?x32x100xf32>, %arg1: index) -> tensor<32x7x?x16x1xf32> {
  %cst = arith.constant 0.000000e+00 : f32
  %0 = tensor.empty(%arg1) : tensor<32x7x?x16x1xf32>
  %pack = linalg.pack %arg0 padding_value(%cst : f32) outer_dims_perm = [1, 2, 0] inner_dims_pos = [2, 0] inner_tiles = [16, 1] into %0 : tensor<?x32x100xf32> -> tensor<32x7x?x16x1xf32>
  return %pack : tensor<32x7x?x16x1xf32>
}

// -----

func.func @fold_padding_value_pack_negative1(%arg0: tensor<1200x499999xf32>) -> tensor<31250x1200x16x1xf32> {
  %cst = arith.constant 0.000000e+00 : f32
  %0 = tensor.empty() : tensor<31250x1200x16x1xf32>
  %pack = linalg.pack %arg0
    padding_value(%cst : f32)
    outer_dims_perm = [1, 0]
    inner_dims_pos = [1, 0]
    inner_tiles = [16, 1]
    into %0 : tensor<1200x499999xf32> -> tensor<31250x1200x16x1xf32>
  return %pack : tensor<31250x1200x16x1xf32>
}

// -----

func.func @fold_padding_value_pack_negative2(%arg0: tensor<1200x?xf32>, %arg1: tensor<?x1200x16x1xf32>) -> tensor<?x1200x16x1xf32> {
  %cst = arith.constant 0.000000e+00 : f32
  %pack = linalg.pack %arg0
    padding_value(%cst : f32)
    outer_dims_perm = [1, 0]
    inner_dims_pos = [1, 0]
    inner_tiles = [16, 1]
    into %arg1 : tensor<1200x?xf32> -> tensor<?x1200x16x1xf32>
  return %pack : tensor<?x1200x16x1xf32>
}

// -----

func.func @fold_padding_value_pack_negative3(%arg0: tensor<1200x500000xf32>, %arg1: tensor<?x1200x?x1xf32>, %tile : index) -> tensor<?x1200x?x1xf32> {
  %cst = arith.constant 0.000000e+00 : f32
  %pack = linalg.pack %arg0
    padding_value(%cst : f32)
    outer_dims_perm = [1, 0]
    inner_dims_pos = [1, 0]
    inner_tiles = [%tile, 1]
    into %arg1 : tensor<1200x500000xf32> -> tensor<?x1200x?x1xf32>
  return %pack : tensor<?x1200x?x1xf32>
}

// -----

//===----------------------------------------------------------------------===//
// linalg.unpack
//===----------------------------------------------------------------------===//


func.func @fold_unpack_constant_splat(%dest : tensor<128x256xf32>) -> tensor<128x256xf32> {
  %cst = arith.constant dense<1.000000e-01> : tensor<16x8x8x32xf32>
  %0 = linalg.unpack %cst inner_dims_pos = [0, 1]
    inner_tiles = [8, 32] into %dest : tensor<16x8x8x32xf32> -> tensor<128x256xf32>
  return %0 : tensor<128x256xf32>
}

// -----

func.func @infer_dest_shape_unpack(%src: tensor<10x20x30x40x16xf32>, %dest: tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32> {
  %unpack = linalg.unpack %src
    outer_dims_perm = [2, 1, 3, 0]
    inner_dims_pos = [2]
    inner_tiles = [16]
    into %dest : tensor<10x20x30x40x16xf32> -> tensor<?x?x?x?xf32>
  return %unpack : tensor<?x?x?x?xf32>
}

// -----

func.func @infer_src_shape_unpack(%src: tensor<?x?x?x?x16xf32>, %dest: tensor<30x20x?x10xf32>) -> tensor<30x20x?x10xf32> {
  %unpack = linalg.unpack %src
    outer_dims_perm = [2, 1, 3, 0]
    inner_dims_pos = [2]
    inner_tiles = [16]
    into %dest : tensor<?x?x?x?x16xf32> -> tensor<30x20x?x10xf32>
  return %unpack : tensor<30x20x?x10xf32>
}

// -----

func.func @negative_infer_unpack_shape(%arg1: tensor<32x7x?x16x1xf32>, %arg2: index) -> tensor<?x32x100xf32> {
  %cst = arith.constant 0.000000e+00 : f32
  %0 = tensor.empty(%arg2) : tensor<?x32x100xf32>
  %unpack = linalg.unpack %arg1 outer_dims_perm = [1, 2, 0] inner_dims_pos = [2, 0] inner_tiles = [16, 1] into %0 : tensor<32x7x?x16x1xf32> -> tensor<?x32x100xf32>
  return %unpack : tensor<?x32x100xf32>
}

// -----

//===----------------------------------------------------------------------===//
// linalg.pack + linalg.unpack
//===----------------------------------------------------------------------===//

// Chain: NC -> NCnc -> NCnc -> NC
func.func @unpack_pack(%t: tensor<128x128xf32>) -> tensor<128x128xf32> {
  %tensor_empty = tensor.empty() : tensor<16x16x8x8xf32>
  %packed = linalg.pack %t inner_dims_pos = [0, 1] inner_tiles = [8, 8] into %tensor_empty : tensor<128x128xf32> -> tensor<16x16x8x8xf32>
  %tensor_empty1 = tensor.empty() : tensor<128x128xf32>
  %unpacked = linalg.unpack %packed inner_dims_pos = [0, 1] inner_tiles = [8, 8] into %tensor_empty1 : tensor<16x16x8x8xf32> -> tensor<128x128xf32>
  return %unpacked : tensor<128x128xf32>
}

// -----

// Chain: NC -> NCcn -> NCnc -> NC
func.func @unpack_pack(%t: tensor<128x128xf32>) -> tensor<128x128xf32> {
  %tensor_empty = tensor.empty() : tensor<16x16x8x8xf32>
  %packed = linalg.pack %t inner_dims_pos = [1, 0] inner_tiles = [8, 8] into %tensor_empty : tensor<128x128xf32> -> tensor<16x16x8x8xf32>
  %tensor_empty1 = tensor.empty() : tensor<128x128xf32>
  %unpacked = linalg.unpack %packed inner_dims_pos = [0, 1] inner_tiles = [8, 8] into %tensor_empty1 : tensor<16x16x8x8xf32> -> tensor
<128x128xf32>
  return %unpacked : tensor<128x128xf32>
}

// -----

// Chain: NC -> CNcn -> NCnc -> NC
func.func @unpack_pack(%t: tensor<128x128xf32>) -> tensor<128x128xf32> {
  %tensor_empty = tensor.empty() : tensor<16x16x8x8xf32>
  %packed = linalg.pack %t outer_dims_perm = [1, 0] inner_dims_pos = [1, 0] inner_tiles = [8, 8] into %tensor_empty : tensor<128x128xf32> -> tensor<16x16x8x8xf32>
  %tensor_empty1 = tensor.empty() : tensor<128x128xf32>
  %unpacked = linalg.unpack %packed inner_dims_pos = [0, 1] inner_tiles = [8, 8] into %tensor_empty1 : tensor<16x16x8x8xf32> -> tensor
<128x128xf32>
  return %unpacked : tensor<128x128xf32>
}

// -----

// Chain: NC -> NCnc -> NCnc -> NC
func.func @unpack_pack(%t: tensor<128x128xf32>, %tile1: index, %tile2: index) -> tensor<128x128xf32> {
  %tensor_empty = tensor.empty(%tile1, %tile2) : tensor<16x16x?x?xf32>
  %packed = linalg.pack %t inner_dims_pos = [0, 1] inner_tiles = [%tile1, %tile2] into %tensor_empty : tensor<128x128xf32> -> tensor<16x16x?x?xf32>
  %tensor_empty1 = tensor.empty() : tensor<128x128xf32>
  %unpacked = linalg.unpack %packed inner_dims_pos = [0, 1] inner_tiles = [%tile1, %tile2] into %tensor_empty1 : tensor<16x16x?x?xf32> -> tensor
<128x128xf32>
  return %unpacked : tensor<128x128xf32>
}

// -----

func.func @negative_unpack_pack_with_padding_no_canonicalization(%t: tensor<256x512xbf16>) -> tensor<224x512xbf16> {
  %tensor_empty = tensor.empty() : tensor<4x16x64x32xbf16>
  %tensor_empty1 = tensor.empty() : tensor<224x512xbf16>
  %packed = linalg.pack %t outer_dims_perm = [0, 1] inner_dims_pos = [0, 1] inner_tiles = [64, 32] into %tensor_empty : tensor<256x512xbf16> -> tensor<4x16x64x32xbf16>
  %unpacked = linalg.unpack %packed inner_dims_pos = [0, 1] inner_tiles = [64, 32] into %tensor_empty1 : tensor<4x16x64x32xbf16> -> tensor<224x512xbf16>
  return %unpacked : tensor<224x512xbf16>
}

// -----

// Chain NCnc -> NC -> NC -> NCnc
func.func @pack_unpack(%t: tensor<16x16x?x?xf32>, %tile1: index, %tile2: index) -> tensor<16x16x?x?xf32> {
  %tensor_empty = tensor.empty() : tensor<128x128xf32>
  %unpacked = linalg.unpack %t inner_dims_pos = [0, 1] inner_tiles = [%tile1, %tile2] into %tensor_empty : tensor<16x16x?x?xf32> -> tensor<128x128xf32>
  %tensor_empty1 = tensor.empty(%tile1, %tile2) : tensor<16x16x?x?xf32>
  %packed = linalg.pack %unpacked inner_dims_pos = [0, 1] inner_tiles = [%tile1, %tile2] into %tensor_empty1 : tensor<128x128xf32> -> tensor<16x16x?x?xf32>
  return %packed : tensor<16x16x?x?xf32>
}

// -----

// Chain NCnc -> NC -> NC -> NCnc
func.func @pack_unpack(%t: tensor<16x16x8x8xf32>) -> tensor<16x16x8x8xf32> {
  %cst = arith.constant 0.000000e+00 : f32
  %tensor_empty = tensor.empty() : tensor<128x128xf32>
  %unpacked = linalg.unpack %t inner_dims_pos = [0, 1] inner_tiles = [8, 8] into %tensor_empty : tensor<16x16x8x8xf32> -> tensor<128x128xf32>
  %tensor_empty1 = tensor.empty() : tensor<16x16x8x8xf32>
  %packed = linalg.pack %unpacked padding_value(%cst : f32) inner_dims_pos = [0, 1] inner_tiles = [8, 8] into %tensor_empty1 : tensor<128x128xf32> -> tensor<16x16x8x8xf32>
  return %packed : tensor<16x16x8x8xf32>
}

// -----

func.func @pack_unpack_same_tiles(%t: tensor<?x?x?x?xf32>, %dim1: index, %dim2: index, %dim3: index, %dim4: index, %dim5: index, %dim6: index,
                       %tile1: index, %tile2: index) -> tensor<?x?x?x?xf32> {
  %tensor_empty = tensor.empty(%dim1, %dim2) : tensor<?x?xf32>
  %unpacked = linalg.unpack %t inner_dims_pos = [0, 1] inner_tiles = [%tile1, %tile2] into %tensor_empty : tensor<?x?x?x?xf32> -> tensor<?x?xf32>
  %tensor_empty1 = tensor.empty(%dim3, %dim4, %dim5, %dim6) : tensor<?x?x?x?xf32>
  %packed = linalg.pack %unpacked inner_dims_pos = [0, 1] inner_tiles = [%tile1, %tile2] into %tensor_empty1 : tensor<?x?xf32> -> tensor<?x?x?x?xf32>
  return %packed : tensor<?x?x?x?xf32>
}

// -----

func.func @pack_unpack_different_tiles(%t: tensor<?x?x?x?xf32>, %dim1: index, %dim2: index, %dim3: index, %dim4: index, %dim5: index, %dim6: index,
                       %tile1: index, %tile2: index) -> tensor<?x?x?x?xf32> {
  %tensor_empty = tensor.empty(%dim1, %dim2) : tensor<?x?xf32>
  %unpacked = linalg.unpack %t inner_dims_pos = [0, 1] inner_tiles = [%tile1, %tile2] into %tensor_empty : tensor<?x?x?x?xf32> -> tensor<?x?xf32>
  %tensor_empty1 = tensor.empty(%dim3, %dim4, %dim5, %dim6) : tensor<?x?x?x?xf32>
  %packed = linalg.pack %unpacked inner_dims_pos = [0, 1] inner_tiles = [%tile2, %tile1] into %tensor_empty1 : tensor<?x?xf32> -> tensor<?x?x?x?xf32>
  return %packed : tensor<?x?x?x?xf32>
}

// -----

func.func @pack_unpack_dynamic_with_padding(%t: tensor<?x?x?x?xf32>, %dim1: index, %dim2: index, %dim3: index, %dim4: index, %dim5: index, %dim6: index,
                       %tile1: index, %tile2: index, %pad: f32) -> tensor<?x?x?x?xf32> {
  %tensor_empty = tensor.empty(%dim1, %dim2) : tensor<?x?xf32>
  %unpacked = linalg.unpack %t inner_dims_pos = [0, 1] inner_tiles = [%tile1, %tile2] into %tensor_empty : tensor<?x?x?x?xf32> -> tensor<?x?xf32>
  %tensor_empty1 = tensor.empty(%dim3, %dim4, %dim5, %dim6) : tensor<?x?x?x?xf32>
  %packed = linalg.pack %unpacked padding_value(%pad: f32) inner_dims_pos = [0, 1] inner_tiles = [%tile1, %tile2] into %tensor_empty1 : tensor<?x?xf32> -> tensor<?x?x?x?xf32>
  return %packed : tensor<?x?x?x?xf32>
}

// -----

func.func @pack_outer_dims_unpack_no_outer_dims(%t: tensor<16x16x?x?xf32>, %tile1: index, %tile2: index) -> tensor<16x16x?x?xf32> {
  %tensor_empty = tensor.empty() : tensor<128x128xf32>
  %unpacked = linalg.unpack %t inner_dims_pos = [0, 1] inner_tiles = [%tile1, %tile2] into %tensor_empty : tensor<16x16x?x?xf32> -> tensor<128x128xf32>
  %tensor_empty1 = tensor.empty(%tile1, %tile2) : tensor<16x16x?x?xf32>
  %packed = linalg.pack %unpacked outer_dims_perm = [0, 1] inner_dims_pos = [0, 1] inner_tiles = [%tile1, %tile2] into %tensor_empty1 : tensor<128x128xf32> -> tensor<16x16x?x?xf32>
  return %packed : tensor<16x16x?x?xf32>
}

// -----

func.func @pack_no_outer_dims_unpack_outer_dims(%t: tensor<16x16x?x?xf32>, %tile1: index, %tile2: index) -> tensor<16x16x?x?xf32> {
  %tensor_empty = tensor.empty() : tensor<128x128xf32>
  %unpacked = linalg.unpack %t outer_dims_perm = [0, 1] inner_dims_pos = [0, 1] inner_tiles = [%tile1, %tile2] into %tensor_empty : tensor<16x16x?x?xf32> -> tensor<128x128xf32>
  %tensor_empty1 = tensor.empty(%tile1, %tile2) : tensor<16x16x?x?xf32>
  %packed = linalg.pack %unpacked inner_dims_pos = [0, 1] inner_tiles = [%tile1, %tile2] into %tensor_empty1 : tensor<128x128xf32> -> tensor<16x16x?x?xf32>
  return %packed : tensor<16x16x?x?xf32>
}

// -----

//===----------------------------------------------------------------------===//
// tensor.cast + linalg.pack
//===----------------------------------------------------------------------===//

func.func @fold_cast_pack_dynamic_tile_size(
  %dest: tensor<1x1x8x1xi32>,
  %src: tensor<7x?xi32>,
  %pad: i32) -> tensor<1x1x8x1xi32> {

    %cast = tensor.cast %dest : tensor<1x1x8x1xi32> to tensor<1x1x?x1xi32>
    %c8 = arith.constant 8 : index
    %pack = linalg.pack %src padding_value(%pad : i32)
      inner_dims_pos = [0, 1]
      inner_tiles = [%c8, 1]
      into %cast {test_attr} : tensor<7x?xi32> -> tensor<1x1x?x1xi32>
    %res = tensor.cast %pack : tensor<1x1x?x1xi32> to tensor<1x1x8x1xi32>
    return %res : tensor<1x1x8x1xi32>
}

// -----

func.func @infer_and_fold_pack_unpack_same_tiles(%t: tensor<10x20x4x4xf32>) -> tensor<10x20x4x4xf32> {
  %dim1 = arith.constant 40 : index
  %dim2 = arith.constant 80 : index
  %tensor_empty = tensor.empty(%dim1, %dim2) : tensor<?x?xf32>
  %unpacked = linalg.unpack %t inner_dims_pos = [0, 1] inner_tiles = [4, 4] into %tensor_empty : tensor<10x20x4x4xf32> -> tensor<?x?xf32>
  %cast = tensor.cast %unpacked : tensor<?x?xf32> to tensor<40x80xf32>
  %tensor_empty1 = tensor.empty() : tensor<10x20x4x4xf32>
  %packed = linalg.pack %cast inner_dims_pos = [0, 1] inner_tiles = [4, 4] into %tensor_empty1 : tensor<40x80xf32> -> tensor<10x20x4x4xf32>
  return %packed : tensor<10x20x4x4xf32>
}

// -----

func.func @pack_dont_drop_attributes(%arg0: tensor<?x?x?xf16>, %arg1: tensor<128x?x100x16x1xf16>) -> tensor<128x?x100x16x1xf16> {
  %c32_i64 = arith.constant 32 : i64
  %cst = arith.constant 0.000000e+00 : f16
  %pack = linalg.pack %arg0 padding_value(%cst : f16) outer_dims_perm = [0, 1, 2] inner_dims_pos = [1, 2] inner_tiles = [16, 1] into %arg1 {test_attr} : tensor<?x?x?xf16> -> tensor<128x?x100x16x1xf16>
  return %pack : tensor<128x?x100x16x1xf16>
}
// -----

//===----------------------------------------------------------------------===//
// linalg.fill + linalg.unpack
//===----------------------------------------------------------------------===//
// Fold DstStyleOp -> tensor.unpack operations.
func.func @fold_dst_style_ops_into_unpack(%arg0 : tensor<?x?x16x64xf32>, %init : tensor<?x?xf32>) -> tensor<?x?xf32> {
  %cst = arith.constant 0.0 : f32
  %fill = linalg.fill ins(%cst : f32) outs(%init : tensor<?x?xf32>) -> tensor<?x?xf32>
  %unpack = linalg.unpack %arg0 inner_dims_pos = [0, 1] inner_tiles = [16, 64] into %fill : tensor<?x?x16x64xf32> -> tensor<?x?xf32>
  return %unpack : tensor<?x?xf32>
}

// -----

//===----------------------------------------------------------------------===//
// tensor.cast + linalg.unpack
//===----------------------------------------------------------------------===//

func.func @fold_cast_unpack_dynamic_tile_size(
  %src: tensor<1x1x8x1xi32>,
  %res: tensor<7x?xi32>) -> tensor<7x?xi32> {

    %cast = tensor.cast %src : tensor<1x1x8x1xi32> to tensor<1x1x?x1xi32>
    %c8 = arith.constant 8 : index
    %unpack = linalg.unpack %cast
      inner_dims_pos = [0, 1]
      inner_tiles = [%c8, 1]
      into %res {test_attr} : tensor<1x1x?x1xi32> -> tensor<7x?xi32>
    return %unpack : tensor<7x?xi32>
}

// -----

//===----------------------------------------------------------------------===//
// linalg.unpack + tensor.extract_slice
//===----------------------------------------------------------------------===//

func.func @fold_extract_slice_into_unpack_slicing_trailing_dim(%src : tensor<28x2x1x16x16xf32>, %dest : tensor<28x28x15xf32>) -> tensor<28x28x10xf32> {
  %unpack = linalg.unpack %src
      outer_dims_perm = [0, 1, 2]
      inner_dims_pos = [1, 2]
      inner_tiles = [16, 16]
      into %dest : tensor<28x2x1x16x16xf32> -> tensor<28x28x15xf32>
  %extracted_slice = tensor.extract_slice %unpack
      [0, 0, 0] [28, 28, 10] [1, 1, 1] : tensor<28x28x15xf32> to tensor<28x28x10xf32>
  return %extracted_slice : tensor<28x28x10xf32>
}

// -----

// The available dimension size is [17, 32], because CeilDiv(%d1, 16) == 2.

func.func @fold_extract_slice_into_unpack_slicing_dim_1(%src : tensor<28x2x1x16x16xf32>, %dest : tensor<28x28x15xf32>) -> tensor<28x17x15xf32> {
  %unpack = linalg.unpack %src
      inner_dims_pos = [1, 2]
      inner_tiles = [16, 16]
      into %dest : tensor<28x2x1x16x16xf32> -> tensor<28x28x15xf32>
  %extracted_slice = tensor.extract_slice %unpack
      [0, 0, 0] [28, 17, 15] [1, 1, 1] : tensor<28x28x15xf32> to tensor<28x17x15xf32>
  return %extracted_slice : tensor<28x17x15xf32>
}

// -----

// The available dimension size is [17, 32], because CeilDiv(%d1, 16) == 2.

func.func @negative_fold_extract_slice_into_unpack_artificial_padding(%src : tensor<28x2x1x16x16xf32>, %dest : tensor<28x28x15xf32>) -> tensor<28x16x15xf32> {
  %unpack = linalg.unpack %src
      inner_dims_pos = [1, 2]
      inner_tiles = [16, 16]
      into %dest : tensor<28x2x1x16x16xf32> -> tensor<28x28x15xf32>
  %extracted_slice = tensor.extract_slice %unpack
      [0, 0, 0] [28, 16, 15] [1, 1, 1] : tensor<28x28x15xf32> to tensor<28x16x15xf32>
  return %extracted_slice : tensor<28x16x15xf32>
}

// -----

func.func @negative_fold_extract_slice_into_unpack_dynamic(
    %src : tensor<28x2x?x16x16xf32>, %dest : tensor<28x32x?xf32>, %size : index
) -> tensor<28x28x?xf32> {
  %unpack = linalg.unpack %src
      outer_dims_perm = [0, 1, 2]
      inner_dims_pos = [1, 2]
      inner_tiles = [16, 16]
      into %dest : tensor<28x2x?x16x16xf32> -> tensor<28x32x?xf32>
  %extracted_slice = tensor.extract_slice %unpack
      [0, 0, 0] [28, 28, %size] [1, 1, 1] : tensor<28x32x?xf32> to tensor<28x28x?xf32>
  return %extracted_slice : tensor<28x28x?xf32>
}

// -----

func.func @negative_fold_extract_slice_into_unpack_rank_reducing(
    %src : tensor<28x2x16xf32>, %dest : tensor<28x32xf32>
) -> tensor<28xf32> {
  %unpack = linalg.unpack %src
      outer_dims_perm = [0, 1]
      inner_dims_pos = [1]
      inner_tiles = [16]
      into %dest : tensor<28x2x16xf32> -> tensor<28x32xf32>
  %extracted_slice = tensor.extract_slice %unpack
      [0, 0] [1, 28] [1, 1] : tensor<28x32xf32> to tensor<28xf32>
  return %extracted_slice : tensor<28xf32>
}


// -----

func.func @negative_fold_extract_slice_into_unpack_non_zero_offset(
    %src : tensor<28x2x16xf32>, %dest : tensor<28x32xf32>
) -> tensor<28x28xf32> {
  %unpack = linalg.unpack %src
      outer_dims_perm = [0, 1]
      inner_dims_pos = [1]
      inner_tiles = [16]
      into %dest : tensor<28x2x16xf32> -> tensor<28x32xf32>
  %extracted_slice = tensor.extract_slice %unpack
      [0, 1] [28, 28] [1, 1] : tensor<28x32xf32> to tensor<28x28xf32>
  return %extracted_slice : tensor<28x28xf32>
}


// -----

// Must not fold because extract_slice cuts the 0'th dimension from 30 to 28.
func.func @negative_fold_extract_slice_into_unpack_slice_over_non_tiled_dim(
    %src : tensor<30x2x16xf32>, %dest : tensor<30x32xf32>
) -> tensor<28x28xf32> {
  %unpack = linalg.unpack %src
      inner_dims_pos = [1]
      inner_tiles = [16]
      into %dest : tensor<30x2x16xf32> -> tensor<30x32xf32>
  %extracted_slice = tensor.extract_slice %unpack
      [0, 0] [28, 28] [1, 1] : tensor<30x32xf32> to tensor<28x28xf32>
  return %extracted_slice : tensor<28x28xf32>
}


// -----

// Must not fold because extract_slice's effect on the 0'th dimension is unknown.
func.func @negative_fold_extract_slice_into_unpack_slice_over_dynamic_dim(
    %src : tensor<?x2x16xf32>, %dest : tensor<?x32xf32>, %size : index
) -> tensor<?x28xf32> {
  %unpack = linalg.unpack %src
      inner_dims_pos = [1]
      inner_tiles = [16]
      into %dest : tensor<?x2x16xf32> -> tensor<?x32xf32>
  %extracted_slice = tensor.extract_slice %unpack
      [0, 0] [%size, 28] [1, 1] : tensor<?x32xf32> to tensor<?x28xf32>
  return %extracted_slice : tensor<?x28xf32>
}


// -----

func.func @fold_cast_unpack_dynamic_tile_size(
  %src: tensor<1x1x8x1xi32>,
  %res: tensor<7x?xi32>) -> tensor<7x?xi32> {

    %cast = tensor.cast %src : tensor<1x1x8x1xi32> to tensor<1x1x?x1xi32>
    %c8 = arith.constant 8 : index
    %unpack = linalg.unpack %cast
      inner_dims_pos = [0, 1]
      inner_tiles = [%c8, 1]
      into %res {test_attr} : tensor<1x1x?x1xi32> -> tensor<7x?xi32>
    return %unpack : tensor<7x?xi32>
}

// -----

func.func @fold_pack_unpack_tensor(%x: tensor<2x3xf32>) -> tensor<2x3xf32> {
  %unpacked = linalg.unpack %x outer_dims_perm = [] inner_dims_pos = [] inner_tiles = []
             into %x : tensor<2x3xf32> -> tensor<2x3xf32>
  %packed = linalg.pack %unpacked outer_dims_perm = [] inner_dims_pos = [] inner_tiles = []
             into %x : tensor<2x3xf32> -> tensor<2x3xf32>
  return %packed : tensor<2x3xf32>
}

// -----

// Test that pack/unpack canonicalization is disabled for memref versions.
func.func @negative_pack_unpack_memref_no_canonicalization(%source: memref<128x256xf32>, %packed: memref<16x8x8x32xf32>, %dest: memref<128x256xf32>) {
  linalg.pack %source inner_dims_pos = [0, 1] inner_tiles = [8, 32] into %packed : memref<128x256xf32> -> memref<16x8x8x32xf32>
  linalg.unpack %packed inner_dims_pos = [0, 1] inner_tiles = [8, 32] into %dest : memref<16x8x8x32xf32> -> memref<128x256xf32>
  return
}

// -----

// Test that unpack/pack canonicalization is disabled for memref versions.
func.func @negative_unpack_pack_memref_no_canonicalization(%packed: memref<16x8x8x32xf32>, %unpacked: memref<128x256xf32>, %dest: memref<16x8x8x32xf32>) {
  linalg.unpack %packed inner_dims_pos = [0, 1] inner_tiles = [8, 32] into %unpacked : memref<16x8x8x32xf32> -> memref<128x256xf32>
  linalg.pack %unpacked inner_dims_pos = [0, 1] inner_tiles = [8, 32] into %dest : memref<128x256xf32> -> memref<16x8x8x32xf32>
  return
}

// -----
func.func @fold_unpack_cast_inner_tile_dynamic_arg(%arg0: tensor<1x3x8x1xi32>, %arg1: index) -> tensor<7x3xi32> {
  %0 = tensor.empty() : tensor<7x3xi32>
  %cast = tensor.cast %arg0 : tensor<1x3x8x1xi32> to tensor<?x3x?x1xi32>
  %unpack = linalg.unpack %cast inner_dims_pos = [0, 1] inner_tiles = [%arg1, 1] into %0 : tensor<?x3x?x1xi32> -> tensor<7x3xi32>
  return %unpack : tensor<7x3xi32>
}


// -----
// Mismatched constant tile vs static packed shape: fold still drops the cast and
// takes inner tile sizes from the refined packed type.
func.func @fold_unpack_cast_inner_tile_inlined_mismatch(%arg0: tensor<1x3x8x1xi32>) -> tensor<7x3xi32> {
  %c256 = arith.constant 256 : index
  %1 = tensor.empty() : tensor<7x3xi32>
  %cast = tensor.cast %arg0 : tensor<1x3x8x1xi32> to tensor<?x3x?x1xi32>
  %unpack = linalg.unpack %cast inner_dims_pos = [0, 1] inner_tiles = [%c256, 1] into %1 : tensor<?x3x?x1xi32> -> tensor<7x3xi32>
  return %unpack : tensor<7x3xi32>
}

// -----

func.func @no_fold_pack_cast_inner_tile_dynamic_arg(%arg0: tensor<8x3xi32>, %arg1: index,
    %dest: tensor<?x3x?x1xi32>) -> tensor<?x3x?x1xi32> {
  %c0 = arith.constant 0 : i32
  %cast = tensor.cast %arg0 : tensor<8x3xi32> to tensor<?x?xi32>
  %pack = linalg.pack %cast
    padding_value(%c0 : i32)
    inner_dims_pos = [0, 1]
    inner_tiles = [%arg1, 1]
    into %dest : tensor<?x?xi32> -> tensor<?x3x?x1xi32>
  return %pack : tensor<?x3x?x1xi32>
}

// -----

func.func @no_fold_pack_cast_inner_tile_inlined_mismatch(%arg0: tensor<8x3xi32>,
    %dest: tensor<?x3x?x1xi32>) -> tensor<?x3x?x1xi32> {
  %c0 = arith.constant 0 : i32
  %c256 = arith.constant 256 : index
  %cast = tensor.cast %arg0 : tensor<8x3xi32> to tensor<?x?xi32>
  %pack = linalg.pack %cast
    padding_value(%c0 : i32)
    inner_dims_pos = [0, 1]
    inner_tiles = [%c256, 1]
    into %dest : tensor<?x?xi32> -> tensor<?x3x?x1xi32>
  return %pack : tensor<?x3x?x1xi32>
}
