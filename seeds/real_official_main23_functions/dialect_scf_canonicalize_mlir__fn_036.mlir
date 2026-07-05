func.func @remove_empty_parallel_loop(%lb: index, %ub: index, %s: index) {
  %init = "test.init"() : () -> f32
  %0 = scf.parallel (%i, %j, %k) = (%lb, %ub, %lb) to (%ub, %ub, %ub) step (%s, %s, %s) init(%init) -> f32 {
    %1 = "test.produce"() : () -> f32
    scf.reduce(%1 : f32) {
    ^bb0(%lhs: f32, %rhs: f32):
      %2 = "test.transform"(%lhs, %rhs) : (f32, f32) -> f32
      scf.reduce.return %2 : f32
    }
  }
  "test.consume"(%0) : (f32) -> ()
  return
}
