func.func @extract_vector_2d_constant() -> (vector<3xi32>, vector<3xi32>) {
  %cst = arith.constant dense<[[0, 1, 2], [3, 4, 5]]> : vector<2x3xi32>
  %a = vector.extract %cst[0] : vector<3xi32> from vector<2x3xi32>
  %b = vector.extract %cst[1] : vector<3xi32> from vector<2x3xi32>
  return %a, %b : vector<3xi32>, vector<3xi32>
}
