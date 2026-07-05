func.func @broadcast_stretch_in_middle_scalable_v2(%arg0: vector<[4]x1x2xf32>) -> vector<[4]x3x2xf32> {
  %0 = vector.broadcast %arg0 : vector<[4]x1x2xf32> to vector<[4]x3x2xf32>
  return %0 : vector<[4]x3x2xf32>
}
