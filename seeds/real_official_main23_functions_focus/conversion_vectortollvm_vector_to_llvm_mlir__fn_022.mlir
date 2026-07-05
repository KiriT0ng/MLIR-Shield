func.func @broadcast_stretch_scalable(%arg0: vector<1xf32>) -> vector<[4]xf32> {
  %0 = vector.broadcast %arg0 : vector<1xf32> to vector<[4]xf32>
  return %0 : vector<[4]xf32>
}
