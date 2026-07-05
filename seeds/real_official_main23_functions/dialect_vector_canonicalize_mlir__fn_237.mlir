func.func @from_elements_f64_to_i64_conversion() -> vector<6xi64> {
  %cst0 = llvm.mlir.constant(0.0 : f64) : i64
  %cst1 = llvm.mlir.constant(1.0 : f64) : i64
  %cst_neg1 = llvm.mlir.constant(-1.0 : f64) : i64
  %cst_pi = llvm.mlir.constant(3.14 : f64) : i64
  %cst_max = llvm.mlir.constant(1.7976931348623157e+308 : f64) : i64
  %cst_min = llvm.mlir.constant(-1.7976931348623157e+308 : f64) : i64
  %v = vector.from_elements %cst0, %cst1, %cst_neg1, %cst_pi, %cst_max, %cst_min : vector<6xi64>
  return %v : vector<6xi64>
}
