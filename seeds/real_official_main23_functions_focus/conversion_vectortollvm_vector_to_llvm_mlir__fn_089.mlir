func.func @constant_mask_2d_trailing_scalable() -> vector<4x[4]xi1> {
  %0 = vector.constant_mask [2, 4] : vector<4x[4]xi1>
  return %0 : vector<4x[4]xi1>
}
