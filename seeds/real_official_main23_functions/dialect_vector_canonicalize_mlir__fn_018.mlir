func.func @extract_from_create_mask_dynamic_position_all_false(%dim0: index, %index: index) -> vector<6xi1> {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %mask = vector.create_mask %c1, %c0, %dim0 : vector<1x4x6xi1>
  %extract = vector.extract %mask[0, %index] : vector<6xi1> from vector<1x4x6xi1>
  return %extract : vector<6xi1>
}
