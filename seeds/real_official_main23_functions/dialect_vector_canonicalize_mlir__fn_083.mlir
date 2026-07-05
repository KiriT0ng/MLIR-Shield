func.func @canonicalize_broadcast_shapecast_to_broadcast_scalar(%arg0: f32) -> vector<3x4x1xf32> {
  %0 = vector.broadcast %arg0 : f32 to vector<12xf32>
  %1 = vector.shape_cast %0 : vector<12xf32> to vector<3x4x1xf32>
  return %1 : vector<3x4x1xf32>
}
