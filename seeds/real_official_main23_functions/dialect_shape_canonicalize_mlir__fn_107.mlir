func.func @shape_of_from_reshape_int_to_index(%arg0: tensor<?x1xf32>, %arg1: tensor<3xi32>) -> tensor<3xindex> {
    %0 = tensor.reshape %arg0(%arg1) : (tensor<?x1xf32>, tensor<3xi32>) -> tensor<?x1x1xf32>
    %1 = shape.shape_of %0 : tensor<?x1x1xf32> -> tensor<3xindex>
    return %1 : tensor<3xindex>
}
