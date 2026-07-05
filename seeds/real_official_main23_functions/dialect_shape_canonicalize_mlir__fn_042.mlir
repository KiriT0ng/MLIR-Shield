func.func @f() {
  %0 = "test.source"() : () -> !shape.witness
  %1 = "test.source"() : () -> !shape.witness
  %2 = "test.source"() : () -> !shape.witness
  %3 = shape.assuming_all %0, %1
  %4 = shape.assuming_all %3, %2
  "consume.witness"(%4) : (!shape.witness) -> ()
  return
}
