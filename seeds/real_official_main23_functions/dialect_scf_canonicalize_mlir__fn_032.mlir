func.func @replace_single_iteration_loop_2() {
  %c5 = arith.constant 5 : index
  %c6 = arith.constant 6 : index
  %c11 = arith.constant 11 : index
  %init = "test.init"() : () -> i32
  %0 = scf.for %i = %c5 to %c11 step %c6 iter_args(%arg = %init) -> (i32) {
    %1 = "test.op"(%i, %arg) : (index, i32) -> i32
    scf.yield %1 : i32
  }
  "test.consume"(%0) : (i32) -> ()
  return
}
