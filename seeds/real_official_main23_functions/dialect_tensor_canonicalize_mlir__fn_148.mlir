func.func @reshape_nofold_2d_ins(%arg0 : tensor<?x?xi32>, %arg1: index, %arg2: index) -> tensor<?x?xi32> {
  %ds = tensor.from_elements %arg1, %arg2 : tensor<2xindex>
  %reshape = tensor.reshape %arg0(%ds) : (tensor<?x?xi32>, tensor<2xindex>) -> tensor<?x?xi32>
  return %reshape : tensor<?x?xi32>
}
