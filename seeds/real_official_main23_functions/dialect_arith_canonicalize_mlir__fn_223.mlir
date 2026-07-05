func.func @xorOfXorConstantMultiUse(%arg0: i32) -> (i32, i32) {
  %c12 = arith.constant 12 : i32
  %c10 = arith.constant 10 : i32
  %x1 = arith.xori %arg0, %c12 : i32
  %x2 = arith.xori %x1, %c10 : i32
  return %x1, %x2 : i32, i32
}
