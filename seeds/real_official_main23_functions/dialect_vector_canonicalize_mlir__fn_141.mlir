func.func @extract_1d_constant() -> (i32, index, f32) {
  %icst = arith.constant dense<[1, 2, 3, 4]> : vector<4xi32>
  %e = vector.extract %icst[2] : i32 from vector<4xi32>
  %idx_cst = arith.constant dense<[0, 1, 2]> : vector<3xindex>
  %f = vector.extract %idx_cst[1] : index from vector<3xindex>
  %fcst = arith.constant dense<[2.000000e+00, 3.000000e+00, 4.000000e+00]> : vector<3xf32>
  %g = vector.extract %fcst[0] : f32 from vector<3xf32>
  return %e, %f, %g : i32, index, f32
}
