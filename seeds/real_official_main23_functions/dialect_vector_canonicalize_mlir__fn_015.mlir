func.func @no_fold_extract_scalar_oob_idx(%a: vector<4x5xf32>) -> f32 {
  %c_neg_2 = arith.constant -2 : index
  %0 = vector.extract %a[%c_neg_2, 0] : f32 from vector<4x5xf32>
  return %0 : f32
}
