func.func @fold_rank() -> (index) {
  %const_0 = arith.constant dense<[[[1, -2, 1, 36]], [[0, 2, -1, 64]]]>
    : tensor<2x1x4xi32>

  // Fold a ank into a constant
  %rank_0 = tensor.rank %const_0 : tensor<2x1x4xi32>

  return %rank_0 : index
}
