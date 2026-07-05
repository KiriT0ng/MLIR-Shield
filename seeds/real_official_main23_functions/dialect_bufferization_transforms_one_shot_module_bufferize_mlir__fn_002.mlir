func.func @call_to_unknown_tensor_returning_func(%t : tensor<?xf32>) {
  call @foo(%t) : (tensor<?xf32>) -> (f32, tensor<?xf32>, f32)
  return
}
