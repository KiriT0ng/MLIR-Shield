func.func @bitcast_1d(%arg0: vector<2xf32>) {
  arith.bitcast %arg0 : vector<2xf32> to vector<2xi32>
  return
}
