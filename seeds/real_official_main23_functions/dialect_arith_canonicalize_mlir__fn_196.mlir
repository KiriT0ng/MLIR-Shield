func.func @muluiExtendedZeroRhsSplat(%arg0: vector<3xi32>) -> (vector<3xi32>, vector<3xi32>) {
  %zero = arith.constant dense<0> : vector<3xi32>
  %low, %high = arith.mului_extended %arg0, %zero: vector<3xi32>
  return %low, %high : vector<3xi32>, vector<3xi32>
}
