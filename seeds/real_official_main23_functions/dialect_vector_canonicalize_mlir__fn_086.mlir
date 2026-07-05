func.func @canonicalize_shapecast_broadcast_to_broadcast_prepend_dim(%arg0 : vector<2xf32>) -> vector<32x2xf32> {
  %0 = vector.shape_cast %arg0 : vector<2xf32> to vector<1x2xf32>
  %1 = vector.broadcast %0 : vector<1x2xf32> to vector<32x2xf32>
  return %1 : vector<32x2xf32>
}
