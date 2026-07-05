func.func @collapse_shape_identity_fold(%arg0 : memref<5xi8>) -> memref<5xi8> {
  %0 = memref.collapse_shape %arg0 [[0]] : memref<5xi8> into memref<5xi8>
  return %0 : memref<5xi8>
}
