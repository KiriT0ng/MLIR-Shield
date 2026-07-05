func.func @transpose_poison() -> vector<4x6xi8> {
  %poison = ub.poison : vector<6x4xi8>
  %transpose = vector.transpose %poison, [1, 0] : vector<6x4xi8> to vector<4x6xi8>
  return %transpose : vector<4x6xi8>
}
