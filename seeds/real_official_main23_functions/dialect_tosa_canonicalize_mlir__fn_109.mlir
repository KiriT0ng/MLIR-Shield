func.func @reverse_nofold_unit_dim_unranked_result(%arg0: tensor<1x4xf32>) -> tensor<*xf32> {
  %0 = tosa.reverse %arg0 {axis = 0 : i32} : (tensor<1x4xf32>) -> tensor<*xf32>
  return %0 : tensor<*xf32>
}
