func.func @convertf_vector(%arg0 : vector<2xf16>) -> vector<2xbf16> {
  %0 = arith.convertf %arg0 : vector<2xf16> to vector<2xbf16>
  return %0 : vector<2xbf16>
}
