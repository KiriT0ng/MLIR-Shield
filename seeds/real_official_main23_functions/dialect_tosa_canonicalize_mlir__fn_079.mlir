func.func @single_bit_reshape() -> tensor<1xi1> {
  %0 = arith.constant dense<true> : tensor<1x1xi1>
  %2 = "tosa.const_shape"() <{values = dense<1> : tensor<1xindex>}> : () -> !tosa.shape<1>
  %1 = tosa.reshape %0, %2 : (tensor<1x1xi1>, !tosa.shape<1>) -> tensor<1xi1>
  return %1 : tensor<1xi1>
}
