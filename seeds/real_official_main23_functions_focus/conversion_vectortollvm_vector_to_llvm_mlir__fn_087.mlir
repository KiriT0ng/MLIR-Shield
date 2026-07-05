func.func @constant_mask_1d_scalable_all_true() -> vector<[8]xi1> {
  %0 = vector.constant_mask [8] : vector<[8]xi1>
  return %0 : vector<[8]xi1>
}
