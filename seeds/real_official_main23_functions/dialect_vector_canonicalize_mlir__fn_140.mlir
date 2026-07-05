func.func @extract_splat_constant() -> (vector<7xf32>, i32) {
  %cst = arith.constant dense<2.000000e+00> : vector<29x7xf32>
  %cst_1 = arith.constant dense<1> : vector<4x37x9xi32>
  %0 = vector.extract %cst[2] : vector<7xf32> from vector<29x7xf32>
  %1 = vector.extract %cst_1[1, 4, 5] : i32 from vector<4x37x9xi32>
  return %0, %1 : vector<7xf32>, i32
}
