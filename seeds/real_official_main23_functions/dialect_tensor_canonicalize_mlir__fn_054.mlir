func.func @fold_reshape_chain(%input: tensor<*xf32>, %shape_0: tensor<?xindex>, %shape_1: tensor<?xindex>, %shape_2: tensor<?xindex>) -> tensor<*xf32> {
  %0 = tensor.reshape %input(%shape_0) : (tensor<*xf32>, tensor<?xindex>) -> tensor<*xf32>
  %1 = tensor.reshape %0(%shape_1) : (tensor<*xf32>, tensor<?xindex>) -> tensor<*xf32>
  %2 = tensor.reshape %1(%shape_2) : (tensor<*xf32>, tensor<?xindex>) -> tensor<*xf32>
  return %2 : tensor<*xf32>
}
