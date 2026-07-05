func.func @constant_mask_transpose_to_transposed_constant_mask() -> (vector<2x3x4xi1>, vector<4x2x3xi1>) {
  %0 = vector.constant_mask [1, 2, 3] : vector<2x3x4xi1>
  %1 = vector.transpose %0, [2, 0, 1] : vector<2x3x4xi1> to vector<4x2x3xi1>
  return %0, %1 : vector<2x3x4xi1>, vector<4x2x3xi1>
}
