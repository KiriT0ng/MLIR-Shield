module {
  func.func @main(%arg0: tensor<1x1xi8>, %arg1: tensor<1x1xi8>) {
    %0 = "tosa.bitwise_and"(%arg0, %arg1) : (tensor<1x1xi8>, tensor<1x1xi8>) -> tensor<1x1xi8>
    %1 = "tosa.reshape"(%0) {new_shape = [1, 1, 1, 1]} : (tensor<1x1xi8>) -> tensor<1x1x1x1xi8>
    %c0_i8 = arith.constant 0 : i8
    %2 = tensor.pad %1 low[0, 1, 1, 0] high[0, 2, 1, 0] {
    ^bb0(%arg2: index, %arg3: index, %arg4: index, %arg5: index):
      tensor.yield %c0_i8 : i8
    } : tensor<1x1x1x1xi8> to tensor<1x4x3x1xi8>
    %c0_i32 = arith.constant 0 : i32
    %3 = tensor.empty() : tensor<1x4x1x1xi32>
    %4 = linalg.fill ins(%c0_i32 : i32) outs(%3 : tensor<1x4x1x1xi32>) -> tensor<1x4x1x1xi32>
    %5 = tensor.empty() : tensor<1x2xi32>
    %6 = linalg.pooling_nhwc_sum
      ins(%2, %5 : tensor<1x4x3x1xi8>, tensor<1x2xi32>)
      outs(%4 : tensor<1x4x1x1xi32>) -> tensor<1x4x1x1xi32>
    return
  }
}
