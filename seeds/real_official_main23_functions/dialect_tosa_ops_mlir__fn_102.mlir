func.func @test_pad_dynamic_padding(%arg0: tensor<1x?x?x576xf32>) -> tensor<1x?x?x576xf32> {
  %0 = tosa.const_shape {values = dense<0> : tensor<1xindex>} : () -> !tosa.shape<1>
  %1 = tosa.concat_shape %0, %0, %0, %0, %0, %0, %0, %0 : (!tosa.shape<1>, !tosa.shape<1>, !tosa.shape<1>, !tosa.shape<1>, !tosa.shape<1>, !tosa.shape<1>, !tosa.shape<1>, !tosa.shape<1>) -> !tosa.shape<8>
  %2 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
  %3 = tosa.pad %arg0, %1, %2 : (tensor<1x?x?x576xf32>, !tosa.shape<8>, tensor<1xf32>) -> tensor<1x?x?x576xf32>
  return %3 : tensor<1x?x?x576xf32>
}
