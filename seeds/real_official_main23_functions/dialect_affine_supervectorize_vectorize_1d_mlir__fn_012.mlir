func.func @vec_rejected_6(%A : memref<?x?xf32>, %B : memref<?x?x?xf32>) {
   %c0 = arith.constant 0 : index
   %c1 = arith.constant 1 : index
   %c2 = arith.constant 2 : index
   %M = memref.dim %A, %c0 : memref<?x?xf32>
   %N = memref.dim %A, %c1 : memref<?x?xf32>
   %P = memref.dim %B, %c2 : memref<?x?x?xf32>

   affine.for %i12 = 0 to %M { // not vectorized, can never vectorize
     affine.for %i13 = 0 to %N { // not vectorized, can never vectorize
       affine.for %i14 = 0 to %P { // vectorized
         %a14 = affine.load %B[%i13, %i12 + %i13, %i12 + %i14] : memref<?x?x?xf32>
       }
     }
   }
   return
}
