func.func @fold_div_size() -> !shape.size {
  %c2 = shape.const_size 10
  %c3 = shape.const_size 3
  %result = shape.div %c2, %c3 : !shape.size, !shape.size -> !shape.size
  return %result : !shape.size
}
