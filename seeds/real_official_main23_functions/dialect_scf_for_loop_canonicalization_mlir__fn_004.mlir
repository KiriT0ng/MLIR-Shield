func.func @scf_for_not_canonicalizable_1(%A : memref<i64>) {
  // This should not canonicalize because: 4 - %i may take the value 1 < 2.
  %c1 = arith.constant 1 : index
  %c2 = arith.constant 2 : index
  %c4 = arith.constant 4 : index

  scf.for %i = %c1 to %c4 step %c2 {
    %1 = affine.min affine_map<(d0)[s0] -> (2, s0 - d0)> (%i)[%c4]
    %2 = arith.index_cast %1: index to i64
    memref.store %2, %A[]: memref<i64>
  }
  return
}
