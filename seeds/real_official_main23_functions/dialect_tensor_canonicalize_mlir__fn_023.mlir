func.func @from_elements_with_poison() -> tensor<1xindex> {
  %0 = ub.poison : index
  %1 = tensor.from_elements %0 : tensor<1xindex>
  return %1 : tensor<1xindex>
}
