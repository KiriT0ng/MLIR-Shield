func.func @test_fold_i1_to_i32_cast() -> tensor<i32> {
  %0 = "tosa.const"() <{values = dense<1> : tensor<i1>}> : () -> tensor<i1>
  %1 = "tosa.cast"(%0) : (tensor<i1>) -> tensor<i32>
  return %1 : tensor<i32>
}
