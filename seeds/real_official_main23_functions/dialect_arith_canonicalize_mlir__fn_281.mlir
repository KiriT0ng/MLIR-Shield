func.func @constant_UItoFP() -> f32 {
  %c0 = arith.constant 2 : i32
  %res = arith.uitofp %c0 : i32 to f32
  return %res : f32
}
