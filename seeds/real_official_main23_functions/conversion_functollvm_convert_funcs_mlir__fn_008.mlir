func.func @caller_private_callee(%arg1: f32) -> i32 {
  %0 = call @private_callee(%arg1) : (f32) -> i32
  return %0 : i32
}
