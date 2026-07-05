func.func @shape_cast_splat_constant() -> (vector<20x2xf32>, vector<3x4x2xi32>) {
  %cst = arith.constant dense<2.000000e+00> : vector<5x4x2xf32>
  %cst_1 = arith.constant dense<1> : vector<12x2xi32>
  %0 = vector.shape_cast %cst : vector<5x4x2xf32> to vector<20x2xf32>
  %1 = vector.shape_cast %cst_1 : vector<12x2xi32> to vector<3x4x2xi32>
  return %0, %1 : vector<20x2xf32>, vector<3x4x2xi32>
}
