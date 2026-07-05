func.func @canonicalize_concat_slice_on_non_concat_axis(%arg0 : tensor<1x12x12xf32>, %arg1 : tensor<1x12x12xf32>) -> (tensor<1x6x12xf32>, tensor<1x3x12xf32>) {
  %0 = tosa.concat %arg0, %arg1 {axis = 2 : i32} : (tensor<1x12x12xf32>, tensor<1x12x12xf32>) -> tensor<1x12x24xf32>
  %1 = tosa.const_shape {values = dense<[0, 0, 0]> : tensor<3xindex>} : () -> !tosa.shape<3>
  %2 = tosa.const_shape {values = dense<[1, 6, 12]> : tensor<3xindex>} : () -> !tosa.shape<3>
  %3 = tosa.const_shape {values = dense<[0, 3, 12]> : tensor<3xindex>} : () -> !tosa.shape<3>
  %4 = tosa.const_shape {values = dense<[1, 3, 12]> : tensor<3xindex>} : () -> !tosa.shape<3>
  %5 = tosa.slice %0, %1, %2 : (tensor<1x12x24xf32>, !tosa.shape<3>, !tosa.shape<3>) -> tensor<1x6x12xf32>
  %6 = tosa.slice %0, %3, %4 : (tensor<1x12x24xf32>, !tosa.shape<3>, !tosa.shape<3>) -> tensor<1x3x12xf32>
  return %5, %6 : tensor<1x6x12xf32>, tensor<1x3x12xf32>
}
