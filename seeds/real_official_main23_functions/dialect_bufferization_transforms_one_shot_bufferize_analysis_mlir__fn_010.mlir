func.func @materialize_in_destination(%t: tensor<?xf32>, %sz: index) -> tensor<?xf32> {
  %buffer = tensor.empty(%sz) : tensor<?xf32>
  %r = bufferization.materialize_in_destination %buffer in %buffer : (tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>
  return %r : tensor<?xf32>
}
