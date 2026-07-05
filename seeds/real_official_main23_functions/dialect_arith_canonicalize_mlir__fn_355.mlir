func.func @bf16_branch_vector(%arg0: vector<32x32x32xbf16>) -> vector<32x32x32xbf16> {
  %0 = arith.extf %arg0 fastmath<contract> : vector<32x32x32xbf16> to vector<32x32x32xf32>
  %1 = math.absf %0 : vector<32x32x32xf32>
  %2 = arith.truncf %1 fastmath<contract> : vector<32x32x32xf32> to vector<32x32x32xbf16>
  %3 = arith.extf %2 fastmath<contract> : vector<32x32x32xbf16> to vector<32x32x32xf32>
  %4 = math.sin %3 : vector<32x32x32xf32>
  %5 = arith.truncf %4 fastmath<contract> : vector<32x32x32xf32> to vector<32x32x32xbf16>
  %6 = arith.extf %5 fastmath<contract> : vector<32x32x32xbf16> to vector<32x32x32xf32>
  %7 = math.cos %3 : vector<32x32x32xf32>
  %8 = arith.truncf %7 fastmath<contract> : vector<32x32x32xf32> to vector<32x32x32xbf16>
  %9 = arith.extf %8 fastmath<contract> : vector<32x32x32xbf16> to vector<32x32x32xf32>
  %10 = arith.addf %6, %9 : vector<32x32x32xf32>
  %11 = arith.truncf %10 fastmath<contract> : vector<32x32x32xf32> to vector<32x32x32xbf16>
  return %11 : vector<32x32x32xbf16>
}
