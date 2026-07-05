llvm.func @generic_atomic_rmw_f16() {
  %I = "test.foo"() : () -> (memref<10xf16>)
  %i = "test.foo"() : () -> (index)
  %x = memref.generic_atomic_rmw %I[%i] : memref<10xf16> {
    ^bb0(%old_value : f16):
      memref.atomic_yield %old_value : f16
  }
  llvm.return
}
