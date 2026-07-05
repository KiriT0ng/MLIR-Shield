func.func @addi_poison1(%arg: i32) -> i32 {
  %0 = ub.poison : i32
  %1 = arith.addi %0, %arg : i32
  return %1 : i32
}
