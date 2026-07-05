func.func @fold_div_index_neg_lhs() -> index {
  %c2 = arith.constant -10 : index
  %c3 = arith.constant 4 : index
  %result = shape.div %c2, %c3 : index, index -> index
  return %result : index
}
