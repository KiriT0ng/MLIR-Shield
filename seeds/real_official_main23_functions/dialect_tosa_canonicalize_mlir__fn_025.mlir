func.func @clamp_twice_is_single_clamp(%arg0: tensor<4xi8>) -> tensor<4xi8> {
  %0 = tosa.clamp %arg0 {max_val = 4 : i8, min_val = -2 : i8} :  (tensor<4xi8>) -> tensor<4xi8>
  %1 = tosa.clamp %0 {max_val = 2 : i8, min_val = -4 : i8} :  (tensor<4xi8>) -> tensor<4xi8>
  return %1 : tensor<4xi8>
}
