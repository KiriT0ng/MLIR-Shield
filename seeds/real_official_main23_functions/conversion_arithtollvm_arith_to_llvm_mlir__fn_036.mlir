func.func @addui_extended_scalar(%arg0: i32, %arg1: i32) -> (i32, i1) {
  %sum, %carry = arith.addui_extended %arg0, %arg1 : i32, i1
  return %sum, %carry : i32, i1
}
