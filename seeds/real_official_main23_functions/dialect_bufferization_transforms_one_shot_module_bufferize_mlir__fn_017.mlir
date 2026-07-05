func.func @main(%t: tensor<?xf32> {bufferization.writable = false}) -> f32 {
  %0 = call @does_not_read(%t) : (tensor<?xf32>) -> (tensor<?xf32>)
  %idx = arith.constant 4 : index
  %r = tensor.extract %0[%idx] : tensor<?xf32>
  return %r : f32
}
