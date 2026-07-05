func.func @noninteger_operation_result(%lb: index, %ub: index, %step: index, %cond: i1) {
  %c1_i32 = arith.constant 1 : i32

  %0 = "some_fp_op"() : () -> f32
  %outs:2 = scf.for %i = %lb to %ub step %step iter_args(%a = %c1_i32, %b = %0) -> (i32, f32) {
    %1:2 = "some_op"() : () -> (i32, f32)
    scf.yield %1#0, %1#1 : i32, f32
  }

  %result = arith.select %cond, %c1_i32, %outs#0 : i32
  "use"(%result, %outs#1) : (i32, f32) -> ()
  return
}
