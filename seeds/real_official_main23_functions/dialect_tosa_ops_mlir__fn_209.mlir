func.func @test_dim(%arg0: tensor<1x2x3x4xi32>) -> !tosa.shape<1> {
  %0 = tosa.dim %arg0 {axis = 2 : i32} : (tensor<1x2x3x4xi32>) -> !tosa.shape<1>
  return %0 : !tosa.shape<1>
}
