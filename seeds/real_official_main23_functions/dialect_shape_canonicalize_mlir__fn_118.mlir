func.func @cast_extent_tensor_operands(%arg0 : tensor<?xindex>,
    %arg1 : tensor<3xindex>) -> (!shape.witness, tensor<?xindex>) {
  %0 = tensor.cast %arg0 : tensor<?xindex> to tensor<3xindex>
  %1 = tensor.cast %arg1 : tensor<3xindex> to tensor<?xindex>
  %2 = shape.cstr_broadcastable %0, %1 : tensor<3xindex>, tensor<?xindex>
  %3 = shape.broadcast %0, %1 :tensor<3xindex>, tensor<?xindex>
      -> tensor<?xindex>
  return %2, %3 : !shape.witness, tensor<?xindex>
}
