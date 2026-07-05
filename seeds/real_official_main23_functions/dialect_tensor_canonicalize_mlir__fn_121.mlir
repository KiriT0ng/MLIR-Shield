func.func @fold_collapse_shape_from_elements(%arg0: i32) -> tensor<i32> {
  %0 = tensor.from_elements %arg0 : tensor<1xi32>
  %1 = tensor.collapse_shape %0 [] : tensor<1xi32> into tensor<i32>
  return %1 : tensor<i32>
}
