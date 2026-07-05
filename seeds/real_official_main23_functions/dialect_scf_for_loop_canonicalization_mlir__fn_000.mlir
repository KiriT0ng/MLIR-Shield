func.func @scf_for_canonicalize_min(%A : memref<i64>) {
  %c0 = arith.constant 0 : index
  %c2 = arith.constant 2 : index
  %c4 = arith.constant 4 : index

  scf.for %i = %c0 to %c4 step %c2 {
    %1 = affine.min affine_map<(d0, d1)[] -> (2, d1 - d0)> (%i, %c4)
    %2 = arith.index_cast %1: index to i64
    memref.store %2, %A[]: memref<i64>
  }
  return
}
