func.func @fptrunc_vector(%arg0 : vector<2xf32>, %arg1 : vector<2xf64>) {
  %0 = arith.truncf %arg0: vector<2xf32> to vector<2xf16>
  %1 = arith.truncf %arg1: vector<2xf64> to vector<2xf16>
  %2 = arith.truncf %arg1: vector<2xf64> to vector<2xf32>
  return
}
