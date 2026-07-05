func.func @iter_args_cycles_non_cycle_start(%lb : index, %ub : index, %step : index, %a : i32, %b : i32) -> (i32, i32, i32) {
  %res:3 = scf.for %i = %lb to %ub step %step iter_args(%0 = %a, %1 = %b, %2 = %b) -> (i32, i32, i32) {
    func.call @side_effect(%0) : (i32) -> ()
    scf.yield %1, %2, %1 : i32, i32, i32
  }
  return %res#0, %res#1, %res#2 : i32, i32, i32
}
