func.func @replace_view_static_dims(%src: memref<?xi8>, %offset : index) -> memref<?x4xi32> {
  %c5 = arith.constant 5: index
  %res = memref.view %src[%offset][%c5] : memref<?xi8> to memref<?x4xi32>
  return %res : memref<?x4xi32>
}
