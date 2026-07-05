func.func @test_row_gather_block_scaled_mxfp(%arg0: tensor<13x21x32xf4E2M1FN>, %arg1: tensor<13x21x1xf8E8M0FNU>, %arg2: tensor<13x26xi32>) -> (tensor<13x52x32xf4E2M1FN>, tensor<13x52x1xf8E8M0FNU>) {
  %row_count = "tosa.const"() {values = dense<2> : tensor<1xi32>} : () -> tensor<1xi32>
  %0:2 = tosa.row_gather_block_scaled %arg0, %arg1, %arg2, %row_count {block_size = #tosa.block_size<BLOCK_SIZE_32>} : (tensor<13x21x32xf4E2M1FN>, tensor<13x21x1xf8E8M0FNU>, tensor<13x26xi32>, tensor<1xi32>) -> (tensor<13x52x32xf4E2M1FN>, tensor<13x52x1xf8E8M0FNU>)
  return %0#0, %0#1 : tensor<13x52x32xf4E2M1FN>, tensor<13x52x1xf8E8M0FNU>
}
