func.func @canonicalize_concat_slice_final_axis(%arg0 : tensor<1x12x12x1xf32>, %arg1 : tensor<1x12x12x1xf32>) -> (tensor<1x12x12x1xf32>, tensor<1x12x12x1xf32>) {
  %0 = tosa.concat %arg0, %arg1 {axis = 3 : i32} : (tensor<1x12x12x1xf32>, tensor<1x12x12x1xf32>) -> tensor<1x12x12x2xf32>
  %1 = tosa.const_shape {values = dense<[0, 0, 0, 0]> : tensor<4xindex>} : () -> !tosa.shape<4>
  %2 = tosa.const_shape {values = dense<[0, 0, 0, 1]> : tensor<4xindex>} : () -> !tosa.shape<4>
  %3 = tosa.const_shape {values = dense<[1, 12, 12, 1]> : tensor<4xindex>} : () -> !tosa.shape<4>
  %4 = tosa.slice %0, %1, %3 : (tensor<1x12x12x2xf32>, !tosa.shape<4>, !tosa.shape<4>) -> tensor<1x12x12x1xf32>
  %5 = tosa.slice %0, %2, %3 : (tensor<1x12x12x2xf32>, !tosa.shape<4>, !tosa.shape<4>) -> tensor<1x12x12x1xf32>
  return %4, %5 : tensor<1x12x12x1xf32>, tensor<1x12x12x1xf32>
}
