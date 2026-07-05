func.func @fold_vector_load_expand_shape_all_unit(
  %arg0 : memref<f32>) -> vector<1xf32> {
  %c0 = arith.constant 0 : index
  %0 = memref.expand_shape %arg0 [] output_shape [1] : memref<f32> into memref<1xf32>
  %1 = vector.load %0[%c0] : memref<1xf32>, vector<1xf32>
  return %1 : vector<1xf32>
}
