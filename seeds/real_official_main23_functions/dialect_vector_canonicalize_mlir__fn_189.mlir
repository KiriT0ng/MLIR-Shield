func.func @insert_2d_splat_constant()
  -> (vector<2x3xi32>, vector<2x3xi32>, vector<2x3xi32>, vector<2x3xi32>, vector<2x3xi32>) {
  %vcst = arith.constant dense<0> : vector<2x3xi32>
  %cst_zero = arith.constant 0 : i32
  %cst_scalar = arith.constant 99 : i32
  %cst_1d = arith.constant dense<33> : vector<3xi32>
  %a = vector.insert %cst_zero, %vcst[0, 0] : i32 into vector<2x3xi32>
  %b = vector.insert %cst_scalar, %vcst[0, 0] : i32 into vector<2x3xi32>
  %c = vector.insert %cst_scalar, %vcst[1, 1] : i32 into vector<2x3xi32>
  %d = vector.insert %cst_1d, %vcst[0] : vector<3xi32> into vector<2x3xi32>
  %e = vector.insert %cst_1d, %vcst[1] : vector<3xi32> into vector<2x3xi32>
  return %a, %b, %c, %d, %e : vector<2x3xi32>, vector<2x3xi32>, vector<2x3xi32>, vector<2x3xi32>, vector<2x3xi32>
}
