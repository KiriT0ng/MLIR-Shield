func.func @extract_vector_poison() -> vector<8xf32> {
  %0 = ub.poison : vector<4x8xf32>
  %1 = vector.extract %0[2] : vector<8xf32> from vector<4x8xf32>
  return %1 : vector<8xf32>
}
