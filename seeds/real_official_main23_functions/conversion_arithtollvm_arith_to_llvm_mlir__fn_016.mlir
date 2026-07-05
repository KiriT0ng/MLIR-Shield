func.func @fptosi_vector(%arg0 : vector<2xf16>, %arg1 : vector<2xf32>, %arg2 : vector<2xf64>) {
  %0 = arith.fptosi %arg0: vector<2xf16> to vector<2xi32>
  %1 = arith.fptosi %arg0: vector<2xf16> to vector<2xi64>
  %2 = arith.fptosi %arg1: vector<2xf32> to vector<2xi32>
  %3 = arith.fptosi %arg1: vector<2xf32> to vector<2xi64>
  %4 = arith.fptosi %arg2: vector<2xf64> to vector<2xi32>
  %5 = arith.fptosi %arg2: vector<2xf64> to vector<2xi64>
  return
}
