func.func @while_duplicated_res() -> (i32, i32) {
  %0:2 = scf.while () : () -> (i32, i32) {
    %val = "test.val"() : () -> i32
    %condition = "test.condition"() : () -> i1
    scf.condition(%condition) %val, %val : i32, i32
  } do {
  ^bb0(%val2: i32, %val3: i32):
    "test.use"(%val2, %val3) : (i32, i32) -> ()
    scf.yield
  }
  return %0#0, %0#1: i32, i32
}
