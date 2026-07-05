func.func @main(%t: tensor<?xf32> {bufferization.writable = false}) -> (f32) {
  %0 = call @f2(%t) : (tensor<?xf32>) -> (f32)
  return %0 : f32
}
