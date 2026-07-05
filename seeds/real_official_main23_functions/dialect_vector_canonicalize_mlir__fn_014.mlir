func.func @extract_scalar_poison_idx_non_cst(%a: vector<4x5xf32>) -> f32 {
  %c_neg_1 = arith.constant -1 : index
  %0 = vector.extract %a[%c_neg_1, 0] : f32 from vector<4x5xf32>
  return %0 : f32
}
