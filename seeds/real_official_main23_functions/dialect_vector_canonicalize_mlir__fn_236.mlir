func.func @from_elements_float16_to_i16_conversion() -> vector<6xi16> {
  %cst0 = llvm.mlir.constant(0.0 : f16) : i16
  %cst1 = llvm.mlir.constant(1.0 : f16) : i16
  %cst_neg1 = llvm.mlir.constant(-1.0 : f16) : i16
  %cst_pi = llvm.mlir.constant(3.14 : f16) : i16
  %cst_max = llvm.mlir.constant(65504.0	: f16) : i16
  %cst_min = llvm.mlir.constant(-65504.0 : f16) : i16
  %v = vector.from_elements %cst0, %cst1, %cst_neg1, %cst_pi, %cst_max, %cst_min : vector<6xi16>
  return %v : vector<6xi16>
}
