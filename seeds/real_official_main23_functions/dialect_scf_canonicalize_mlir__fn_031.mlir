func.func @replace_single_iteration_loop_1() {
  %c42 = arith.constant 42 : index
  %c43 = arith.constant 43 : index
  %c1 = arith.constant 1 : index
  %init = "test.init"() : () -> i32
  %0 = scf.for %i = %c42 to %c43 step %c1 iter_args(%arg = %init) -> (i32) {
    %1 = "test.op"(%i, %arg) : (index, i32) -> i32
    scf.yield %1 : i32
  }
  "test.consume"(%0) : (i32) -> ()
  return
}
