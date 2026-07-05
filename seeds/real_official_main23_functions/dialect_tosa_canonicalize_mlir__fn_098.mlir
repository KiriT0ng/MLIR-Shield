func.func @no_fold_negate_negate_non_zero_zp(%arg0: tensor<?x1xi8>) -> tensor<?x1xi8> {
  // cannot fold if any zp is not constant 0
  %zero = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
  %one = "tosa.const"() <{values = dense<1> : tensor<1xi8>}> : () -> tensor<1xi8>
  %0 = tosa.negate %arg0, %zero, %one : (tensor<?x1xi8>, tensor<1xi8>, tensor<1xi8>) -> tensor<?x1xi8>
  %1 = tosa.negate %0, %zero, %zero : (tensor<?x1xi8>, tensor<1xi8>, tensor<1xi8>) -> tensor<?x1xi8>
  %2 = tosa.negate %1, %one, %zero : (tensor<?x1xi8>, tensor<1xi8>, tensor<1xi8>) -> tensor<?x1xi8>
  %3 = tosa.negate %2, %zero, %zero : (tensor<?x1xi8>, tensor<1xi8>, tensor<1xi8>) -> tensor<?x1xi8>
  %4 = tosa.negate %3, %zero, %one : (tensor<?x1xi8>, tensor<1xi8>, tensor<1xi8>) -> tensor<?x1xi8>
  return %4 : tensor<?x1xi8>
}
