func.func @truncConstantVector() -> vector<4xi8> {
  %vector = arith.constant dense<[1, 3, 5, 7]> : vector<4xi16>
  %trunc = arith.trunci %vector : vector<4xi16> to vector<4xi8>
  return %trunc : vector<4xi8>
}
