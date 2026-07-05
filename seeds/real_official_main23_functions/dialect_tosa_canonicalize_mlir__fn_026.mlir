func.func @disjoint_clamp_twice_is_not_single_clamp(%arg0: tensor<4xi8>) -> tensor<4xi8> {
  %0 = tosa.clamp %arg0 {max_val = -5 : i8, min_val = -10 : i8} :  (tensor<4xi8>) -> tensor<4xi8>
  %1 = tosa.clamp %0 {max_val = 5 : i8, min_val = 1 : i8} :  (tensor<4xi8>) -> tensor<4xi8>
  return %1 : tensor<4xi8>
}
