func.func @insert_2d_constant() -> (vector<2x3xi32>, vector<2x3xi32>, vector<2x3xi32>, vector<2x3xi32>) {
  %vcst = arith.constant dense<[[0, 1, 2], [3, 4, 5]]> : vector<2x3xi32>
  %cst_scalar = arith.constant 99 : i32
  %cst_1d = arith.constant dense<[90, 91, 92]> : vector<3xi32>
  %a = vector.insert %cst_scalar, %vcst[0, 0] : i32 into vector<2x3xi32>
  %b = vector.insert %cst_scalar, %vcst[1, 2] : i32 into vector<2x3xi32>
  %c = vector.insert %cst_1d, %vcst[0] : vector<3xi32> into vector<2x3xi32>
  %d = vector.insert %cst_1d, %vcst[1] : vector<3xi32> into vector<2x3xi32>
  return %a, %b, %c, %d : vector<2x3xi32>, vector<2x3xi32>, vector<2x3xi32>, vector<2x3xi32>
}
