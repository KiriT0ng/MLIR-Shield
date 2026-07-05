func.func @vec_rejected_10(%A : memref<?x?xf32>, %B : memref<?x?x?xf32>) {
   %c0 = arith.constant 0 : index
   %c1 = arith.constant 1 : index
   %c2 = arith.constant 2 : index
   %M = memref.dim %A, %c0 : memref<?x?xf32>
   %N = memref.dim %A, %c1 : memref<?x?xf32>
   %P = memref.dim %B, %c2 : memref<?x?x?xf32>

   affine.for %i15 = 0 to %M { // not vectorized due to condition below
     affine.if #set0(%i15) {
       %a15 = affine.load %A[%c0, %c0] : memref<?x?xf32>
     }
   }
   return
}
