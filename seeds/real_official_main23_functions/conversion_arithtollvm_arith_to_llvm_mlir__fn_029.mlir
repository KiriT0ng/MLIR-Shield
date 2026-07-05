func.func @convertf_bf16_to_f16(%arg0 : bf16) -> f16 {
  %0 = arith.convertf %arg0 : bf16 to f16
  return %0 : f16
}
