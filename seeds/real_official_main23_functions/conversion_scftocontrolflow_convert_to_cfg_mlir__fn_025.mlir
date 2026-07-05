func.func @simple_while_loops_annotation(%arg0 : i1) {
  scf.while : () -> () {
    scf.condition(%arg0)
  } do {
    scf.yield
  } attributes {llvm.loop_annotation = #no_unroll}
  return
}
