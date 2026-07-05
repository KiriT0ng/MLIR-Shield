func.func @consecutive_shape_cast(%arg0: vector<16xf16>) -> vector<4x4xf16> {
  %0 = vector.shape_cast %arg0 : vector<16xf16> to vector<2x8xf16>
  %1 = vector.shape_cast %0 : vector<2x8xf16> to vector<4x4xf16>
  return %1 : vector<4x4xf16>
}
