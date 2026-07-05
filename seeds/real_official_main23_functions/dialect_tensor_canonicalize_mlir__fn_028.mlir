func.func @extract_from_tensor.generate(%idx: index, %tensor: tensor<*xf32>) -> index {
  %size = tensor.rank %tensor : tensor<*xf32>
  %0 = tensor.generate %size {
    ^bb0(%arg0: index):
    %1 = tensor.dim %tensor, %arg0 : tensor<*xf32>
    tensor.yield %1 : index
  } : tensor<?xindex>
  %1 = tensor.extract %0[%idx] : tensor<?xindex>
  return %1 : index
}
