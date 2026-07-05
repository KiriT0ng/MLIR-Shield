func.func @constant_mask_0d_f() -> vector<i1> {
  %0 = vector.constant_mask [0] : vector<i1>
  return %0 : vector<i1>
}
