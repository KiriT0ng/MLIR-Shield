func.func @extract_splat_vector_3d_constant() -> (vector<2xi32>, vector<2xi32>, vector<2xi32>) {
  %cst = arith.constant dense<[[[0, 0], [1, 1], [2, 2]], [[3, 3], [4, 4], [5, 5]]]> : vector<2x3x2xi32>
  %a = vector.extract %cst[0, 0] : vector<2xi32> from vector<2x3x2xi32>
  %b = vector.extract %cst[1, 1] : vector<2xi32> from vector<2x3x2xi32>
  %c = vector.extract %cst[1, 2] : vector<2xi32> from vector<2x3x2xi32>
  return %a, %b, %c : vector<2xi32>, vector<2xi32>, vector<2xi32>
}
