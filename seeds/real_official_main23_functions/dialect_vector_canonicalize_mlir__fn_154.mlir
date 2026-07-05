func.func @extract_insert_chain(%a: vector<2x16xf32>, %b: vector<12x8x16xf32>, %c: vector<2x16xf32>)
  -> vector<16xf32> {
  %0 = vector.insert_strided_slice %c, %b {offsets = [4, 2, 0], strides = [1, 1]}
    : vector<2x16xf32> into vector<12x8x16xf32>
  %1 = vector.insert_strided_slice %a, %0 {offsets = [0, 2, 0], strides = [1, 1]}
    : vector<2x16xf32> into vector<12x8x16xf32>
  %2 = vector.extract %1[4, 2] : vector<16xf32> from vector<12x8x16xf32>
  return %2 : vector<16xf32>
}
