func.func @remove_zero_iteration_loop() {
  %c42 = arith.constant 42 : index
  %c1 = arith.constant 1 : index
  %init = "test.init"() : () -> i32
  %0 = scf.for %i = %c42 to %c1 step %c1 iter_args(%arg = %init) -> (i32) {
    %1 = "test.op"(%i, %arg) : (index, i32) -> i32
    scf.yield %1 : i32
  }
  "test.consume"(%0) : (i32) -> ()
  return
}
