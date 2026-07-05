func.func @extract_vec_2d_from_vec_3d_f32_poison_idx(%arg0: vector<4x3x16xf32>) -> vector<3x16xf32> {
  %0 = vector.extract %arg0[-1]: vector<3x16xf32> from vector<4x3x16xf32>
  return %0 : vector<3x16xf32>
}
