func.func @test_argmax_f8E5M2(%arg0: tensor<12x8x16xf8E5M2>) -> tensor<12x16xi32> {
  %0 = tosa.argmax %arg0 { axis = 1 : i32 } : (tensor<12x8x16xf8E5M2>) -> tensor<12x16xi32>
  return %0 : tensor<12x16xi32>
}
