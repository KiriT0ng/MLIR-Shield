func.func @deinterleave_2d(%arg: vector<2x8xf32>) -> (vector<2x4xf32>, vector<2x4xf32>) {
  %0, %1 = vector.deinterleave %arg : vector<2x8xf32> -> vector<2x4xf32>
  return %0, %1 : vector<2x4xf32>, vector<2x4xf32>
}
