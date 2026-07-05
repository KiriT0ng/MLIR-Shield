func.func @extract_from_non_constant_create_mask(%dim0: index) -> vector<[2]xi1> {
  %mask = vector.create_mask %dim0, %dim0 : vector<[2]x[2]xi1>
  %extract = vector.extract %mask[0] : vector<[2]xi1> from vector<[2]x[2]xi1>
  return %extract : vector<[2]xi1>
}
