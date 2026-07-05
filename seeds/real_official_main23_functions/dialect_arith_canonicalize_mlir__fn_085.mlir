func.func @signExtendConstantSplat() -> vector<4xi16> {
  %c-2 = arith.constant -2 : i8
  %splat = vector.broadcast %c-2 : i8 to vector<4xi8>
  %ext = arith.extsi %splat : vector<4xi8> to vector<4xi16>
  return %ext : vector<4xi16>
}
