func.func private @does_not_read(%t: tensor<?xf32>) -> tensor<?xf32> {
  %f0 = arith.constant 0.0 : f32
  %r = linalg.fill ins(%f0 : f32) outs(%t : tensor<?xf32>) -> tensor<?xf32>
  return %r : tensor<?xf32>
}
