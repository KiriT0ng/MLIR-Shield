func.func @extract_from_tensor.from_elements(%element : index) -> index {
  %c0 = arith.constant 0 : index
  %tensor = tensor.from_elements %element : tensor<1xindex>
  %extracted_element = tensor.extract %tensor[%c0] : tensor<1xindex>
  return %extracted_element : index
}
