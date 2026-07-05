func.func @matvec(%arg0: memref<?xi8>, %M: index, %N: index) {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %2 = memref.view %arg0[%c0][%M, %N] : memref<?xi8> to memref<?x?xf32>
  %3 = memref.view %arg0[%c0][%M] : memref<?xi8> to memref<?xf32>
  %4 = memref.view %arg0[%c0][%N] : memref<?xi8> to memref<?xf32>
  linalg.matvec ins(%2, %3: memref<?x?xf32>, memref<?xf32>)
               outs(%4 : memref<?xf32>)
  return
}
