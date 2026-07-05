func.func @broadcast_single_elem_vec1d_from_f32(%arg0: f32) -> vector<1xf32> {
  %0 = vector.broadcast %arg0 : f32 to vector<1xf32>
  return %0 : vector<1xf32>
}
