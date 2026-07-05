func.func @br_in_func(%t: tensor<5xf32>) -> tensor<5xf32> {
  cf.br ^bb1(%t : tensor<5xf32>)
^bb1(%arg1 : tensor<5xf32>):
  func.return %arg1 : tensor<5xf32>
}
