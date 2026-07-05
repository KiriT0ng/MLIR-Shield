func.func @fold_away_iter_with_no_use_and_yielded_input(%arg0 : i32,
                    %ub : index, %lb : index, %step : index) -> (i32, i32) {
  %cst = arith.constant 32 : i32
  %0:2 = scf.for %arg1 = %lb to %ub step %step iter_args(%arg2 = %arg0, %arg3 = %cst)
    -> (i32, i32) {
    %1 = arith.addi %arg2, %cst : i32
    scf.yield %1, %cst : i32, i32
  }

  return %0#0, %0#1 : i32, i32
}
