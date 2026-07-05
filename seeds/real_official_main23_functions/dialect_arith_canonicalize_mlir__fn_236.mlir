func.func @bitcastChain(%arg: i16) -> f16 {
  %0 = arith.bitcast %arg : i16 to bf16
  %1 = arith.bitcast %0 : bf16 to f16
  return %1 : f16
}
