func.func @from_elements_index_to_i64_conversion() -> vector<3xi64> {
  %cst0 = llvm.mlir.constant(0 : index) : i64
  %cst1 = llvm.mlir.constant(1 : index) : i64
  %cst42 = llvm.mlir.constant(42 : index) : i64
  %v = vector.from_elements %cst0, %cst1, %cst42 : vector<3xi64>
  return %v : vector<3xi64>
}
