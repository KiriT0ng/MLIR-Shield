func.func @compose_expand_of_expand(%arg0 : memref<?x?xf32>, %sz0: index, %sz1: index, %sz2: index, %sz3: index)
    -> memref<?x6x4x5x?xf32> {
  %0 = memref.expand_shape %arg0 [[0, 1], [2]] output_shape [%sz0, 4, %sz1]
      : memref<?x?xf32> into memref<?x4x?xf32>
  %1 = memref.expand_shape %0 [[0, 1], [2], [3, 4]] output_shape [%sz2, 6, 4, 5, %sz3] : memref<?x4x?xf32> into memref<?x6x4x5x?xf32>
  return %1 : memref<?x6x4x5x?xf32>
}
