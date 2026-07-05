func.func @replace_single_iteration_loop_non_unit_step() {
  %c42 = arith.constant 42 : index
  %c47 = arith.constant 47 : index
  %c5 = arith.constant 5 : index
  %init = "test.init"() : () -> i32
  %0 = scf.for %i = %c42 to %c47 step %c5 iter_args(%arg = %init) -> (i32) {
    %1 = "test.op"(%i, %arg) : (index, i32) -> i32
    scf.yield %1 : i32
  }
  "test.consume"(%0) : (i32) -> ()
  return
}
