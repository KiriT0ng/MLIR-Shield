func.func @transpose_splatlike_constant() -> vector<8x4xf32> {
  %cst = arith.constant dense<5.0> : vector<4x8xf32>
  %0 = vector.transpose %cst, [1, 0] : vector<4x8xf32> to vector<8x4xf32>
  return %0 : vector<8x4xf32>
}
