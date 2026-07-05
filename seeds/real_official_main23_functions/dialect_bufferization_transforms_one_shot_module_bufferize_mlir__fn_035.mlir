func.func @bar(%t: tensor<5xf32>) -> tensor<5xf32>{
  %0 = call @foo(%t) : (tensor<5xf32>) -> (tensor<5xf32>)
  return %0 : tensor<5xf32>
}
