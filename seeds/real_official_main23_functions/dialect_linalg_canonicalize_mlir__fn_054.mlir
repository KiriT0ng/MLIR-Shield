func.func @transpose_identity_perm(%input: tensor<16x32x64xf32>,
                                   %init: tensor<16x32x64xf32>) -> tensor<16x32x64xf32> {
  %transpose = linalg.transpose
      ins(%input:tensor<16x32x64xf32>)
      outs(%init:tensor<16x32x64xf32>)
      permutation = [0, 1, 2]
  func.return %transpose : tensor<16x32x64xf32>
}
