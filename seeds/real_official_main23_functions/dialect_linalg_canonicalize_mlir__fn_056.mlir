func.func @transpose_non_splat_constant(%init: tensor<3x2xf32>) -> tensor<3x2xf32> {
  %cst = arith.constant dense<[[1.000000e+00, 2.000000e+00, 3.000000e+00], [4.000000e+00, 5.000000e+00, 6.000000e+00]]> : tensor<2x3xf32>
  %transpose = linalg.transpose
      ins(%cst:tensor<2x3xf32>)
      outs(%init:tensor<3x2xf32>)
      permutation = [1, 0]
  func.return %transpose : tensor<3x2xf32>
}
