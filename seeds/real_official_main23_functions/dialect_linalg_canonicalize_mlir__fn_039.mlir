func.func @linalgop_with_cond_cast_consumer(%arg0 : tensor<?x?xf32>, %arg1 : tensor<?x?xf32>,
    %arg2 : tensor<?x?xf32>, %arg3 : i1) -> tensor<?x?xf32> {
  %0 = linalg.matmul ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>)
      outs(%arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
  scf.if %arg3 {
    %1 = tensor.cast %0 : tensor<?x?xf32> to tensor<4x8xf32>
    func.call @some_use(%1) : (tensor<4x8xf32>) -> ()
  }
  return %0 : tensor<?x?xf32>
}
