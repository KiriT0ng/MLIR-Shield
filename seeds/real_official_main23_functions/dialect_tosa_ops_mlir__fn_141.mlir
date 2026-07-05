func.func @test_custom(%arg0: tensor<10xi32>) -> tensor<10xi32> {
  %0 = tosa.custom %arg0 {operator_name="custom_test", domain_name="tosa.mlir_test", implementation_attrs="" } : (tensor<10xi32>) -> (tensor<10xi32>)
  return %0 : tensor<10xi32>
}
