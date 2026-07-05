func.func @slice_dynamic_size_static_output_canonicalize(%arg0: tensor<2x60x59x?xf32>) -> tensor<2x60x58x?xf32> {
    %0 = tosa.const_shape  {values = dense<0> : tensor<4xindex>} : () -> !tosa.shape<4>
    %1 = tosa.const_shape  {values = dense<[-1, 60, 58, -1]> : tensor<4xindex>} : () -> !tosa.shape<4>
    %2 = tosa.slice %arg0, %0, %1 : (tensor<2x60x59x?xf32>, !tosa.shape<4>, !tosa.shape<4>) -> tensor<2x60x58x?xf32>
    return %2 : tensor<2x60x58x?xf32>
}
