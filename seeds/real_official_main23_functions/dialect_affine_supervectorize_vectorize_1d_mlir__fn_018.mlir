func.func @vec_rejected_sequential(%A : memref<?xf32>) {
  %c0 = arith.constant 0 : index
  %N = memref.dim %A, %c0 : memref<?xf32>
  affine.for %i = 0 to %N {
    %a = affine.load %A[%i] : memref<?xf32>
    affine.store %a, %A[%i + 1] : memref<?xf32>
  }
  return
}
