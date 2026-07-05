func.func @test_fold_i32_to_i1_cast() -> tensor<i1> {
  %0 = "tosa.const"() <{values = dense<10> : tensor<i32>}> : () -> tensor<i32>
  %1 = "tosa.cast"(%0) : (tensor<i32>) -> tensor<i1>
  return %1 : tensor<i1>
}
