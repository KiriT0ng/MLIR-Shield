func.func @vec_rejected_5(%A : memref<?x?xf32>, %B : memref<?x?x?xf32>) {
   %c0 = arith.constant 0 : index
   %c1 = arith.constant 1 : index
   %c2 = arith.constant 2 : index
   %M = memref.dim %A, %c0 : memref<?x?xf32>
   %N = memref.dim %A, %c1 : memref<?x?xf32>
   %P = memref.dim %B, %c2 : memref<?x?x?xf32>

   affine.for %i10 = 0 to %M { // not vectorized, need per load transposes
     affine.for %i11 = 0 to %N { // not vectorized, need per load transposes
       %a11 = affine.load %A[%i10, %i11] : memref<?x?xf32>
       affine.store %a11, %A[%i11, %i10] : memref<?x?xf32>
     }
   }
   return
}
