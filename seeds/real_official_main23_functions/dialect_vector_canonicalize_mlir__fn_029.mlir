func.func @extract_scalar_from_constant_mask_outside_bounds() -> i1 {
  %mask = vector.constant_mask [2, 3] : vector<4x4xi1>
  %extract = vector.extract %mask[0, 3] : i1 from vector<4x4xi1>
  return %extract : i1
}
