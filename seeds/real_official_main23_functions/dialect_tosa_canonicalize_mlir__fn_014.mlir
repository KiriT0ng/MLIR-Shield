func.func @cast_fold(%arg0: tensor<?x1xf32>) -> tensor<?x1xf32> {
  %0 = tosa.cast %arg0 : (tensor<?x1xf32>) -> tensor<?x1xf32>
  return %0 : tensor<?x1xf32>
}
