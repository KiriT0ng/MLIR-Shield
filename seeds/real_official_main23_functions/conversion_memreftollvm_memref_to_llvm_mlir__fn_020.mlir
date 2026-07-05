llvm.func @generic_atomic_rmw() {
  %I = "test.foo"() : () -> (memref<10xi32>)
  %i = "test.foo"() : () -> (index)
  %x = memref.generic_atomic_rmw %I[%i] : memref<10xi32> {
    ^bb0(%old_value : i32):
      memref.atomic_yield %old_value : i32
  }
  llvm.return
}
