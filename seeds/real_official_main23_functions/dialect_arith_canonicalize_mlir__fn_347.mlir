func.func @extsi_poison() -> i64 {
  %0 = ub.poison : i32
  %1 = arith.extsi %0 : i32 to i64
  return %1 : i64
}
