func.func @extract_from_constant_mask_multiple_indices() -> vector<4xi1> {
  %mask = vector.constant_mask [2, 3, 3] : vector<4x4x4xi1>
  %extract = vector.extract %mask[1, 2] : vector<4xi1> from vector<4x4x4xi1>
  return %extract : vector<4xi1>
}
