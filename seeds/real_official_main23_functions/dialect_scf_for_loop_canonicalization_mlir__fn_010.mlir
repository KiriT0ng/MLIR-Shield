func.func @scf_parallel_canonicalize_min_2(%A : memref<i64>) {
  %c1 = arith.constant 1 : index
  %c2 = arith.constant 2 : index
  %c7 = arith.constant 7 : index

  scf.parallel (%i) = (%c1) to (%c7) step (%c2) {
    %1 = affine.min affine_map<(d0)[s0] -> (2, s0 - d0)> (%i)[%c7]
    %2 = arith.index_cast %1: index to i64
    memref.store %2, %A[]: memref<i64>
  }
  return
}
