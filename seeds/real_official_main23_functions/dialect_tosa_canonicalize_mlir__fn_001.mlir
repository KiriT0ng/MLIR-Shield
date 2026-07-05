func.func @test_argmax_fold_i64_index(%arg0: tensor<1xi8>) -> tensor<i64> {
  %0 = tosa.argmax %arg0 {axis = 0 : i32} : (tensor<1xi8>) -> tensor<i64>
  return %0 : tensor<i64>
}
