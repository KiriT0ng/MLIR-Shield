func.func @bitcast_2d_scalable(%arg0: vector<2x[4]xi32>) -> vector<2x[2]xi64> {
  %0 = vector.bitcast %arg0 : vector<2x[4]xi32> to vector<2x[2]xi64>
  return %0 : vector<2x[2]xi64>
}
