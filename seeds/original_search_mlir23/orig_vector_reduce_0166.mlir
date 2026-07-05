func.func @orig_vector_reduce_166(%arg0: vector<4x3xf32>, %acc: vector<4xf32>) -> vector<4xf32> {
  %0 = vector.multi_reduction <minnumf>, %arg0, %acc [1] : vector<4x3xf32> to vector<4xf32>
  return %0 : vector<4xf32>
}
