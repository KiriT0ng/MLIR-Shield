func.func @fold_empty_tensor_with_cast_encoding(%arg0 : index)
    -> tensor<1x12xf32, "foo"> {
  %0 = tensor.empty(%arg0) : tensor<?x12xf32, "foo">
  %1 = tensor.cast %0 : tensor<?x12xf32, "foo"> to tensor<1x12xf32, "foo">
  return %1 : tensor<1x12xf32, "foo">
}
