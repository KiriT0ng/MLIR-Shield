func.func @extract_negative_from_tensor.from_elements(%element : index) -> index {
  %c-1 = arith.constant -1 : index
  %tensor = tensor.from_elements %element : tensor<1xindex>
  %extracted_element = tensor.extract %tensor[%c-1] : tensor<1xindex>
  return %extracted_element : index
}
