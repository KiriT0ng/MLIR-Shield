func.func @f() {
  %0 = shape.const_witness true
  %1 = "test.source"() : () -> !shape.witness
  %2 = "test.source"() : () -> !shape.witness
  %3 = shape.assuming_all %0, %1, %2
  "consume.witness"(%3) : (!shape.witness) -> ()
  return
}
