func.func @muluiExtendedVectorConstants() -> (vector<3xi8>, vector<3xi8>) {
  %cstA = arith.constant dense<[5, 37, 255]> : vector<3xi8>
  %cstB = arith.constant dense<[13, 99, 255]> : vector<3xi8>
  %low, %high = arith.mului_extended %cstA, %cstB: vector<3xi8>
  return %low, %high : vector<3xi8>, vector<3xi8>
}
