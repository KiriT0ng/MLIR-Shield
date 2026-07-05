func.func @scopeMerge4() {
  %cnt = "test.count"() : () -> index
  "test.region"() ({
    memref.alloca_scope {
      %a = memref.alloca(%cnt) : memref<?xi64>
      "test.use"(%a) : (memref<?xi64>) -> ()
    }
    "test.op"() : () -> ()
    "test.terminator"() : () -> ()
  }) : () -> ()
  return
}
