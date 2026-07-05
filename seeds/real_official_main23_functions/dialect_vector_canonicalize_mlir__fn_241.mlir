func.func @negative_insert_llvm_undef(%arg0: i8) -> vector<4xi8> {
  %0 = llvm.mlir.undef : vector<4xi8>
  %1 = vector.insert %arg0, %0 [0] : i8 into vector<4xi8>
  return %1 : vector<4xi8>
}
