module {
  func.func @main() {
    %c0_i8 = arith.constant 0 : i8
    %input_empty = tensor.empty() : tensor<1x4x3x1xi8>
    %input = linalg.fill ins(%c0_i8 : i8)
      outs(%input_empty : tensor<1x4x3x1xi8>) -> tensor<1x4x3x1xi8>
    %c0_i32 = arith.constant 0 : i32
    %output_empty = tensor.empty() : tensor<1x4x1x1xi32>
    %output = linalg.fill ins(%c0_i32 : i32)
      outs(%output_empty : tensor<1x4x1x1xi32>) -> tensor<1x4x1x1xi32>
    %window = tensor.empty() : tensor<1x2xi32>
    %pooled = linalg.pooling_nhwc_sum
      ins(%input, %window : tensor<1x4x3x1xi8>, tensor<1x2xi32>)
      outs(%output : tensor<1x4x1x1xi32>) -> tensor<1x4x1x1xi32>
    return
  }
}
