func.func @broadcast_stretch_at_start_scalable(%arg0: vector<1x[4]xf32>) -> vector<3x[4]xf32> {
  %0 = vector.broadcast %arg0 : vector<1x[4]xf32> to vector<3x[4]xf32>
  return %0 : vector<3x[4]xf32>
}
