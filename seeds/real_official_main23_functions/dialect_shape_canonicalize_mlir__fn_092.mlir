func.func @fold_div_mixed() -> !shape.size {
  %c2 = shape.const_size 12
  %c3 = arith.constant 3 : index
  %result = shape.div %c2, %c3 : !shape.size, index -> !shape.size
  return %result : !shape.size
}
