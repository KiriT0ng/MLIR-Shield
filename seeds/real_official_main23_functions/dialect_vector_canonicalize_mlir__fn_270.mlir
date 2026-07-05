func.func @extract_strided_slice_inner_shorter(%arg0: vector<4x8x16xf32>) -> vector<2x2x4xf32> {
  %0 = vector.extract_strided_slice %arg0 {offsets = [1], sizes = [3], strides = [1]} : vector<4x8x16xf32> to vector<3x8x16xf32>
  %1 = vector.extract_strided_slice %0 {offsets = [0, 1, 2], sizes = [2, 2, 4], strides = [1, 1, 1]} : vector<3x8x16xf32> to vector<2x2x4xf32>
  return %1 : vector<2x2x4xf32>
}
