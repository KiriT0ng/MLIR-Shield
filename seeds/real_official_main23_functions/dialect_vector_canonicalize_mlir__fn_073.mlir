func.func @extract_no_fold_scalar_to_0d(%v: vector<f32>) -> f32 {
  %0 = vector.extract %v[] : f32 from vector<f32>
  return %0 : f32
}
