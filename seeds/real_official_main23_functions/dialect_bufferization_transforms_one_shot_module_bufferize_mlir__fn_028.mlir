func.func @main() {
  %t = arith.constant dense<[1.0, 2.0, 3.0]> : tensor<3xf32>
  %unranked = tensor.cast %t : tensor<3xf32> to tensor<*xf32>
  func.call @maybe_writing_func(%unranked) : (tensor<*xf32>) -> ()
  return
}
