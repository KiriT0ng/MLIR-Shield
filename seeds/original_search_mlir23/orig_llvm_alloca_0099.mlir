llvm.func @orig_llvm_alloca_99() -> f64 {
  %one = llvm.mlir.constant(1 : i32) : i32
  %cst = llvm.mlir.constant(1.0 : f64) : f64
  %p = llvm.alloca %one x f64 : (i32) -> !llvm.ptr
  llvm.store %cst, %p : f64, !llvm.ptr
  %v = llvm.load %p : !llvm.ptr -> f64
  llvm.return %v : f64
}
