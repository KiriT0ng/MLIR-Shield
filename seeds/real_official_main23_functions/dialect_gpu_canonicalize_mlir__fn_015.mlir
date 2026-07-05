func.func @do_not_fold_memcpy_op3(%arg0: memref<1xi8>, %arg1: memref<i1>) {
  %0 = arith.constant 0 : index
  %1 = memref.view %arg0[%0][] : memref<1xi8> to memref<i1>
  gpu.memcpy  %1, %arg1 : memref<i1>, memref<i1>
  func.return
}
