func.func @fold_mul_index() -> index {
  %c2 = arith.constant 2 : index
  %c3 = arith.constant 3 : index
  %result = shape.mul %c2, %c3 : index, index -> index
  return %result : index
}
