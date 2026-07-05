func.func @expand_shape_splat_constant_dynamic_result(%n: index) -> tensor<?xi32> {
  %cst = arith.constant dense<1> : tensor<i32>
  %result = tensor.expand_shape %cst [] output_shape [%n] : tensor<i32> into tensor<?xi32>
  return %result : tensor<?xi32>
}
