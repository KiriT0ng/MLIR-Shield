func.func @bitcastConstantItoFP() -> f32 {
  %c0 = arith.constant 0 : i32
  %res = arith.bitcast %c0 : i32 to f32
  return %res : f32
}
