func.func @contiguous_extract_strided_slices_to_extract_shorter_size_list(%arg0 : vector<8x1x2x1x1x4xi32>) -> vector<1x4xi32> {
  %1 = vector.extract_strided_slice %arg0 {offsets = [0, 0, 0, 0, 0], sizes = [1, 1, 1, 1, 1], strides = [1, 1, 1, 1, 1]} : vector<8x1x2x1x1x4xi32> to vector<1x1x1x1x1x4xi32>
  %2 = vector.shape_cast %1 : vector<1x1x1x1x1x4xi32> to vector<1x4xi32>
  return %2 : vector<1x4xi32>
}
