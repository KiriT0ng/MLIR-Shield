func.func @clamp_nan_ignore_int(%arg0: tensor<5x4xi8>, %arg1: tensor<5x4xi8>) -> () {
  %14 = tosa.clamp %arg0 {min_val = 1 : i8, max_val = 5 : i8, nan_mode = IGNORE} : (tensor<5x4xi8>) -> tensor<5x4xi8>
  return
}
