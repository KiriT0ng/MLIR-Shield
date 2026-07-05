func.func @tile_dyn_input(%arg0 : tensor<?x3xi8>) -> () {
  %cst21 = tosa.const_shape { values = dense<[2, 1]> : tensor<2xindex> } : () -> !tosa.shape<2>
  %0 = tosa.tile %arg0, %cst21: (tensor<?x3xi8>, !tosa.shape<2>)  -> tensor<?x3xi8>

  return
}
