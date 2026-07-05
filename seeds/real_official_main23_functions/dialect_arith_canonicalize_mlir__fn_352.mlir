func.func @eliminate_cast_to_bf16(%arg0: f32) -> f32 {
  %0 = arith.truncf %arg0 fastmath<contract> : f32 to bf16
  %1 = arith.extf %0 fastmath<contract> : bf16 to f32
  return %1 : f32
}
