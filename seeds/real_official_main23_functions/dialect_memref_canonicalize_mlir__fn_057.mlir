func.func @scopeMerge5() {
  "test.region"() ({
    memref.alloca_scope {
      affine.parallel (%arg) = (0) to (64) {
        %a = memref.alloca(%arg) : memref<?xi64>
        "test.use"(%a) : (memref<?xi64>) -> ()
      }
    }
    "test.op"() : () -> ()
    "test.terminator"() : () -> ()
  }) : () -> ()
  return
}
