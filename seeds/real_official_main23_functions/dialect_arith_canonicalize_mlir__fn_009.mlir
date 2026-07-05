func.func @select_cst_true_splat() -> vector<3xi32> {
  %cond = arith.constant dense<true> : vector<3xi1>
  %a = arith.constant dense<[1, 2, 3]> : vector<3xi32>
  %b = arith.constant dense<[4, 5, 6]> : vector<3xi32>
  %res = arith.select %cond, %a, %b : vector<3xi1>, vector<3xi32>
  return %res : vector<3xi32>
}
