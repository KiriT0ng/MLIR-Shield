func.func @test_argmax_f8E4M3FN(%arg0: tensor<12x8x16xf8E4M3FN>) -> tensor<12x16xi32> {
  %0 = tosa.argmax %arg0 { axis = 1 : i32 } : (tensor<12x8x16xf8E4M3FN>) -> tensor<12x16xi32>
  return %0 : tensor<12x16xi32>
}
