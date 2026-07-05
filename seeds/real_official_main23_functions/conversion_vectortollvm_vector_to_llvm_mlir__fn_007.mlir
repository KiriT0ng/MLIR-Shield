func.func @broadcast_vec1d_from_index_scalable(%arg0: index) -> vector<[2]xindex> {
  %0 = vector.broadcast %arg0 : index to vector<[2]xindex>
  return %0 : vector<[2]xindex>
}
