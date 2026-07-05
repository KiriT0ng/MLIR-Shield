func.func @test_abs_1d_cast_static_to_dynamic(%arg0: tensor<5xf32>) -> tensor<?xf32> {
  %0 = "tosa.abs"(%arg0) : (tensor<5xf32>) -> tensor<?xf32>

  return %0 : tensor<?xf32>
}
