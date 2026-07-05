func.func @extract_from_tensor.cast(%tensor: tensor<9xf32>) -> f32 {
  %c0 = arith.constant 0 : index
  %casted = tensor.cast %tensor : tensor<9xf32> to tensor<?xf32>
  %result = tensor.extract %casted[%c0] : tensor<?xf32>
  return %result : f32
}
