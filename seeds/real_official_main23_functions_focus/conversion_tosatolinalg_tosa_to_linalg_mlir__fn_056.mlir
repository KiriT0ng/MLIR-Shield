func.func @tile_dyn_multiples(%arg0 : tensor<2x3xi8>) -> () {
  %cst = tosa.const_shape { values = dense<[2, -1]> : tensor<2xindex> } : () -> !tosa.shape<2>
  %0 = tosa.tile %arg0, %cst: (tensor<2x3xi8>, !tosa.shape<2>)  -> tensor<2x?xi8>

  return
}
