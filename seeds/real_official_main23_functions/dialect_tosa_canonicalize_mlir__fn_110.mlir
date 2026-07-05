func.func @reverse_nofold_splat_type_unmatch() -> tensor<*xf32> {
  %0 = "tosa.const"() <{values = dense<1.0> : tensor<4xf32>}> : () -> tensor<4xf32>
  %1 = tosa.reverse %0 {axis = 0 : i32} : (tensor<4xf32>) -> tensor<*xf32>
  return %1 : tensor<*xf32>
}
