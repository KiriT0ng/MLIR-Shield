func.func @insert_strided_slice_full_range(%source: vector<16x16xf16>, %dest: vector<16x16xf16>) -> vector<16x16xf16> {
  %0 = vector.insert_strided_slice %source, %dest {offsets = [0, 0], strides = [1, 1]} : vector<16x16xf16> into vector<16x16xf16>
  return %0: vector<16x16xf16>
}
