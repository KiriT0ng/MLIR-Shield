func.func @invalid_constant_FPtoSI() -> i8 {
  %c0 = arith.constant 2.0e10 : f32
  %res = arith.fptosi %c0 : f32 to i8
  return %res : i8
}
