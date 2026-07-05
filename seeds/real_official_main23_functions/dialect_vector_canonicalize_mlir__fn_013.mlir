func.func @extract_scalar_poison_idx(%a: vector<4x5xf32>) -> f32 {
  %0 = vector.extract %a[-1, 0] : f32 from vector<4x5xf32>
  return %0 : f32
}
