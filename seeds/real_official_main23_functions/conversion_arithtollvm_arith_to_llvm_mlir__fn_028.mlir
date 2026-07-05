func.func @convertf_f16_to_bf16(%arg0 : f16) -> bf16 {
  %0 = arith.convertf %arg0 : f16 to bf16
  return %0 : bf16
}
