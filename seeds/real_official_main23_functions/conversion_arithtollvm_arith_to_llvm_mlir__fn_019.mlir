func.func @uitofp_vector(%arg0 : vector<2xi16>, %arg1 : vector<2xi32>, %arg2 : vector<2xi64>) {
  %0 = arith.uitofp %arg0: vector<2xi16> to vector<2xf32>
  %1 = arith.uitofp %arg0: vector<2xi16> to vector<2xf64>
  %2 = arith.uitofp %arg1: vector<2xi32> to vector<2xf32>
  %3 = arith.uitofp %arg1: vector<2xi32> to vector<2xf64>
  %4 = arith.uitofp %arg2: vector<2xi64> to vector<2xf32>
  %5 = arith.uitofp %arg2: vector<2xi64> to vector<2xf64>
  return
}
