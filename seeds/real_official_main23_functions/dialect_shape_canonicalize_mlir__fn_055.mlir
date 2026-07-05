func.func @unused_assuming_results() {
  %0 = "test.source"() : () -> (!shape.witness)
  %1:2 = shape.assuming %0 -> (f32, f32) {
    %2 = "produce.redundant"() : () -> (f32)
    %3 = "produce.meaningful"() : () -> (f32)
    shape.assuming_yield %2, %3 : f32, f32
  }
  "use"(%1#1) : (f32) -> ()
  return
}
