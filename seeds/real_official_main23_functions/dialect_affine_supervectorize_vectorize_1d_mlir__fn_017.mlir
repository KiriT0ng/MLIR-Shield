func.func @vec_rejected_11(%A : memref<?x?xf32>, %B : memref<?x?x?xf32>) {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c2 = arith.constant 2 : index
  %M = memref.dim %A, %c0 : memref<?x?xf32>
  %N = memref.dim %A, %c1 : memref<?x?xf32>
  %P = memref.dim %B, %c2 : memref<?x?x?xf32>

  // This is similar to vec_rejected_5, but the order of indices is different.
  affine.for %i10 = 0 to %M { // not vectorized
    affine.for %i11 = 0 to %N { // not vectorized
      %a11 = affine.load %A[%i11, %i10] : memref<?x?xf32>
      affine.store %a11, %A[%i10, %i11] : memref<?x?xf32>
    }
  }
  return
}
