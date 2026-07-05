func.func @scopeInline(%arg : memref<index>) {
  %cnt = "test.count"() : () -> index
  "test.region"() ({
    memref.alloca_scope {
      memref.store %cnt, %arg[] : memref<index>
    }
    "test.terminator"() : () -> ()
  }) : () -> ()
  return
}
