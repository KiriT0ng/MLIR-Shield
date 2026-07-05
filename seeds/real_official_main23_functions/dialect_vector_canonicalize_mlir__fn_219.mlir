func.func @rank_0_shuffle_to_interleave(%arg0: vector<f64>, %arg1: vector<f64>) -> vector<2xf64> {
  %0 = vector.shuffle %arg0, %arg1 [0, 1] : vector<f64>, vector<f64>
  return %0 : vector<2xf64>
}
