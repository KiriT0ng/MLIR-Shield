func.func @insert_extract_strided_slice(%x: vector<8x16xf32>) -> (vector<8x16xf32>) {
  %0 = vector.extract_strided_slice %x {offsets = [0, 8], sizes = [2, 4], strides = [1, 1]}
        : vector<8x16xf32> to vector<2x4xf32>
  %1 = vector.insert_strided_slice %0, %x {offsets = [0, 8], strides = [1, 1]}
        : vector<2x4xf32> into vector<8x16xf32>
  return %1 : vector<8x16xf32>
}
