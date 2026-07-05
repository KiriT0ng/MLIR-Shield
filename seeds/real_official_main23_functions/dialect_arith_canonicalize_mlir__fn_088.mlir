func.func @unsignedExtendConstantSplat() -> vector<4xi16> {
  %c2 = arith.constant 2 : i8
  %splat = vector.broadcast %c2 : i8 to vector<4xi8>
  %ext = arith.extui %splat : vector<4xi8> to vector<4xi16>
  return %ext : vector<4xi16>
}
