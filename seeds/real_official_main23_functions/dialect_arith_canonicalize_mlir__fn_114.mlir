func.func @truncConstantSplat() -> vector<4xi8> {
  %c-2 = arith.constant -2 : i16
  %splat = vector.broadcast %c-2 : i16 to vector<4xi16>
  %trunc = arith.trunci %splat : vector<4xi16> to vector<4xi8>
  return %trunc : vector<4xi8>
}
