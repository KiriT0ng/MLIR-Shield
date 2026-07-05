func.func @constant_iter_arg(%arg0: index, %arg1: index, %arg2: index) {
  %c0_i32 = arith.constant 0 : i32
  %0 = scf.for %i = %arg0 to %arg1 step %arg2 iter_args(%arg3 = %c0_i32) -> i32 {
    "test.use"(%arg3) : (i32) -> ()
    scf.yield %c0_i32 : i32
  }
  return
}
