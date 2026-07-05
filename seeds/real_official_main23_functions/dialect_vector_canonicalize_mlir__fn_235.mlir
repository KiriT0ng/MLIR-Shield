func.func @from_elements_float8_to_i8_conversion() -> vector<6xi8> {
  %cst0 = llvm.mlir.constant(0.0 : f8E4M3FN) : i8
  %cst1 = llvm.mlir.constant(1.0 : f8E4M3FN) : i8
  %cst_neg1 = llvm.mlir.constant(-1.0 : f8E4M3FN) : i8
  %cst_pi = llvm.mlir.constant(3.14 : f8E4M3FN) : i8
  %cst_inf = llvm.mlir.constant(0x7F : f8E4M3FN) : i8
  %cst_neg_inf = llvm.mlir.constant(0xFF : f8E4M3FN) : i8
  %v = vector.from_elements %cst0, %cst1, %cst_neg1, %cst_pi, %cst_inf, %cst_neg_inf : vector<6xi8>
  return %v : vector<6xi8>
}
