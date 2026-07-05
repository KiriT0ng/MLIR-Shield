func.func @do_while(%arg0: f32) {
  scf.while (%arg1 = %arg0) : (f32) -> (f32) {
    %0 = "test.make_condition"() : () -> i1
    scf.condition(%0) %arg1 : f32
  } do {
  ^bb0(%arg2: f32):
    scf.yield %arg2 : f32
  }
  return
}
