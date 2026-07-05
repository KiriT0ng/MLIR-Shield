func.func @mulsiExtendedOneRhsSplat(%arg0: vector<3xi32>) -> (vector<3xi32>, vector<3xi32>) {
  %one = arith.constant dense<1> : vector<3xi32>
  %low, %high = arith.mulsi_extended %arg0, %one: vector<3xi32>
  return %low, %high : vector<3xi32>, vector<3xi32>
}
