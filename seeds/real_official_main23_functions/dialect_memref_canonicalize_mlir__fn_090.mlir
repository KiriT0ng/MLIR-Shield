func.func @non_fold_view_non_zero_offset(%0: memref<128xi8>) -> memref<128xi8> {
  %c1 = arith.constant 1 : index
  %res = memref.view %0[%c1][] : memref<128xi8> to memref<128xi8>
  return %res : memref<128xi8>
}
