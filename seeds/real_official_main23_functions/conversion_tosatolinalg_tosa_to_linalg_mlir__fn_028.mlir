func.func @reduce_bf16(%arg0: tensor<5x4xbf16>) -> () {
  %0 = tosa.reduce_sum %arg0 {axis = 0 : i32} : (tensor<5x4xbf16>) -> tensor<1x4xbf16>
  return
}
