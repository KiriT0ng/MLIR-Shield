func.func @fold_vector_store_collapse_shape(
  %arg0 : memref<4x8xf32>, %arg1 : index, %val : vector<8xf32>) {
  %0 = memref.collapse_shape %arg0 [[0, 1]] : memref<4x8xf32> into memref<32xf32>
  vector.store %val, %0[%arg1] {nontemporal = true} : memref<32xf32>, vector<8xf32>
  return
}
