func.func @truncExtsiVector(%arg0: vector<2xi32>) -> vector<2xi16> {
  %extsi = arith.extsi %arg0 : vector<2xi32> to vector<2xi64>
  %trunci = arith.trunci %extsi : vector<2xi64> to vector<2xi16>
  return %trunci : vector<2xi16>
}
