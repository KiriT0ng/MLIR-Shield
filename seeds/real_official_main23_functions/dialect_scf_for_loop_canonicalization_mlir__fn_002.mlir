func.func @scf_for_max_not_canonicalizable(%A : memref<i64>) {
  %c0 = arith.constant 0 : index
  %c2 = arith.constant 2 : index
  %c3 = arith.constant 3 : index
  %c4 = arith.constant 4 : index

  scf.for %i = %c0 to %c4 step %c2 {
    %1 = affine.max affine_map<(d0, d1)[] -> (-2, -(d1 - d0))> (%i, %c3)
    %2 = arith.index_cast %1: index to i64
    memref.store %2, %A[]: memref<i64>
  }
  return
}
