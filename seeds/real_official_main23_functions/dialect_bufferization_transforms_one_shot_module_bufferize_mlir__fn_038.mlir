func.func @inner_func(%t: tensor<5xf32> {bufferization.writable = false}) -> tensor<5xf32> {
    return %t : tensor<5xf32>
  }
