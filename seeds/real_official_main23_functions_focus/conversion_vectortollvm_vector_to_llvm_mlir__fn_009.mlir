func.func @broadcast_vec2d_from_scalar_scalable(%arg0: f32) -> vector<2x[3]xf32> {
  %0 = vector.broadcast %arg0 : f32 to vector<2x[3]xf32>
  return %0 : vector<2x[3]xf32>
}
