func.func @call_llvm_func() {
  llvm.call @llvm_func() : () -> ()
  return
}
