func.func @scf_for_not_canonicalizable_2(%A : memref<i64>, %step : index) {
  // This example should simplify but affine_map is currently missing
  // semi-affine canonicalizations: `((s0 * 42 - 1) floordiv s0) * s0`
  // should evaluate to 41 * s0.
  // Note that this may require positivity assumptions on `s0`.
  // Revisit when support is added.
  %c0 = arith.constant 0 : index

  %ub = affine.apply affine_map<(d0) -> (42 * d0)> (%step)
  scf.for %i = %c0 to %ub step %step {
    %1 = affine.min affine_map<(d0, d1, d2) -> (d0, d1 - d2)> (%step, %ub, %i)
    %2 = arith.index_cast %1: index to i64
    memref.store %2, %A[]: memref<i64>
  }
  return
}
