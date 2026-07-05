func.func @extract_oob_from_tensor.from_elements(%element : index) -> index {
  %c2 = arith.constant 2 : index
  %tensor = tensor.from_elements %element : tensor<1xindex>
  %extracted_element = tensor.extract %tensor[%c2] : tensor<1xindex>
  return %extracted_element : index
}
