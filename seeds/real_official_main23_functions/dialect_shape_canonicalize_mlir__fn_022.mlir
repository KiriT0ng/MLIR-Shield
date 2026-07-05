func.func @from_extents_poison() -> !shape.shape {
  %0 = ub.poison : index
  %ret = shape.from_extents %0 : index
  return %ret : !shape.shape
}
