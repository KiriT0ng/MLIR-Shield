func.func @vec_rejected_3(%A : memref<?x?xf32>, %B : memref<?x?x?xf32>) {
   %c0 = arith.constant 0 : index
   %c1 = arith.constant 1 : index
   %c2 = arith.constant 2 : index
   %M = memref.dim %A, %c0 : memref<?x?xf32>
   %N = memref.dim %A, %c1 : memref<?x?xf32>
   %P = memref.dim %B, %c2 : memref<?x?x?xf32>

   affine.for %i4 = 0 to %M { // vectorized
     affine.for %i5 = 0 to %N { // not vectorized, would vectorize with --test-fastest-varying=1
       %a5 = affine.load %A[%i5, %i4] : memref<?x?xf32>
     }
   }
   return
}
