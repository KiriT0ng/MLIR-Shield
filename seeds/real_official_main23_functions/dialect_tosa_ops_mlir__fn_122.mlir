func.func @test_row_gather_block_scaled(%arg0: tensor<13x21x3xf32>, %arg1: tensor<13x26xi32>) -> tensor<13x52x3xf32> {
  %row_count = "tosa.const"() {values = dense<2> : tensor<1xi32>} : () -> tensor<1xi32>
  %0 = tosa.row_gather_block_scaled %arg0, %arg1, %row_count {block_size = #tosa.block_size<BLOCK_SIZE_1>} : (tensor<13x21x3xf32>, tensor<13x26xi32>, tensor<1xi32>) -> (tensor<13x52x3xf32>)
  return %0 : tensor<13x52x3xf32>
}
