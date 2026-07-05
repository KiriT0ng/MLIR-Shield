func.func @vec_constant_with_two_users(%M : index, %N : index) -> (f32, f32) {
  %A = memref.alloc (%M, %N) : memref<?x?xf32, 0>
  %B = memref.alloc (%M) : memref<?xf32, 0>
  %f1 = arith.constant 1.0 : f32
  affine.for %i0 = 0 to %M { // vectorized
    affine.for %i1 = 0 to %N {
      affine.store %f1, %A[%i1, %i0] : memref<?x?xf32, 0>
    }
    affine.store %f1, %B[%i0] : memref<?xf32, 0>
  }
  %c12 = arith.constant 12 : index
  %res1 = affine.load %A[%c12, %c12] : memref<?x?xf32, 0>
  %res2 = affine.load %B[%c12] : memref<?xf32, 0>
  return %res1, %res2 : f32, f32
}
