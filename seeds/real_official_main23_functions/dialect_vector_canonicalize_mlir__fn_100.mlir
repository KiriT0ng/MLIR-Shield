func.func @broadcast_poison() -> vector<4x6xi8> {
  %poison = ub.poison : vector<6xi8>
  %broadcast = vector.broadcast %poison : vector<6xi8> to vector<4x6xi8>
  return %broadcast : vector<4x6xi8>
}
