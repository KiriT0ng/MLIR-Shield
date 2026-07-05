func.func @no_fold_vector_maskedstore_expand_shape_all_unit(
  %arg0 : memref<f32>, %mask: vector<1xi1>, %val: vector<1xf32>) {
  %c0 = arith.constant 0 : index
  %0 = memref.expand_shape %arg0 [] output_shape [1] : memref<f32> into memref<1xf32>
  vector.maskedstore %0[%c0], %mask, %val : memref<1xf32>, vector<1xi1>, vector<1xf32>
  return
}
