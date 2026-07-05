func.func @test_add_1d_broadcast_dynamic_to_static(%arg0: tensor<5xf32>, %arg1: tensor<?xf32>) -> tensor<5xf32> {

  %0 = tosa.add %arg0, %arg1 : (tensor<5xf32>, tensor<?xf32>) -> tensor<5xf32>

  return %0 : tensor<5xf32>
}
