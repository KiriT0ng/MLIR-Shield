func.func @negative_from_elements_to_constant() -> vector<1x!llvm.ptr> {
  %a = llvm.mlir.addressof @my_symbol : !llvm.ptr
  %b = vector.from_elements %a : vector<1x!llvm.ptr>
  return %b : vector<1x!llvm.ptr>
}
