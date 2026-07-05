func.func @constant_mask_to_false_splat() -> vector<2x4xi1> {
  %0 = vector.constant_mask [0, 0] : vector<2x4xi1>
  return %0 : vector<2x4xi1>
}
