func.func @test_abs_scalar(%arg0: tensor<f32>) -> tensor<f32> {
  %0 = tosa.abs %arg0 : (tensor<f32>) -> tensor<f32>

	return %0 : tensor<f32>
}
