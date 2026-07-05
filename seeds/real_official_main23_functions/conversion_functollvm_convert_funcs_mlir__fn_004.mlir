func.func @indirect_call(%arg0: (f32) -> i32, %arg1: f32) -> i32 {
  %0 = call_indirect %arg0(%arg1) : (f32) -> i32
  return %0 : i32
}
