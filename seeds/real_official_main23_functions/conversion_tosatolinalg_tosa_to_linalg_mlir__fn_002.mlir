func.func @test_abs_1d_cast_dynamic_to_static(%arg0: tensor<?xf32>) -> tensor<5xf32> {
  %0 = "tosa.abs"(%arg0) : (tensor<?xf32>) -> tensor<5xf32>

  return %0 : tensor<5xf32>
}
