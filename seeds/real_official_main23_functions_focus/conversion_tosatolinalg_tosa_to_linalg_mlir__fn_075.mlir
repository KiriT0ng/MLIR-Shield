func.func @reduce_min_nan_ignore_int(%arg0: tensor<5x4xi8>, %arg1: tensor<5x4xi8>) -> () {
  %5 = tosa.reduce_min %arg0 {axis = 0 : i32, nan_mode = IGNORE} : (tensor<5x4xi8>) -> tensor<1x4xi8>
  return
}
