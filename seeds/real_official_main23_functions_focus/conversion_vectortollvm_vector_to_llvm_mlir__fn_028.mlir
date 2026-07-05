func.func @broadcast_stretch_in_middle_scalable_v1(%arg0: vector<4x1x[2]xf32>) -> vector<4x3x[2]xf32> {
  %0 = vector.broadcast %arg0 : vector<4x1x[2]xf32> to vector<4x3x[2]xf32>
  return %0 : vector<4x3x[2]xf32>
}
