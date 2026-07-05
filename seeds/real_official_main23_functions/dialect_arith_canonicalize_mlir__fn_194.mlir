func.func @mulsiExtendedVectorConstants() -> (vector<3xi8>, vector<3xi8>) {
  %cstA = arith.constant dense<[5, 37, -17]> : vector<3xi8>
  %cstB = arith.constant dense<[13, 99, -2]> : vector<3xi8>
  %low, %high = arith.mulsi_extended %cstA, %cstB: vector<3xi8>
  return %low, %high : vector<3xi8>, vector<3xi8>
}
