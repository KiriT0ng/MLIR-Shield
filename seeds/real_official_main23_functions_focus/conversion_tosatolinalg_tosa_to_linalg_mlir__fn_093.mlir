func.func @negate_i64_no_noop_cast(%arg0: tensor<4xi64>, %in_zp: tensor<1xi64>, %out_zp: tensor<1xi64>) -> tensor<4xi64> {
  %neg = tosa.negate %arg0, %in_zp, %out_zp : (tensor<4xi64>, tensor<1xi64>, tensor<1xi64>) -> tensor<4xi64>
  return %neg : tensor<4xi64>
}
