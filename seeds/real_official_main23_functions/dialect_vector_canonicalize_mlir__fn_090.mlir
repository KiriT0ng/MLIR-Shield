func.func @negative_canonicalize_shapecast_broadcast_invalid_shape(%arg0 : vector<64xf32>) -> vector<2x4x16xf32> {
  %0 = vector.shape_cast %arg0 : vector<64xf32> to vector<4x16xf32>
  %1 = vector.broadcast %0 : vector<4x16xf32> to vector<2x4x16xf32>
  return %1 : vector<2x4x16xf32>
}
