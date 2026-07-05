func.func @select_cst_true_scalar(%arg0: i32, %arg1: i32) -> i32 {
  %true = arith.constant true
  %res = arith.select %true, %arg0, %arg1 : i32
  return %res : i32
}
