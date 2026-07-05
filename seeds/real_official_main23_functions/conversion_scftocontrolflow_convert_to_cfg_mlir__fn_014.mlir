func.func @unknown_op_inside_loop(%arg0: index, %arg1: index, %arg2: index) {
  scf.for %i = %arg0 to %arg1 step %arg2 {
    "unknown.op"() : () -> ()
    scf.yield
  }
  return
}
