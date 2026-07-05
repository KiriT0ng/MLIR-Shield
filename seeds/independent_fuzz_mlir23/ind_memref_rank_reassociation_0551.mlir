func.func @ind_memref_rank_reassociation_551(%arg0: memref<4x5x2xf32>, %i: index, %j: index) -> f32 {
  %collapsed = memref.collapse_shape %arg0 [[0, 1], [2]] : memref<4x5x2xf32> into memref<20x2xf32>
  %expanded = memref.expand_shape %collapsed [[0, 1], [2]] output_shape [4, 5, 2] : memref<20x2xf32> into memref<4x5x2xf32>
  %v = memref.load %expanded[%i, %j, %i] : memref<4x5x2xf32>
  return %v : f32
}
