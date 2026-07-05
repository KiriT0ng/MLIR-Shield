func.func @shape_cast_dense_int_constant() -> vector<2x3xi8> {
  %cst = arith.constant dense<[2, 3, 5, 7, 11, 13]> : vector<6xi8>
  %0 = vector.shape_cast %cst : vector<6xi8> to vector<2x3xi8>
  return %0 : vector<2x3xi8>
}
