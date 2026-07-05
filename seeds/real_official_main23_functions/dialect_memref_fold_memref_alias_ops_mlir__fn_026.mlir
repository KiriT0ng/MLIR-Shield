func.func @fold_vector_store_expand_shape_leading_unit(
  %arg0 : memref<32xf32>, %arg1 : index, %val : vector<1x8xf32>) {
  %c0 = arith.constant 0 : index
  %0 = memref.expand_shape %arg0 [[0, 1]] output_shape [4, 8] : memref<32xf32> into memref<4x8xf32>
  vector.store %val, %0[%arg1, %c0] : memref<4x8xf32>, vector<1x8xf32>
  return
}
