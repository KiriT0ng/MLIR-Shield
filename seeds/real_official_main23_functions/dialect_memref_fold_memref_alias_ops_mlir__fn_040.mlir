func.func @fold_vector_maskedload_collapse_shape(
  %arg0 : memref<4x8xf32>, %arg1 : index, %arg3: vector<8xi1>, %arg4: vector<8xf32>) -> vector<8xf32> {
  %0 = memref.collapse_shape %arg0 [[0, 1]] : memref<4x8xf32> into memref<32xf32>
  %1 = vector.maskedload %0[%arg1], %arg3, %arg4 : memref<32xf32>, vector<8xi1>, vector<8xf32> into vector<8xf32>
  return %1 : vector<8xf32>
}
