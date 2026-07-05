func.func @negative_canonicalize_shapecast_broadcast_to_broadcast_append_dim(%arg0 : vector<2xf32>) -> vector<2x4xf32> {
  %0 = vector.shape_cast %arg0 : vector<2xf32> to vector<2x1xf32>
  %1 = vector.broadcast %0 : vector<2x1xf32> to vector<2x4xf32>
  return %1 : vector<2x4xf32>
}
