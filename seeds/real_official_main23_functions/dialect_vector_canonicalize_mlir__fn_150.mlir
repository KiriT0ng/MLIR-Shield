func.func @extract_extract_strided(%arg0: vector<32x16x4xf16>) -> vector<4xf16> {
 %1 = vector.extract_strided_slice %arg0
  {offsets = [7, 3], sizes = [10, 8], strides = [1, 1]} :
  vector<32x16x4xf16> to vector<10x8x4xf16>
  %2 = vector.extract %1[2, 4] : vector<4xf16> from vector<10x8x4xf16>
  return %2 : vector<4xf16>
}
