func.func @ind_memref_rank_reassociation_711(%arg0: memref<2x3x4xf32>, %i: index, %j: index) -> f32 {
  %collapsed = memref.collapse_shape %arg0 [[0, 1], [2]] : memref<2x3x4xf32> into memref<6x4xf32>
  %expanded = memref.expand_shape %collapsed [[0, 1], [2]] output_shape [2, 3, 4] : memref<6x4xf32> into memref<2x3x4xf32>
  %v = memref.load %expanded[%i, %j, %i] : memref<2x3x4xf32>
  return %v : f32
}
