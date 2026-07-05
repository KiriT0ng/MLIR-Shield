func.func @fold_vector_maskedstore_expand_shape(
  %arg0 : memref<32xf32>, %arg1 : index, %arg3: vector<8xi1>, %arg4: vector<8xf32>) {
  %c0 = arith.constant 0 : index
  %0 = memref.expand_shape %arg0 [[0, 1]] output_shape [4, 8] : memref<32xf32> into memref<4x8xf32>
  vector.maskedstore %0[%arg1, %c0], %arg3, %arg4 : memref<4x8xf32>, vector<8xi1>, vector<8xf32>
  return
}
