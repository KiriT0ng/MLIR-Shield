llvm.func @generic_atomic_rmw_in_alloca_scope() {
  %c1 = arith.constant 1 : index
  %alloc = memref.alloc() : memref<2x3xi32>
  memref.alloca_scope  {
    %0 = memref.generic_atomic_rmw %alloc[%c1, %c1] : memref<2x3xi32> {
    ^bb0(%arg0: i32):
      memref.atomic_yield %arg0 : i32
    }
  }
  llvm.return
}
