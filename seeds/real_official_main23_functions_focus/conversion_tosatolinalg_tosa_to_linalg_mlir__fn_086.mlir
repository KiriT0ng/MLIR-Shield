func.func @argmax_nan_ignore_int(%arg0: tensor<5x4xi8>, %arg1: tensor<5x4xi8>) -> () {
 %12 = tosa.argmax %arg0 {axis = 0 : i32, nan_mode = IGNORE} : (tensor<5x4xi8>)  -> tensor<4xi32>
  return
}
