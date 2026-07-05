func.func @shorter_inplace_attr(%arg0: tensor<4xi32>) -> (tensor<4xi32>, tensor<4xi32>) {
  // The __inplace_operands_attr__ has only one entry but the return has two
  // tensor operands.  The analysis must expand the annotation without crashing.
  return {__inplace_operands_attr__ = ["false"]} %arg0, %arg0 : tensor<4xi32>, tensor<4xi32>
}
