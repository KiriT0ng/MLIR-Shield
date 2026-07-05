func.func @test_align_args() -> (i64, f32, i32) {
  %0 = "test.test"() : () -> (f32)
  %1 = "test.test"() : () -> (i32)
  %2 = "test.test"() : () -> (i64)
  %3:3 = scf.while (%arg0 = %0, %arg1 = %1, %arg2 = %2) : (f32, i32, i64) -> (i64, f32, i32) {
    %cond = "test.test"() : () -> (i1)
    scf.condition(%cond) %arg2, %arg0, %arg1 : i64, f32, i32
  } do {
  ^bb0(%arg3: i64, %arg4: f32, %arg5: i32):
    %4 = "test.test"(%arg3) : (i64) -> (f32)
    %5 = "test.test"(%arg4) : (f32) -> (i32)
    %6 = "test.test"(%arg5) : (i32) -> (i64)
    scf.yield %4, %5, %6 : f32, i32, i64
  }
  return %3#0, %3#1, %3#2 : i64, f32, i32
}
