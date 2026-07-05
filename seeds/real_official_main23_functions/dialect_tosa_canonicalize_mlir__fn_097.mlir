func.func @no_fold_negate_negate_non_const_zp(%arg0: tensor<?x1xf32>, %in_zp: tensor<1xf32>) -> tensor<?x1xf32> {
  // cannot fold if any zp is not constant
  %zero = "tosa.const"() <{values = dense<0.0> : tensor<1xf32>}> : () -> tensor<1xf32>
  %0 = tosa.negate %arg0, %in_zp, %zero : (tensor<?x1xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<?x1xf32>
  %1 = tosa.negate %0, %zero, %zero : (tensor<?x1xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<?x1xf32>
  %2 = tosa.negate %1, %zero, %in_zp : (tensor<?x1xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<?x1xf32>
  %3 = tosa.negate %2, %zero, %zero : (tensor<?x1xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<?x1xf32>
  %4 = tosa.negate %3, %in_zp, %zero : (tensor<?x1xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<?x1xf32>
  return %4 : tensor<?x1xf32>
}
