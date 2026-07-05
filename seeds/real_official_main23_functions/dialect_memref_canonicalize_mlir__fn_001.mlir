func.func @expand_shape_identity_fold(%arg0 : memref<5x4xi8>) -> memref<5x4xi8> {
  %0 = memref.expand_shape %arg0 [[0], [1]] output_shape [5, 4] : memref<5x4xi8> into memref<5x4xi8>
  return %0 : memref<5x4xi8>
}
