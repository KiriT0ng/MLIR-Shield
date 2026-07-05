func.func @extract_strided_slice_partial_of_create_mask(
  %dim0: index, %dim1: index, %dim2 : index) -> (vector<2x2x8xi1>) {
  %0 = vector.create_mask %dim0, %dim1, %dim2 : vector<4x3x8xi1>
  %1 = vector.extract_strided_slice %0
    {offsets = [2, 1], sizes = [2, 2], strides = [1, 1]}
      : vector<4x3x8xi1> to vector<2x2x8xi1>
  return %1 : vector<2x2x8xi1>
}
