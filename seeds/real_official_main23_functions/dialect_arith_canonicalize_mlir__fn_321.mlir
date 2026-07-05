func.func @xorxor1(%a : i32, %b : i32) -> i32 {
  %c = arith.xori %b, %a : i32
  %res = arith.xori %c, %b : i32
  return %res : i32
}
