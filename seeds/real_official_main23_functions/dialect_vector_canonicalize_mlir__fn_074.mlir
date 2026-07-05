func.func @insert_fold_same_rank(%v: vector<2x2xf32>) -> vector<2x2xf32> {
  %cst = arith.constant dense<0.000000e+00> : vector<2x2xf32>
  %0 = vector.insert %cst, %v [] : vector<2x2xf32> into vector<2x2xf32>
  return %0 : vector<2x2xf32>
}
