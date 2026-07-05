func.func @non_fold_view_same_source_dynamic_size(%0: memref<?xi8>, %arg0 : index) -> memref<?xi8> {
  %c0 = arith.constant 0: index
  %res = memref.view %0[%c0][%arg0] : memref<?xi8> to memref<?xi8>
  return %res : memref<?xi8>
}
