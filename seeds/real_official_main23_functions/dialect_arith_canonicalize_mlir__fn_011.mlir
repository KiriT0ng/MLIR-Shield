func.func @select_cst_vector_f32() -> vector<3xf32> {
  %cond = arith.constant dense<[false, true, false]> : vector<3xi1>
  %a = arith.constant dense<[1.0, 2.0, 3.0]> : vector<3xf32>
  %b = arith.constant dense<[4.0, 5.0, 6.0]> : vector<3xf32>
  %res = arith.select %cond, %a, %b : vector<3xi1>, vector<3xf32>
  return %res : vector<3xf32>
}
