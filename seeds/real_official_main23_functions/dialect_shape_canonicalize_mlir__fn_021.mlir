func.func @no_fold(%arg0: index) -> !shape.shape {
  %e0 = arith.constant 3 : index
  %ret = shape.from_extents %e0, %arg0 : index, index
  return %ret : !shape.shape
}
