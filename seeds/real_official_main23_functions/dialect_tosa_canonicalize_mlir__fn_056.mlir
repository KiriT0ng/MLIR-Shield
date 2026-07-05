func.func @reduce_product_fold(%arg0: tensor<?x1xf32>) -> tensor<?x1xf32> {
  %0 = tosa.reduce_product %arg0 {axis = 1 : i32}: (tensor<?x1xf32>) -> tensor<?x1xf32>
  return %0 : tensor<?x1xf32>
}
