func.func @fold_prefetch_expand_shape(%src: memref<32xf32>, %i0: index, %i1: index) {
  %expand = memref.expand_shape %src [[0, 1]] output_shape [4, 8] : memref<32xf32> into memref<4x8xf32>
  memref.prefetch %expand[%i0, %i1], read, locality<2>, data : memref<4x8xf32>
  return
}
