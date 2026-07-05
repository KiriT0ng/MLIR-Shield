func.func @extract_oob_from_tensor.from_elements(%element : index) -> index {
  %c1 = arith.constant 1 : index
  %tensor = tensor.from_elements %element : tensor<1xindex>
  %extracted_element = tensor.extract %tensor[%c1] : tensor<1xindex>
  return %extracted_element : index
}
