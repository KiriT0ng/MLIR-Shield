func.func @negative_extract_insert(%a: vector<2x15xf32>, %b: vector<12x8x16xf32>)
  -> vector<16xf32> {
  %0 = vector.insert_strided_slice %a, %b {offsets = [4, 2, 0], strides = [1, 1]}
    : vector<2x15xf32> into vector<12x8x16xf32>
  %2 = vector.extract %0[4, 2] : vector<16xf32> from vector<12x8x16xf32>
  return %2 : vector<16xf32>
}
