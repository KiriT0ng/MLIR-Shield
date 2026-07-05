func.func @reduce_float_dyn_rank_1(%arg0: tensor<?xf32>) -> () {
  %0 = tosa.reduce_sum %arg0 {axis = 0 : i32} : (tensor<?xf32>) -> tensor<1xf32>
  return
}
