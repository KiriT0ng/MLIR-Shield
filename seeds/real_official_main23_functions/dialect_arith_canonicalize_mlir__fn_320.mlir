func.func @xorxor0(%a : i32, %b : i32) -> i32 {
  %c = arith.xori %a, %b : i32
  %res = arith.xori %c, %b : i32
  return %res : i32
}
