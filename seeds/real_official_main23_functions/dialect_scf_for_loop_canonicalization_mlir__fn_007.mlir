func.func @scf_for_not_canonicalizable_3(%A : memref<i64>, %step : index) {
  // This example should simplify but affine_map is currently missing
  // semi-affine canonicalizations: `-(((s0 * s0 - 1) floordiv s0) * s0)`
  // should evaluate to (s0 - 1) * s0.
  // Note that this may require positivity assumptions on `s0`.
  // Revisit when support is added.
  %c0 = arith.constant 0 : index

  %ub2 = affine.apply affine_map<(d0)[s0] -> (s0 * d0)> (%step)[%step]
  scf.for %i = %c0 to %ub2 step %step {
    %1 = affine.min affine_map<(d0, d1, d2) -> (d0, d2 - d1)> (%step, %i, %ub2)
    %2 = arith.index_cast %1: index to i64
    memref.store %2, %A[]: memref<i64>
  }
  return
}
