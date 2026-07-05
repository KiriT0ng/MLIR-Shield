func.func @constant_FPtoSI() -> i32 {
  %c0 = arith.constant -2.0 : f32
  %res = arith.fptosi %c0 : f32 to i32
  return %res : i32
}
