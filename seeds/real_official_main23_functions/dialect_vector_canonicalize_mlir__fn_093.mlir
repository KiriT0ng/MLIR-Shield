func.func @negative_canonicalize_shapecast_broadcast_to_broadcast_remove_trailing_dim(%arg0 : vector<2x1xf32>) -> vector<32x2xf32> {
  %0 = vector.shape_cast %arg0 : vector<2x1xf32> to vector<2xf32>
  %1 = vector.broadcast %0 : vector<2xf32> to vector<32x2xf32>
  return %1 : vector<32x2xf32>
}
