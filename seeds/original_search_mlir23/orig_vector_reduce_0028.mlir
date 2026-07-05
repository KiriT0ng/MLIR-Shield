func.func @orig_vector_reduce_28(%arg0: vector<2x4xf32>, %acc: vector<2xf32>) -> vector<2xf32> {
  %0 = vector.multi_reduction <add>, %arg0, %acc [1] : vector<2x4xf32> to vector<2xf32>
  return %0 : vector<2xf32>
}
