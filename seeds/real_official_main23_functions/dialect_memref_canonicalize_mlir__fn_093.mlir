func.func @non_replace_view_negative_static_dims(%src: memref<?xi8>, %offset : index) -> memref<?x4xi32> {
  %c-1 = arith.constant -1: index
  %res = memref.view %src[%offset][%c-1] : memref<?xi8> to memref<?x4xi32>
  return %res : memref<?x4xi32>
}
