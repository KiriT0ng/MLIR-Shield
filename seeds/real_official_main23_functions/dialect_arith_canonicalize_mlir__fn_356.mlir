func.func @bf16_fma(%arg0: vector<32x32x32xbf16>, %arg1: vector<32x32x32xbf16>, %arg2: vector<32x32x32xbf16>) -> vector<32x32x32xbf16> {
  %0 = arith.extf %arg0 fastmath<contract> : vector<32x32x32xbf16> to vector<32x32x32xf32>
  %1 = math.absf %0 : vector<32x32x32xf32>
  %2 = arith.truncf %1 fastmath<contract> : vector<32x32x32xf32> to vector<32x32x32xbf16>
  %3 = arith.extf %2 fastmath<contract> : vector<32x32x32xbf16> to vector<32x32x32xf32>
  %4 = math.sin %3 : vector<32x32x32xf32>
  %5 = arith.truncf %4 fastmath<contract> : vector<32x32x32xf32> to vector<32x32x32xbf16>
  %6 = arith.extf %5 fastmath<contract> : vector<32x32x32xbf16> to vector<32x32x32xf32>
  %7 = math.fma %5, %arg1, %arg2 : vector<32x32x32xbf16>
  %8 = arith.extf %7 fastmath<contract> : vector<32x32x32xbf16> to vector<32x32x32xf32>
  %9 = arith.addf %8, %6 : vector<32x32x32xf32>
  %10 = arith.truncf %9 fastmath<contract> : vector<32x32x32xf32> to vector<32x32x32xbf16>
  return %10 : vector<32x32x32xbf16>
}
