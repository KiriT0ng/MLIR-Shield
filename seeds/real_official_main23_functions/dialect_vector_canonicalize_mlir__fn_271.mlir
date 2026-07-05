func.func @extract_strided_slice_outer_shorter(%arg0: vector<4x8x16xf32>) -> vector<2x4x16xf32> {
  %0 = vector.extract_strided_slice %arg0 {offsets = [1, 2], sizes = [3, 4], strides = [1, 1]} : vector<4x8x16xf32> to vector<3x4x16xf32>
  %1 = vector.extract_strided_slice %0 {offsets = [0], sizes = [2], strides = [1]} : vector<3x4x16xf32> to vector<2x4x16xf32>
  return %1 : vector<2x4x16xf32>
}
