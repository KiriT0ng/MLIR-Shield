func.func @broadcast_vec2d_from_vec1d_scalable(%arg0: vector<[2]xf32>) -> vector<3x[2]xf32> {
  %0 = vector.broadcast %arg0 : vector<[2]xf32> to vector<3x[2]xf32>
  return %0 : vector<3x[2]xf32>
}
