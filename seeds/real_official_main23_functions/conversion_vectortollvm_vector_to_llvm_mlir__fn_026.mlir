func.func @broadcast_stretch_at_end_scalable(%arg0: vector<[4]x1xf32>) -> vector<[4]x3xf32> {
  %0 = vector.broadcast %arg0 : vector<[4]x1xf32> to vector<[4]x3xf32>
  return %0 : vector<[4]x3xf32>
}
