func.func private @inner_func(%t: tensor<?xf32>) -> (tensor<?xf32>, f32) {
  %f = arith.constant 1.0 : f32
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %0 = tensor.insert %f into %t[%c0] : tensor<?xf32>
  %1 = tensor.extract %0[%c1] : tensor<?xf32>
  return %0, %1 : tensor<?xf32>, f32
}
