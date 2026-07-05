func.func @fold_expand_shape_from_elements(%arg0: i32) -> tensor<1xi32> {
  %0 = tensor.from_elements %arg0 : tensor<i32>
  %1 = tensor.expand_shape %0 [] output_shape [1] : tensor<i32> into tensor<1xi32>
  return %1 : tensor<1xi32>
}
