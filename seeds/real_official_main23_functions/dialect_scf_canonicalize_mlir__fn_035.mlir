func.func @replace_single_iteration_loop_unsigned_cmp() {
  %lowerBound = arith.constant 0 : i32
  %upperBound = arith.constant -100 : i32
  %step = arith.constant 2147483647 : i32
  %init = "test.init"() : () -> i32
  %0 = scf.for unsigned %i = %lowerBound to %upperBound step %step iter_args(%arg = %init) -> (i32) : i32 {
    %1 = "test.op"(%i, %arg) : (i32, i32) -> i32
    scf.yield %1 : i32
  }
  "test.consume"(%0) : (i32) -> ()
  return
}
