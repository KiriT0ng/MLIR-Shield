func.func @transpose_2D_sequence(%arg : vector<4x3xf32>) -> vector<4x3xf32> {
  %0 = vector.transpose %arg, [1, 0] : vector<4x3xf32> to vector<3x4xf32>
  %1 = vector.transpose %0, [0, 1] : vector<3x4xf32> to vector<3x4xf32>
  %2 = vector.transpose %1, [1, 0] : vector<3x4xf32> to vector<4x3xf32>
  %3 = vector.transpose %2, [0, 1] : vector<4x3xf32> to vector<4x3xf32>
  %4 = arith.addf %2, %3 : vector<4x3xf32>
  return %4 : vector<4x3xf32>
}
