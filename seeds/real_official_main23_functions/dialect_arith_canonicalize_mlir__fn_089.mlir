func.func @unsignedExtendConstantVector() -> vector<4xi16> {
  %vector = arith.constant dense<[1, 3, 5, 7]> : vector<4xi8>
  %ext = arith.extui %vector : vector<4xi8> to vector<4xi16>
  return %ext : vector<4xi16>
}
