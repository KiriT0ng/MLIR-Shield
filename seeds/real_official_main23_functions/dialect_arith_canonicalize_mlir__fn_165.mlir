func.func @adduiExtendedUnusedOverflowScalar(%arg0: i32, %arg1: i32) -> i32 {
  %sum, %overflow = arith.addui_extended %arg0, %arg1: i32, i1
  return %sum : i32
}
