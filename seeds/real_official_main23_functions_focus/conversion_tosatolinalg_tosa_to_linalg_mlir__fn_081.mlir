func.func @minimum_nan_ignore_int(%arg0: tensor<5x4xi8>, %arg1: tensor<5x4xi8>) -> () {
  %9 = tosa.minimum %arg0, %arg1 {nan_mode = IGNORE} : (tensor<5x4xi8>, tensor<5x4xi8>) -> tensor<5x4xi8>
  return
}
