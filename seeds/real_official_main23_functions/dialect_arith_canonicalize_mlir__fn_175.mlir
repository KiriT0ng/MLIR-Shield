func.func @subuiExtendedZeroRhsSplat(%arg0: vector<4xi32>) -> (vector<4xi32>, vector<4xi1>) {
  %zero = arith.constant dense<0> : vector<4xi32>
  %diff, %borrow = arith.subui_extended %arg0, %zero: vector<4xi32>, vector<4xi1>
  return %diff, %borrow : vector<4xi32>, vector<4xi1>
}
