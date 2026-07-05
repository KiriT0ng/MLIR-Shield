func.func @canonicalize_concat_slice_middle_axis(%arg0 : tensor<1x12x12xf32>, %arg1 : tensor<1x12x12xf32>) -> (tensor<1x12x12xf32>, tensor<1x12x12xf32>) {
  %0 = tosa.concat %arg0, %arg1 {axis = 1 : i32} : (tensor<1x12x12xf32>, tensor<1x12x12xf32>) -> tensor<1x24x12xf32>
  %1 = tosa.const_shape {values = dense<[0, 0, 0]> : tensor<3xindex>} : () -> !tosa.shape<3>
  %2 = tosa.const_shape {values = dense<[0, 12, 0]> : tensor<3xindex>} : () -> !tosa.shape<3>
  %3 = tosa.const_shape {values = dense<[1, 12, 12]> : tensor<3xindex>} : () -> !tosa.shape<3>
  %4 = tosa.slice %0, %1, %3 : (tensor<1x24x12xf32>, !tosa.shape<3>, !tosa.shape<3>) -> tensor<1x12x12xf32>
  %5 = tosa.slice %0, %2, %3 : (tensor<1x24x12xf32>, !tosa.shape<3>, !tosa.shape<3>) -> tensor<1x12x12xf32>
  return %4, %5 : tensor<1x12x12xf32>, tensor<1x12x12xf32>
}
