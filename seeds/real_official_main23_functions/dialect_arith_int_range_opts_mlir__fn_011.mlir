func.func @analysis_crash(%arg0: i32, %arg1: tensor<128xi1>) -> tensor<128xi64> {
  %c0_i32 = arith.constant 0 : i32
  %cst = arith.constant dense<-1> : tensor<128xi32>
  %splat = tensor.splat %arg0 : tensor<128xi32>
  %0 = scf.for %arg2 = %c0_i32 to %arg0 step %arg0 iter_args(%arg3 = %splat) -> (tensor<128xi32>)  : i32 {
    scf.yield %arg3 : tensor<128xi32>
  }
  %1 = arith.select %arg1, %0#0, %cst : tensor<128xi1>, tensor<128xi32>
  // Make sure the analysis doesn't crash when materializing the range as a tensor constant.
  %2 = arith.extsi %1 : tensor<128xi32> to tensor<128xi64>
  return %2 : tensor<128xi64>
}
