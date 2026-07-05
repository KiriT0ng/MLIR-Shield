func.func @reshape_fold_3d_cst(%arg0 : tensor<5x?x?xi32>) -> tensor<5x?x?xi32> {
  %c1 = arith.constant 1 : index
  %c2 = arith.constant 2 : index
  %d0 = arith.constant 5 : index
  %d1 = tensor.dim %arg0, %c1 : tensor<5x?x?xi32>
  %d2 = tensor.dim %arg0, %c2 : tensor<5x?x?xi32>
  %ds = tensor.from_elements %d0, %d1, %d2 : tensor<3xindex>
  %reshape = tensor.reshape %arg0(%ds) : (tensor<5x?x?xi32>, tensor<3xindex>) -> tensor<5x?x?xi32>
  return %reshape : tensor<5x?x?xi32>
}
