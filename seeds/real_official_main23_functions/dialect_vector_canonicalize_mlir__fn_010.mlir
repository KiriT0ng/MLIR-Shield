func.func @extract_from_create_mask_dynamic_position(%dim0: index, %index: index) -> vector<6xi1> {
  %c4 = arith.constant 4 : index
  %c3 = arith.constant 3 : index
  %mask = vector.create_mask %c3, %c4, %dim0 : vector<4x4x6xi1>
  %extract = vector.extract %mask[2, %index] : vector<6xi1> from vector<4x4x6xi1>
  return %extract : vector<6xi1>
}
