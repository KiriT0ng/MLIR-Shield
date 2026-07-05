func.func @transpose_1d(%input: tensor<16xf32>,
                        %init: tensor<16xf32>) -> tensor<16xf32> {
  %transpose = linalg.transpose
      ins(%input:tensor<16xf32>)
      outs(%init:tensor<16xf32>)
      permutation = [0]
  func.return %transpose : tensor<16xf32>
}
