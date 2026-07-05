func.func @while_cmp_rhs(%arg0 : i32) {
  %0 = scf.while () : () -> i32 {
    %val = "test.val"() : () -> i32
    %condition = arith.cmpi ne, %arg0, %val : i32
    scf.condition(%condition) %val : i32
  } do {
  ^bb0(%val2: i32):
    %condition2 = arith.cmpi ne, %arg0, %val2 : i32
    %negcondition2 = arith.cmpi eq, %arg0, %val2 : i32
    "test.use"(%condition2, %negcondition2, %val2) : (i1, i1, i32) -> ()
    scf.yield
  }
  return
}
