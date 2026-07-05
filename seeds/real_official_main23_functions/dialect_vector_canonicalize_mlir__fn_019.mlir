func.func @extract_from_create_mask_dynamic_position_unknown(%dim0: index, %index: index) -> vector<6xi1> {
  %c2 = arith.constant 2 : index
  %mask = vector.create_mask %c2, %dim0 : vector<4x6xi1>
  %extract = vector.extract %mask[%index] : vector<6xi1> from vector<4x6xi1>
  return %extract : vector<6xi1>
}
