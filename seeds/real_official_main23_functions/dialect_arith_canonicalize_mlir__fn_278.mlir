func.func @constant_SItoFP() -> f32 {
  %c0 = arith.constant -2 : i32
  %res = arith.sitofp %c0 : i32 to f32
  return %res : f32
}
