func.func @bitcastConstantFPtoFP() -> f16 {
  %c0 = arith.constant 0.0 : bf16
  %res = arith.bitcast %c0 : bf16 to f16
  return %res : f16
}
