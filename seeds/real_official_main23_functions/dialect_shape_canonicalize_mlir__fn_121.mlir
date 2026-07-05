func.func @add_poison() -> !shape.size {
  %1 = shape.const_size 2
  %2 = ub.poison : !shape.size
  %result = shape.add %1, %2 : !shape.size, !shape.size -> !shape.size
  return %result : !shape.size
}
