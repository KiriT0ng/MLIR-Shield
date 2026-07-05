func.func @test_nested_fold_too_many_operands(%arg0: tensor<1x1x7x7xf32>) -> tensor<1x65x7x7xf32> {
    %0 = tosa.concat %arg0, %arg0, %arg0, %arg0, %arg0, %arg0, %arg0, %arg0 {axis = 1 : i32} : (tensor<1x1x7x7xf32>, tensor<1x1x7x7xf32>, tensor<1x1x7x7xf32>, tensor<1x1x7x7xf32>, tensor<1x1x7x7xf32>, tensor<1x1x7x7xf32>, tensor<1x1x7x7xf32>, tensor<1x1x7x7xf32>) -> tensor<1x8x7x7xf32>
    %1 = tosa.concat %0, %0, %0, %0, %0, %0, %0, %0, %arg0 {axis = 1 : i32} : (tensor<1x8x7x7xf32>, tensor<1x8x7x7xf32>, tensor<1x8x7x7xf32>, tensor<1x8x7x7xf32>, tensor<1x8x7x7xf32>, tensor<1x8x7x7xf32>, tensor<1x8x7x7xf32>, tensor<1x8x7x7xf32>, tensor<1x1x7x7xf32>) -> tensor<1x65x7x7xf32>
    return %1 : tensor<1x65x7x7xf32>
  }
