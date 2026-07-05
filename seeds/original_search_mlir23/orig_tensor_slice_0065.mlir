func.func @orig_tensor_slice_65(%arg0: tensor<?x8xf32>, %i: index) -> tensor<1x4xf32> {
  %c0 = arith.constant 0 : index
  %slice = tensor.extract_slice %arg0[%i, %c0] [1, 4] [1, 1] : tensor<?x8xf32> to tensor<1x4xf32>
  return %slice : tensor<1x4xf32>
}
