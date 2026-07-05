func.func @canonicalize_cross_concat_inputs(%arg0 : tensor<1x12x12xf32>, %arg1 : tensor<1x12x12xf32>) -> (tensor<1x12x15xf32>, tensor<1x12x20xf32>) {
  %0 = tosa.concat %arg0, %arg1 {axis = 2 : i32} : (tensor<1x12x12xf32>, tensor<1x12x12xf32>) -> tensor<1x12x24xf32>
  %1 = tosa.const_shape {values = dense<[0, 0, 0]> : tensor<3xindex>} : () -> !tosa.shape<3>
  %2 = tosa.const_shape {values = dense<[0, 0, 4]> : tensor<3xindex>} : () -> !tosa.shape<3>
  %3 = tosa.const_shape {values = dense<[1, 12, 15]> : tensor<3xindex>} : () -> !tosa.shape<3>
  %4 = tosa.const_shape {values = dense<[1, 12, 20]> : tensor<3xindex>} : () -> !tosa.shape<3>
  %5 = tosa.slice %0, %1, %3 : (tensor<1x12x24xf32>, !tosa.shape<3>, !tosa.shape<3>) -> tensor<1x12x15xf32>
  %6 = tosa.slice %0, %2, %4 : (tensor<1x12x24xf32>, !tosa.shape<3>, !tosa.shape<3>) -> tensor<1x12x20xf32>
  return %5, %6 : tensor<1x12x15xf32>, tensor<1x12x20xf32>
}
