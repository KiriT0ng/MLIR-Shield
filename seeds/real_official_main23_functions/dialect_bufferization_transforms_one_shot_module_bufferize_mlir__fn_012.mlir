func.func @call_func_with_non_tensor_return(
    %t0: tensor<?xf32> {bufferization.writable = false}) -> (f32, tensor<?xf32>) {
  %0, %1 = call @inner_func(%t0) : (tensor<?xf32>) -> (tensor<?xf32>, f32)

  // Note: The tensor return value cannot fold away because the CallOp
  // bufferized out-of-place.
  return %1, %0 : f32, tensor<?xf32>
}
