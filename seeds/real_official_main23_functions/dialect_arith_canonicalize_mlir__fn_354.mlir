func.func @f16_sin_vector(%arg0: vector<32x32x32xf16>) -> vector<32x32x32xf16> {
  %0 = arith.extf %arg0 fastmath<contract> : vector<32x32x32xf16> to vector<32x32x32xf32>
  %1 = math.absf %0 : vector<32x32x32xf32>
  %2 = arith.truncf %1 fastmath<contract> : vector<32x32x32xf32> to vector<32x32x32xf16>
  %3 = arith.extf %2 fastmath<contract> : vector<32x32x32xf16> to vector<32x32x32xf32>
  %4 = math.sin %3 : vector<32x32x32xf32>
  %5 = arith.truncf %4 fastmath<contract> : vector<32x32x32xf32> to vector<32x32x32xf16>
  return %5 : vector<32x32x32xf16>
}
