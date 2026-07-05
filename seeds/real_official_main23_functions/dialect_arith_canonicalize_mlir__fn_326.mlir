func.func @andand2(%a : i32, %b : i32) -> i32 {
  %c = arith.andi %a, %b : i32
  %res = arith.andi %b, %c : i32
  return %res : i32
}
