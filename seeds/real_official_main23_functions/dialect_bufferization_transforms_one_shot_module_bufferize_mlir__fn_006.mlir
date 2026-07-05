func.func @main(%t: tensor<?xf32> {bufferization.writable = true}) -> (f32) {
  %0 = call @private_func(%t) : (tensor<?xf32>) -> (f32)
  return %0 : f32
}
