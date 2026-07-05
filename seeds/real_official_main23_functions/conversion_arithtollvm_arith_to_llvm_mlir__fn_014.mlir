func.func @fpext_vector(%arg0 : vector<2xf16>, %arg1 : vector<2xf32>) {
  %0 = arith.extf %arg0: vector<2xf16> to vector<2xf32>
  %1 = arith.extf %arg0: vector<2xf16> to vector<2xf64>
  %2 = arith.extf %arg1: vector<2xf32> to vector<2xf64>
  return
}
