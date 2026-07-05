func.func @negative_constant_mask_2d_leading_scalable() -> vector<[4]x4xi1> {
  %0 = vector.constant_mask [4, 2] : vector<[4]x4xi1>
  return %0 : vector<[4]x4xi1>
}
