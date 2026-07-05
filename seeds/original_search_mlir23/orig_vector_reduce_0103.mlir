func.func @orig_vector_reduce_103(%arg0: vector<5x2xf32>, %acc: vector<5xf32>) -> vector<5xf32> {
  %0 = vector.multi_reduction <maxnumf>, %arg0, %acc [1] : vector<5x2xf32> to vector<5xf32>
  return %0 : vector<5xf32>
}
