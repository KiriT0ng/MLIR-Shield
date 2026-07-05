func.func @do_not_fold_intdiv_division_by_0() -> tensor<1x24x2xi32> {
  %1 = "tosa.const"() <{values = dense<0> : tensor<1x24x2xi32>}> : () -> tensor<1x24x2xi32>
  %4 = "tosa.const"() <{values = dense<20> : tensor<1x24x2xi32>}> : () -> tensor<1x24x2xi32>
  %16 = tosa.intdiv %4, %1 : (tensor<1x24x2xi32>, tensor<1x24x2xi32>) -> tensor<1x24x2xi32>
  return %16 : tensor<1x24x2xi32>
}
