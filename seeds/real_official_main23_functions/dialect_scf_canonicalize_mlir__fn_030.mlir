func.func @remove_zero_iteration_loop_vals(%arg0: index) {
  %c2 = arith.constant 2 : index
  %init = "test.init"() : () -> i32
  %0 = scf.for %i = %arg0 to %arg0 step %c2 iter_args(%arg = %init) -> (i32) {
    %1 = "test.op"(%i, %arg) : (index, i32) -> i32
    scf.yield %1 : i32
  }
  "test.consume"(%0) : (i32) -> ()
  return
}
