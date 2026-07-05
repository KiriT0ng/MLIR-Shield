func.func @fold_vector_maskedload_subview(
  %arg0 : memref<12x32xf32>, %arg1 : index, %arg2 : index, %arg3: vector<32xi1>, %arg4: vector<32xf32>) -> vector<32xf32> {
  %0 = memref.subview %arg0[%arg1, %arg2][1, 1][1, 1] : memref<12x32xf32> to memref<f32, strided<[], offset: ?>>
  %1 = vector.maskedload %0[], %arg3, %arg4 : memref<f32, strided<[], offset: ?>>, vector<32xi1>, vector<32xf32> into vector<32xf32>
  return %1 : vector<32xf32>
}
