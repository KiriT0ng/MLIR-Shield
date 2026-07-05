func.func @integer_cast_0d_vector(%arg0 : vector<i3>) {
  %0 = arith.extsi %arg0 : vector<i3> to vector<i6>
  %1 = arith.extui %arg0 : vector<i3> to vector<i6>
  %2 = arith.trunci %arg0 : vector<i3> to vector<i2>
  return
}
