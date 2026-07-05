func.func @truncFPVectorConstant() -> vector<2xbf16> {
  %cst = arith.constant dense<[0.000000e+00, 1.000000e+00]> : vector<2xf32>
  %0 = arith.truncf %cst : vector<2xf32> to vector<2xbf16>
  return %0 : vector<2xbf16>
}
