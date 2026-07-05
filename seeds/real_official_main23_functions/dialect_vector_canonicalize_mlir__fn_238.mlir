func.func @from_elements_i1_to_i8_conversion() -> vector<1xi8> {
  %cst = llvm.mlir.constant(0: i1) : i8
  %v = vector.from_elements %cst : vector<1xi8>
  return %v : vector<1xi8>
}
