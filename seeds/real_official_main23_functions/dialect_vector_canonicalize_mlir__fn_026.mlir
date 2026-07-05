func.func @extract_from_constant_mask_dynamic_position_all_true(%index: index) -> vector<4xi1> {
  // The mask covers the entire first dimension, so a dynamic index is fine.
  %mask = vector.constant_mask [4, 3] : vector<4x4xi1>
  %extract = vector.extract %mask[%index] : vector<4xi1> from vector<4x4xi1>
  return %extract : vector<4xi1>
}
