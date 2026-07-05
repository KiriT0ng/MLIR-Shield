func.func @decompose_dynamic_concat(%arg0 : tensor<8x4xf32>, %arg1 : tensor<?x?xf32>) -> tensor<?x?xf32> {
  %0 = tensor.concat dim(1) %arg0, %arg1 : (tensor<8x4xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
  return %0 : tensor<?x?xf32>
}


func.func @decompose_1d_concat(%arg0 : tensor<1xf32>,
                            %arg1 : tensor<2xf32>,
                            %arg2 : tensor<3xf32>,
                            %arg3: tensor<4xf32>) -> tensor<10xf32> {
  %0 = tensor.concat dim(0) %arg0, %arg1, %arg2, %arg3
             : (tensor<1xf32>, tensor<2xf32>, tensor<3xf32>, tensor<4xf32>) -> tensor<10xf32>
  return %0 : tensor<10xf32>
}

func.func @decompose_static_concat_dim(%arg0 : tensor<1x?x64xf32>,
                               %arg1: tensor<1x?x64xf32>) -> tensor<1x?x128xf32> {
  %0 = tensor.concat dim(2) %arg0, %arg1
             : (tensor<1x?x64xf32>, tensor<1x?x64xf32>) -> tensor<1x?x128xf32>
  return %0 : tensor<1x?x128xf32>
}


func.func @decompose_dynamic_into_static_concat_dim(%arg0 : tensor<1x?x?xf32>,
                               %arg1: tensor<1x?x?xf32>) -> tensor<1x?x128xf32> {
  %0 = tensor.concat dim(2) %arg0, %arg1
             : (tensor<1x?x?xf32>, tensor<1x?x?xf32>) -> tensor<1x?x128xf32>
  return %0 : tensor<1x?x128xf32>
}

module attributes {transform.with_named_sequence} {
  transform.named_sequence @__transform_main(%root: !transform.any_op {transform.readonly}) {
    %func_op = transform.structured.match ops{["func.func"]} in %root : (!transform.any_op) -> !transform.op<"func.func">
    transform.apply_patterns to %func_op {
      transform.apply_patterns.tensor.decompose_concat
    } : !transform.op<"func.func">
    transform.yield
  }
}
