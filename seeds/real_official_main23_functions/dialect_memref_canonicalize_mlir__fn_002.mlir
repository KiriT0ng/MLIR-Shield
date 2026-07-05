func.func @collapse_expand_rank0_cancel(%arg0 : memref<1x1xi8>) -> memref<1x1xi8> {
  %0 = memref.collapse_shape %arg0 [] : memref<1x1xi8> into memref<i8>
  %1 = memref.expand_shape %0 [] output_shape [1, 1] : memref<i8> into memref<1x1xi8>
  return %1 : memref<1x1xi8>
}
