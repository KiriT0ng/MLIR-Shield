func.func @insert_scalar_poison_idx_dense_dest() -> vector<2xf16> {
  %cst = arith.constant dense<0.0> : vector<2xf16>
  %idx = arith.constant -1 : index
  %val = arith.constant 2.5 : f16
  %0 = vector.insert %val, %cst [%idx] : f16 into vector<2xf16>
  return %0 : vector<2xf16>
}
