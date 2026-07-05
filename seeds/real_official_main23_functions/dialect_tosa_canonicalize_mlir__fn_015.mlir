func.func @cast_nofold(%arg0: tensor<?x1xf32>) -> tensor<?x1xi32> {
  %0 = tosa.cast %arg0 : (tensor<?x1xf32>) -> tensor<?x1xi32>
  return %0 : tensor<?x1xi32>
}
