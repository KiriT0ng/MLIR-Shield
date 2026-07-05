func.func @decompose_dynamic_into_static_concat_dim(%arg0 : tensor<1x?x?xf32>,
                               %arg1: tensor<1x?x?xf32>) -> tensor<1x?x128xf32> {
  %0 = tensor.concat dim(2) %arg0, %arg1
             : (tensor<1x?x?xf32>, tensor<1x?x?xf32>) -> tensor<1x?x128xf32>
  return %0 : tensor<1x?x128xf32>
}
