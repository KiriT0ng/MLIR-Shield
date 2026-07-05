func.func @linalg_transpose_linalg.pack_multiple_tiles(%arg0: tensor<?x32x128xbf16>) -> tensor<32x?x64x16x2xbf16> {
  %c0 = arith.constant 0 : index
  %cst = arith.constant 0.000000e+00 : bf16
  %dim = tensor.dim %arg0, %c0 : tensor<?x32x128xbf16>

  %0 = tensor.empty(%dim) : tensor<32x128x?xbf16>
  %transposed = linalg.transpose
    ins(%arg0 : tensor<?x32x128xbf16>)
    outs(%0 : tensor<32x128x?xbf16>)
    permutation = [1, 2, 0]

  %2 = tensor.empty(%dim) : tensor<32x?x64x16x2xbf16>
  %pack = linalg.pack %transposed
    padding_value(%cst : bf16)
    outer_dims_perm = [0, 2, 1]
    inner_dims_pos = [2, 1]
    inner_tiles = [16, 2]
    into %2 : tensor<32x128x?xbf16> -> tensor<32x?x64x16x2xbf16>
  return %pack : tensor<32x?x64x16x2xbf16>
}
