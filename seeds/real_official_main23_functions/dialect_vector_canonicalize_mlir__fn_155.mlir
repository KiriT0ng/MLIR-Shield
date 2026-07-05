func.func @extract_from_extract_chain_should_not_fold_dynamic_extracts(%v: vector<2x4xf32>, %index: index) -> f32 {
  %0 = vector.extract %v[%index] : vector<4xf32> from vector<2x4xf32>
  %1 = vector.extract %0[1] : f32 from vector<4xf32>
  return %1 : f32
}
