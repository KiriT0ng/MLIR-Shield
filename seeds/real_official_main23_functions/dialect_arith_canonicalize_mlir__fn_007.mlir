func.func @select_cst_false_scalar(%arg0: i32, %arg1: i32) -> i32 {
  %false = arith.constant false
  %res = arith.select %false, %arg0, %arg1 : i32
  return %res : i32
}
