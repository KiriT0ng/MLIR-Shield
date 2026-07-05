func.func @insert_no_fold_scalar_to_0d(%v: vector<f32>) -> vector<f32> {
  %cst = arith.constant 0.000000e+00 : f32
  %0 = vector.insert %cst, %v [] : f32 into vector<f32>
  return %0 : vector<f32>
}
