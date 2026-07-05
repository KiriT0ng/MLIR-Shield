func.func @selectOfPoison(%cond : i1, %arg: i32) -> (i32, i32, i32, i32) {
  %poison = ub.poison : i32
  %select1 = arith.select %cond, %poison, %arg : i32
  %select2 = arith.select %cond, %arg, %poison : i32

  // Check that constant folding is applied prior to poison handling.
  %true = arith.constant true
  %false = arith.constant false
  %select3 = arith.select %true, %poison, %arg : i32
  %select4 = arith.select %false, %poison, %arg : i32
  return %select1, %select2, %select3, %select4 : i32, i32, i32, i32
}
