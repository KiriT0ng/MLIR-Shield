func.func @extract_vector_3d_constant() -> (vector<3x2xi32>, vector<3x2xi32>, vector<2xi32>, vector<2xi32>) {
  %cst = arith.constant dense<[[[0, 1], [2, 3], [4, 5]], [[6, 7], [8, 9], [10, 11]]]> : vector<2x3x2xi32>
  %a = vector.extract %cst[0] : vector<3x2xi32> from vector<2x3x2xi32>
  %b = vector.extract %cst[1] : vector<3x2xi32> from vector<2x3x2xi32>
  %c = vector.extract %cst[1, 1] : vector<2xi32> from vector<2x3x2xi32>
  %d = vector.extract %cst[1, 2] : vector<2xi32> from vector<2x3x2xi32>
  return %a, %b, %c, %d : vector<3x2xi32>, vector<3x2xi32>, vector<2xi32>, vector<2xi32>
}
