func.func @extract_strided_fold(%arg : vector<4x3xi1>) -> (vector<4x3xi1>) {
  %0 = vector.extract_strided_slice %arg
    {offsets = [0, 0], sizes = [4, 3], strides = [1, 1]}
      : vector<4x3xi1> to vector<4x3xi1>
  return %0 : vector<4x3xi1>
}
