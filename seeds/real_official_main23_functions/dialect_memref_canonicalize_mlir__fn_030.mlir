func.func @fold_collapse_collapse_of_expand(%arg0 : memref<?x?xf32>, %sz0: index, %sz1: index)
    -> memref<?x?xf32> {
  %0 = memref.expand_shape %arg0 [[0, 1], [2]] output_shape [%sz0, 4, %sz1]
      : memref<?x?xf32> into memref<?x4x?xf32>
  %1 = memref.collapse_shape %0 [[0, 1], [2]]
      : memref<?x4x?xf32> into memref<?x?xf32>
  return %1 : memref<?x?xf32>
}
