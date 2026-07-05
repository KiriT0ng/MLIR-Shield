func.func @extract_strided_splatlike(%arg0: f16) -> vector<2x4xf16> {
 %0 = vector.broadcast %arg0 : f16 to vector<16x4xf16>
 %1 = vector.extract_strided_slice %0
  {offsets = [1, 0], sizes = [2, 4], strides = [1, 1]} :
  vector<16x4xf16> to vector<2x4xf16>
  return %1 : vector<2x4xf16>
}
