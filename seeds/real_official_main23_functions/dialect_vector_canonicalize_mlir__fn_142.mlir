func.func @extract_2d_constant() -> (i32, i32, i32, i32) {
  %cst = arith.constant dense<[[0, 1, 2], [3, 4, 5]]> : vector<2x3xi32>
  %a = vector.extract %cst[0, 0] : i32 from vector<2x3xi32>
  %b = vector.extract %cst[0, 2] : i32 from vector<2x3xi32>
  %c = vector.extract %cst[1, 0] : i32 from vector<2x3xi32>
  %d = vector.extract %cst[1, 2] : i32 from vector<2x3xi32>
  return %a, %b, %c, %d : i32, i32, i32, i32
}
