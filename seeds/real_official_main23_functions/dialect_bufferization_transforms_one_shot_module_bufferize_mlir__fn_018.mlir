func.func @main() {
  %A = arith.constant dense<[1, 2, 3, 4]> : tensor<4xi32>

  call @some_external_func(%A) : (tensor<4xi32>) -> ()

  return
}
