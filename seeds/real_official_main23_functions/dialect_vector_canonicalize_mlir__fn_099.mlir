func.func @bitcast_index_no_fold() -> vector<16xi64> {
  %cst = arith.constant dense<0> : vector<16xindex>
  %0 = vector.bitcast %cst : vector<16xindex> to vector<16xi64>
  return %0 : vector<16xi64>
}
