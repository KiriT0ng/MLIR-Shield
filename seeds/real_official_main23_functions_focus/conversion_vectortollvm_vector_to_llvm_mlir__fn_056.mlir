func.func @extract_scalar_from_vec_1d_f32_poison_idx(%arg0: vector<16xf32>) -> f32 {
  %0 = vector.extract %arg0[-1]: f32 from vector<16xf32>
  return %0 : f32
}
