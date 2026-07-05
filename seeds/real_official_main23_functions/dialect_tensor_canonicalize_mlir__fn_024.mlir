func.func @from_elements_with_vector_element_type() -> tensor<1xvector<1xi1>> {
  %0 = vector.constant_mask [1] : vector<1xi1>
  %1 = tensor.from_elements %0 : tensor<1xvector<1xi1>>
  return %1 : tensor<1xvector<1xi1>>
}
