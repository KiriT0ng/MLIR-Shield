func.func @cmpi_dynamic_shape_no_fold(%arg0: tensor<?xi32>) -> tensor<?xi1> {
  %0 = arith.cmpi eq, %arg0, %arg0 : tensor<?xi32>
  return %0 : tensor<?xi1>
}
