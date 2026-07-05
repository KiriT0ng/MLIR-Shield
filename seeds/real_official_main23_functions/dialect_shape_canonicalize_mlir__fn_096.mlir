func.func @fold_tensor.cast_of_const_shape_returned(%arg: i1) -> tensor<1xindex> {
  %0 = shape.const_shape [2] : tensor<1xindex>
  %1 = tensor.cast %0 : tensor<1xindex> to tensor<1xindex>
  return %1 : tensor<1xindex>
}
