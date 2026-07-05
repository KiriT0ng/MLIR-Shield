func.func @extract_from_create_mask(%dim0: index, %dim1: index) -> vector<[4]x[4]xi1> {
  %c2 = arith.constant 2 : index
  %mask = vector.create_mask %c2, %dim0, %dim1 : vector<4x[4]x[4]xi1>
  %extract = vector.extract %mask[1] : vector<[4]x[4]xi1> from vector<4x[4]x[4]xi1>
  return %extract : vector<[4]x[4]xi1>
}
