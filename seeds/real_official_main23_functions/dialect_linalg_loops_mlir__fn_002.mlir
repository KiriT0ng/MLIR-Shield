func.func @dot(%arg0: memref<?xi8>, %M: index) {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %1 = memref.view %arg0[%c0][%M] : memref<?xi8> to memref<?xf32>
  %2 = memref.view %arg0[%c0][%M] : memref<?xi8> to memref<?xf32>
  %3 = memref.view %arg0[%c0][] : memref<?xi8> to memref<f32>
  linalg.dot ins(%1, %2 : memref<?xf32>, memref<?xf32>)
            outs(%3 : memref<f32>)
  return
}
