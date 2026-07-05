func.func @foldSubXX_tensor(%static : tensor<10xi32>, %dyn : tensor<?x?xi32>) -> (tensor<10xi32>, tensor<?x?xi32>) {
  %static_sub = arith.subi %static, %static : tensor<10xi32>
  %dyn_sub = arith.subi %dyn, %dyn : tensor<?x?xi32>
  return %static_sub, %dyn_sub : tensor<10xi32>, tensor<?x?xi32>
}
