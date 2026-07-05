func.func @extract_strided_broadcast2(%arg0: vector<4xf16>) -> vector<2x2xf16> {
 %0 = vector.broadcast %arg0 : vector<4xf16> to vector<16x4xf16>
 %1 = vector.extract_strided_slice %0
  {offsets = [0, 0], sizes = [2, 2], strides = [1, 1]} :
  vector<16x4xf16> to vector<2x2xf16>
  return %1 : vector<2x2xf16>
}
