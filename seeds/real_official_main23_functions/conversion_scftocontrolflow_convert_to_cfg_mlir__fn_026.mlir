func.func @do_while_loops_annotation() {
  %c0_i32 = arith.constant 0 : i32
  scf.while (%arg2 = %c0_i32) : (i32) -> (i32) {
    %0 = "test.make_condition"() : () -> i1
    scf.condition(%0) %c0_i32 : i32
  } do {
 ^bb0(%arg2: i32):    
    scf.yield %c0_i32: i32
  } attributes {llvm.loop_annotation = #no_unroll}
  return
}
