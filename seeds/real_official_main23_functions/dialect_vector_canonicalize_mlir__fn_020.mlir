func.func @extract_from_create_mask_mixed_position_unknown(%dim0: index, %index0: index) -> vector<4xi1> {
  %c2 = arith.constant 2 : index
  %mask = vector.create_mask %c2, %c2, %dim0 : vector<2x4x4xi1>
  %extract = vector.extract %mask[1, %index0] : vector<4xi1> from vector<2x4x4xi1>
  return %extract : vector<4xi1>
}
