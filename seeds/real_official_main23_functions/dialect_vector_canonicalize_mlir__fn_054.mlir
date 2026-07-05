func.func @fold_extracts(%a : vector<3x4x5x6xf32>) -> (f32, vector<4x5x6xf32>) {
  %b = vector.extract %a[0] : vector<4x5x6xf32> from vector<3x4x5x6xf32>
  %c = vector.extract %b[1, 2] : vector<6xf32> from vector<4x5x6xf32>
  %d = vector.extract %c[3] : f32 from vector<6xf32>

  %e = vector.extract %a[0] : vector<4x5x6xf32> from vector<3x4x5x6xf32>

  return %d, %e : f32, vector<4x5x6xf32>
}
