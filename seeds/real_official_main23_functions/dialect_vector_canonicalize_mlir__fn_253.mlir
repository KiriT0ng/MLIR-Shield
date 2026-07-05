func.func @contiguous_extract_strided_slices_to_extract_failure_non_unit_outer_size(%arg0 : vector<8x1x2x1x1x4xi32>) -> vector<8x1x1x1x1x4xi32> {
  %1 = vector.extract_strided_slice %arg0 {offsets = [0, 0, 0, 0, 0, 0], sizes = [8, 1, 1, 1, 1, 4], strides = [1, 1, 1, 1, 1, 1]} : vector<8x1x2x1x1x4xi32> to vector<8x1x1x1x1x4xi32>
  return %1 : vector<8x1x1x1x1x4xi32>
}
