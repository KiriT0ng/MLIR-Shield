func.func @concretize_broadcast_result_type(%arg0 : tensor<2xindex>,
    %arg1 : tensor<3xindex>) -> tensor<?xindex> {
  %0 = shape.broadcast %arg0, %arg1 : tensor<2xindex>, tensor<3xindex>
      -> tensor<?xindex>
  return %0 : tensor<?xindex>
}
