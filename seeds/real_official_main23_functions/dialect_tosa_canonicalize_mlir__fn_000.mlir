func.func @argmax_nofold(%arg0: tensor<?x1xf32>) -> tensor<1xi32> {
  %0 = tosa.argmax %arg0 {axis = 0 : i32}: (tensor<?x1xf32>) -> tensor<1xi32>
  return %0 : tensor<1xi32>
}
