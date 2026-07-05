func.func @broadcast_no_crash_on_poison() {
  %0 = shape.const_shape [1, 2, 3] : tensor<3xindex>
  %1 = ub.poison : tensor<3xindex>
  %2 = shape.broadcast %0, %1 : tensor<3xindex>, tensor<3xindex> -> tensor<3xindex>
  %3 = tensor.rank %2 : tensor<3xindex>
  return
}
