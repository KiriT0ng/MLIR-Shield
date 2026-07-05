func.func @iter_args_cycles(%lb : index, %ub : index, %step : index, %a : i32, %b : i64, %c : f32) -> (i32, i64, i32, i64, i64, f32) {
  %res:6 = scf.for %i = %lb to %ub step %step iter_args(%0 = %a, %1 = %b, %2 = %a, %3 = %b, %4 = %b, %5 = %c) -> (i32, i64, i32, i64, i64, f32) {
    func.call @side_effect() : () -> ()
    scf.yield %2, %4, %0, %1, %3, %5 : i32, i64, i32, i64, i64, f32
  }
  return %res#0, %res#1, %res#2, %res#3, %res#4, %res#5 : i32, i64, i32, i64, i64, f32
}
