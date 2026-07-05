func.func @extract_strided_constant() -> (vector<12x2xf32>, vector<2x13x3xi32>) {
  %cst = arith.constant dense<2.000000e+00> : vector<29x7xf32>
  %cst_1 = arith.constant dense<1> : vector<4x37x9xi32>
  %0 = vector.extract_strided_slice %cst
    {offsets = [2, 3], sizes = [12, 2], strides = [1, 1]}
      : vector<29x7xf32> to vector<12x2xf32>
  %1 = vector.extract_strided_slice %cst_1
    {offsets = [1, 2, 5], sizes = [2, 13, 3], strides = [1, 1, 1]}
      : vector<4x37x9xi32> to vector<2x13x3xi32>
  return %0, %1 : vector<12x2xf32>, vector<2x13x3xi32>
}
