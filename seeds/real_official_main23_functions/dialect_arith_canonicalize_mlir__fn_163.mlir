func.func @adduiExtendedZeroRhsSplat(%arg0: vector<4xi32>) -> (vector<4xi32>, vector<4xi1>) {
  %zero = arith.constant dense<0> : vector<4xi32>
  %sum, %overflow = arith.addui_extended %arg0, %zero: vector<4xi32>, vector<4xi1>
  return %sum, %overflow : vector<4xi32>, vector<4xi1>
}
