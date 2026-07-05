func.func @constant_FPtoUI() -> i32 {
  %c0 = arith.constant 2.0 : f32
  %res = arith.fptoui %c0 : f32 to i32
  return %res : i32
}
