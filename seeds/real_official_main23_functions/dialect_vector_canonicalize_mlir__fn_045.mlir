func.func @extract_strided_fold_insert(%a: vector<6x4xf32>, %b: vector<8x16xf32>)
  -> (vector<4x4xf32>) {
  %0 = vector.insert_strided_slice %a, %b {offsets = [2, 2], strides = [1, 1]}
    : vector<6x4xf32> into vector<8x16xf32>
  %1 = vector.extract_strided_slice %0
    {offsets = [2, 2], sizes = [4, 4], strides = [1, 1]}
      : vector<8x16xf32> to vector<4x4xf32>
  return %1 : vector<4x4xf32>
}
