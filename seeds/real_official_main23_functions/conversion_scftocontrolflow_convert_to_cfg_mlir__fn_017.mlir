func.func @while_values(%arg0: i32, %arg1: f32) {
  %0 = "test.make_condition"() : () -> i1
  %c0_i32 = arith.constant 0 : i32
  %cst = arith.constant 0.000000e+00 : f32
  %1:2 = scf.while (%arg2 = %arg0, %arg3 = %arg1) : (i32, f32) -> (i64, f64) {
    %2 = arith.extui %arg0 : i32 to i64
    %3 = arith.extf %arg3 : f32 to f64
    scf.condition(%0) %2, %3 : i64, f64
  } do {
  ^bb0(%arg2: i64, %arg3: f64):
    scf.yield %c0_i32, %cst : i32, f32
  }
  return
}
