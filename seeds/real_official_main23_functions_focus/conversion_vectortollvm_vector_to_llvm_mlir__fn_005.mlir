func.func @broadcast_vec1d_from_f32_scalable(%arg0: f32) -> vector<[2]xf32> {
  %0 = vector.broadcast %arg0 : f32 to vector<[2]xf32>
  return %0 : vector<[2]xf32>
}
