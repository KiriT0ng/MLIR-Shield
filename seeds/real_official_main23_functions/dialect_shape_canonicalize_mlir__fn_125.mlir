func.func @extract_from_shape_of_tensor(%arg0: tensor<?xf32>) -> index {
  %c0 = arith.constant 0 : index
  %shape = shape.shape_of %arg0 : tensor<?xf32> -> tensor<1xindex>
  %dim = tensor.extract %shape[%c0] : tensor<1xindex>
  return %dim : index
}
