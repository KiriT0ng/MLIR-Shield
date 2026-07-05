func.func @materialize_in_destination_aliasing(%t: tensor<?xf32>, %p1: index, %p2: index, %sz: index) -> tensor<5xf32> {
  %buffer = tensor.empty(%sz) : tensor<?xf32>
  %src = tensor.extract_slice %t[%p1][5][1] : tensor<?xf32> to tensor<5xf32>
  %dest = tensor.extract_slice %t[%p2][5][1] : tensor<?xf32> to tensor<5xf32>
  %r = bufferization.materialize_in_destination %src in %dest : (tensor<5xf32>, tensor<5xf32>) -> tensor<5xf32>
  return %r : tensor<5xf32>
}
