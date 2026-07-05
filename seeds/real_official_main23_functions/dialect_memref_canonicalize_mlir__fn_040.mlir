func.func @collapse_after_memref_cast(%arg0 : memref<?x512x1x?xf32>) -> memref<?x?xf32> {
  %dynamic = memref.cast %arg0: memref<?x512x1x?xf32> to memref<?x?x?x?xf32>
  %collapsed = memref.collapse_shape %dynamic [[0], [1, 2, 3]] : memref<?x?x?x?xf32> into memref<?x?xf32>
  return %collapsed : memref<?x?xf32>
}
