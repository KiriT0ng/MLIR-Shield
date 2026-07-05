func.func @vec_rejected_7(%A : memref<?x?xf32>, %B : memref<?x?x?xf32>) {
   %c0 = arith.constant 0 : index
   %c1 = arith.constant 1 : index
   %c2 = arith.constant 2 : index
   %M = memref.dim %A, %c0 : memref<?x?xf32>
   %N = memref.dim %A, %c1 : memref<?x?xf32>
   %P = memref.dim %B, %c2 : memref<?x?x?xf32>

   affine.for %i16 = 0 to %M { // not vectorized, can't vectorize a vector load
     %a16 = memref.alloc(%M) : memref<?xvector<2xf32>>
     %l16 = affine.load %a16[%i16] : memref<?xvector<2xf32>>
   }
   return
}
