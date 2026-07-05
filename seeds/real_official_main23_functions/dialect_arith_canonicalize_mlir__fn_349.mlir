func.func @sequences_fastmath_contract(%arg0: bf16) -> bf16 {
  %0 = arith.extf %arg0 fastmath<contract> : bf16 to f32
  %1 = math.absf %0 : f32
  %2 = arith.truncf %1 fastmath<contract> : f32 to bf16
  %3 = arith.extf %2 fastmath<contract> : bf16 to f32
  %4 = math.sin %3 : f32
  %5 = arith.truncf %4 fastmath<contract> : f32 to bf16
  return %5 : bf16
}
