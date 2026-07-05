func.func @fold_away_iter_and_result_with_no_use(%arg0 : i32,
                    %ub : index, %lb : index, %step : index) -> (i32) {
  %cst = arith.constant 32 : i32
  %0:2 = scf.for %arg1 = %lb to %ub step %step iter_args(%arg2 = %arg0, %arg3 = %cst)
    -> (i32, i32) {
    %1 = arith.addi %arg2, %cst : i32
    scf.yield %1, %1 : i32, i32
  }

  return %0#0 : i32
}
