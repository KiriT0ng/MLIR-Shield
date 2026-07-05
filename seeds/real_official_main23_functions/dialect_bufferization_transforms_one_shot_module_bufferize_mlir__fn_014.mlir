func.func @f2(%t: tensor<?xf32>) -> (f32) {
  %0 = call @f1(%t) : (tensor<?xf32>) -> (f32)
  return %0 : f32
}
