func.func @fold_abs_abs(%arg0: tensor<?x1xf32>) -> tensor<?x1xf32> {
  %0 = tosa.abs %arg0 : (tensor<?x1xf32>) -> tensor<?x1xf32>
  %1 = tosa.abs %0 : (tensor<?x1xf32>) -> tensor<?x1xf32>
  return %1 : tensor<?x1xf32>
}
