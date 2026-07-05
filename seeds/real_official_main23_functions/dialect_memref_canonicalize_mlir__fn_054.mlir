func.func @scopeMerge2() {
  "test.region"() ({
    memref.alloca_scope {
      %cnt = "test.count"() : () -> index
      %a = memref.alloca(%cnt) : memref<?xi64>
      "test.use"(%a) : (memref<?xi64>) -> ()
    }
    "test.terminator"() : () -> ()
  }) : () -> ()
  return
}
