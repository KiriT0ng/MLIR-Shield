func.func @reshape_fold_2d(%arg0 : tensor<?x?xi32>) -> tensor<?x?xi32> {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %d0 = tensor.dim %arg0, %c0 : tensor<?x?xi32>
  %d1 = tensor.dim %arg0, %c1 : tensor<?x?xi32>
  %ds = tensor.from_elements %d0, %d1 : tensor<2xindex>
  %reshape = tensor.reshape %arg0(%ds) : (tensor<?x?xi32>, tensor<2xindex>) -> tensor<?x?xi32>
  return %reshape : tensor<?x?xi32>
}
