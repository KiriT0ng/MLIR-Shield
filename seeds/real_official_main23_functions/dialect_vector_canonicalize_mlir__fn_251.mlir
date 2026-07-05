func.func @contiguous_extract_strided_slices_to_extract_sizes_and_outer_source_dims_no_overlap(%arg0 : vector<8x2x4xi32>) -> vector<4xi32> {
  %1 = vector.extract_strided_slice %arg0 {offsets = [0, 0], sizes = [1, 1], strides = [1, 1]} : vector<8x2x4xi32> to vector<1x1x4xi32>
  %2 = vector.shape_cast %1 : vector<1x1x4xi32> to vector<4xi32>
  return %2 : vector<4xi32>
}
