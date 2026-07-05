func.func @canonicalize_broadcast_shapecast_to_shapcast(%arg0 : vector<2xf32>) -> vector<1x2x1xf32> {
  %0 = vector.broadcast %arg0 : vector<2xf32> to vector<1x2xf32>
  %1 = vector.shape_cast %0 : vector<1x2xf32> to vector<1x2x1xf32>
  return %1 : vector<1x2x1xf32>
}
