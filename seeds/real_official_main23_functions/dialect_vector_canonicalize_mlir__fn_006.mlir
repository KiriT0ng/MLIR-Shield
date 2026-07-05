func.func @create_mask_transpose_to_transposed_create_mask(
  %dim0: index, %dim1: index, %dim2: index) -> (vector<2x3x4xi1>, vector<4x2x3xi1>) {
  %0 = vector.create_mask %dim0, %dim1, %dim2 : vector<2x3x4xi1>
  %1 = vector.transpose %0, [2, 0, 1] : vector<2x3x4xi1> to vector<4x2x3xi1>
  return %0, %1 : vector<2x3x4xi1>, vector<4x2x3xi1>
}
