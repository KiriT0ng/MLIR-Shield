func.func @extract_from_create_mask_leading_scalable(%dim0: index) -> vector<8xi1> {
  %c3 = arith.constant 3 : index
  %mask = vector.create_mask %c3, %dim0 : vector<[4]x8xi1>
  %extract = vector.extract %mask[1] : vector<8xi1> from vector<[4]x8xi1>
  return %extract : vector<8xi1>
}
