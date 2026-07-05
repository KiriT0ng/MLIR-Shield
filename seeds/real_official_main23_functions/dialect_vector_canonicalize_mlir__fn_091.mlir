func.func @negative_canonicalize_shapecast_broadcast_invalid_broadcasted_dims(%arg0 : vector<2x1xf32>) -> vector<2x2xf32> {
  %0 = vector.shape_cast %arg0 : vector<2x1xf32> to vector<1x2xf32>
  %1 = vector.broadcast %0 : vector<1x2xf32> to vector<2x2xf32>
  return %1 : vector<2x2xf32>
}
