func.func @canonicalize_pad_slice_dynamic_noupdate(%arg0: tensor<1x16x?x3xf32>) -> tensor<1x16x?x2xf32> {
  %pad_const = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
  %padding = tosa.const_shape  {values = dense<[0, 0, 0, 0, 2, 2, 0, 0]> : tensor<8xindex>} : () -> !tosa.shape<8>
  %padded = tosa.pad %arg0, %padding, %pad_const : (tensor<1x16x?x3xf32>, !tosa.shape<8>, tensor<1xf32>) -> tensor<1x16x?x3xf32>
  %start = tosa.const_shape  {values = dense<[0, 0, 0, 0]> : tensor<4xindex>} : () -> !tosa.shape<4>
  %size = tosa.const_shape  {values = dense<[1, 16, 15, 2]> : tensor<4xindex>} : () -> !tosa.shape<4>
  %sliced = tosa.slice %padded, %start, %size : (tensor<1x16x?x3xf32>, !tosa.shape<4>, !tosa.shape<4>) -> tensor<1x16x?x2xf32>
  return %sliced : tensor<1x16x?x2xf32>
}
