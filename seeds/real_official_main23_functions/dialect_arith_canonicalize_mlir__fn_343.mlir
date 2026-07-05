func.func @addi_poison2(%arg: i32) -> i32 {
  %0 = ub.poison : i32
  %1 = arith.addi %arg, %0 : i32
  return %1 : i32
}
