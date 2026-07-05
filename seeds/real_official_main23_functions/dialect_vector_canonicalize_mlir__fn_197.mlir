func.func @bitcast(%a: vector<4x8xf32>) -> vector<4x16xi16> {
  %0 = vector.bitcast %a : vector<4x8xf32> to vector<4x8xi32>
  %1 = vector.bitcast %0 : vector<4x8xi32> to vector<4x16xi16>
  return %1 : vector<4x16xi16>
}
