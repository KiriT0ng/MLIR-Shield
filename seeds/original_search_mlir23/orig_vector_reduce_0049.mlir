func.func @orig_vector_reduce_49(%arg0: vector<3x4xf32>, %acc: vector<3xf32>) -> vector<3xf32> {
  %0 = vector.multi_reduction <mul>, %arg0, %acc [1] : vector<3x4xf32> to vector<3xf32>
  return %0 : vector<3xf32>
}
