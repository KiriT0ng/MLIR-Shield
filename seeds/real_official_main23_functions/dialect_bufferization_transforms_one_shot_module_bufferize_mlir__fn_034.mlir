func.func @foo(%t: tensor<5xf32>) -> tensor<5xf32> {
  %0 = call @bar(%t) : (tensor<5xf32>) -> (tensor<5xf32>)
  return %0 : tensor<5xf32>
}
