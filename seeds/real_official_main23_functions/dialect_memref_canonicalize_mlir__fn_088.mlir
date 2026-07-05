func.func @fold_view_cast(%0: memref<128xi8>) -> memref<i32> {
  %c0 = arith.constant 0 : index
  %1 = memref.cast %0 : memref<128xi8> to memref<?xi8>
  %res = memref.view %1[%c0][] : memref<?xi8> to memref<i32>
  return %res : memref<i32>
}
