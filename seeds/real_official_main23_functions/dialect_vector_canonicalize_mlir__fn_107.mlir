func.func @shape_cast_dense_float_constant() -> (vector<2xf32>, vector<1x2xf32>){
  %cst = arith.constant dense<[[1.0, 2.0]]> : vector<1x2xf32>
  %0 = vector.shape_cast %cst : vector<1x2xf32> to vector<2xf32>
  return %0, %cst : vector<2xf32>, vector<1x2xf32>
}
