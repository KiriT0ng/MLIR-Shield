func.func @collapse_after_memref_cast_type_change_dynamic(%arg0: memref<1x1x1x?xi64>) -> memref<?x?xi64> {
  %casted = memref.cast %arg0 : memref<1x1x1x?xi64> to memref<1x1x?x?xi64>
  %collapsed = memref.collapse_shape %casted [[0, 1, 2], [3]] : memref<1x1x?x?xi64> into memref<?x?xi64>
  return %collapsed : memref<?x?xi64>
}
