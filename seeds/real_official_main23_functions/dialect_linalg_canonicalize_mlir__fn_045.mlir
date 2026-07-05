func.func @canonicalize_dim_of_dest_style_op(%arg0 : tensor<?x?xf32>) -> tensor<?x?xf32> {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %dim0_0 = tensor.dim %arg0, %c0 : tensor<?x?xf32>
  %dim1_0 = tensor.dim %arg0, %c1 : tensor<?x?xf32>
  %0 = tensor.empty(%dim0_0, %dim1_0) : tensor<?x?xf32>
  %1 = linalg.copy ins(%arg0 : tensor<?x?xf32>) outs(%0 : tensor<?x?xf32>) -> tensor<?x?xf32>
  %dim0_1 = tensor.dim %1, %c0 : tensor<?x?xf32>
  %dim1_1 = tensor.dim %1, %c1 : tensor<?x?xf32>
  %2 = tensor.empty(%dim0_1, %dim1_1) : tensor<?x?xf32>
  %3 = linalg.copy ins(%1 : tensor<?x?xf32>) outs(%2 : tensor<?x?xf32>) -> tensor<?x?xf32>
  return %3: tensor<?x?xf32>
}
