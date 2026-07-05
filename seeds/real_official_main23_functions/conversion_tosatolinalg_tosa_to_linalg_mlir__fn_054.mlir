func.func @tile(%arg0 : tensor<2x3xi8>) -> () {
  %cst21 = tosa.const_shape { values = dense<[2, 1]> : tensor<2xindex> } : () -> !tosa.shape<2>
  %0 = tosa.tile %arg0, %cst21: (tensor<2x3xi8>, !tosa.shape<2>) -> tensor<4x3xi8>

  // tosa.reshape [[GENERIC]], [[CONST8]]
  %cst12 = tosa.const_shape { values = dense<[1, 2]> : tensor<2xindex> } : () -> !tosa.shape<2>
  %1 = tosa.tile %arg0, %cst12: (tensor<2x3xi8>, !tosa.shape<2>) -> tensor<2x6xi8>

  %cst57 = tosa.const_shape { values = dense<[5, 7]> : tensor<2xindex> } : () -> !tosa.shape<2>
  %2 = tosa.tile %arg0, %cst57: (tensor<2x3xi8>, !tosa.shape<2>)  -> tensor<10x21xi8>

  return
}
