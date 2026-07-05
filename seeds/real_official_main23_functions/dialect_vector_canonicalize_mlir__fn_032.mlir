func.func @constant_mask_to_true_splat_0d() -> vector<i1> {
  %0 = vector.constant_mask [1] : vector<i1>
  return %0 : vector<i1>
}
