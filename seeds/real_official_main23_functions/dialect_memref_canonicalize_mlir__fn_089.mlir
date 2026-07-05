func.func @fold_view_same_source_result_types(%0: memref<128xi8>) -> memref<128xi8> {
  %c0 = arith.constant 0 : index
  %res = memref.view %0[%c0][] : memref<128xi8> to memref<128xi8>
  return %res : memref<128xi8>
}
