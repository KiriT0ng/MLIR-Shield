func.func @while_unused_arg1(%x : i32, %y : f64) -> i32 {
  %0 = scf.while (%arg1 = %x, %arg2 = %y) : (i32, f64) -> (i32) {
    %condition = "test.condition"(%arg1) : (i32) -> i1
    scf.condition(%condition) %arg1 : i32
  } do {
  ^bb0(%arg1: i32):
    %next = "test.use"(%arg1) : (i32) -> (i32)
    scf.yield %next, %y : i32, f64
  }
  return %0 : i32
}
