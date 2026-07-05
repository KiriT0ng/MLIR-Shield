func.func @broadcast_vec2d_from_index_vec1d_scalable(%arg0: vector<[2]xindex>) -> vector<3x[2]xindex> {
  %0 = vector.broadcast %arg0 : vector<[2]xindex> to vector<3x[2]xindex>
  return %0 : vector<3x[2]xindex>
}
