func.func @broadcast_splat_constant() -> vector<4x6xi8> {
  %cst = arith.constant dense<1> : vector<6xi8>
  %broadcast = vector.broadcast %cst : vector<6xi8> to vector<4x6xi8>
  return %broadcast : vector<4x6xi8>
}
