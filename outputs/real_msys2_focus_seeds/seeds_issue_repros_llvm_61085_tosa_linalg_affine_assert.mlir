// Source: https://github.com/llvm/llvm-project/issues/61085
// Expected trigger: convert-linalg-to-affine-loops assertion after TOSA/Linalg conversion.
// Reported command:
// mlir-opt test.mlir -pass-pipeline="func.func(tosa-to-arith)" -linalg-bufferize
//   -pass-pipeline="func.func(tosa-to-linalg)" -convert-linalg-to-affine-loops

#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
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
    %3 = linalg.init_tensor [1, 4, 1, 1] : tensor<1x4x1x1xi32>
    %4 = linalg.fill ins(%c0_i32 : i32) outs(%3 : tensor<1x4x1x1xi32>) -> tensor<1x4x1x1xi32>
    %5 = linalg.init_tensor [1, 2] : tensor<1x2xi32>
    %6 = linalg.pooling_nhwc_sum
      {dilations = dense<1> : vector<2xi64>, strides = dense<[1, 2]> : vector<2xi64>}
      ins(%2, %5 : tensor<1x4x3x1xi8>, tensor<1x2xi32>)
      outs(%4 : tensor<1x4x1x1xi32>) -> tensor<1x4x1x1xi32>
    return
  }
}
