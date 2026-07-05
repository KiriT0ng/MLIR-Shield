func.func @ind_bufferization_alias_loop_306(%arg0: tensor<3xf32>) -> tensor<3xf32> {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c3 = arith.constant 3 : index
  %init = tensor.empty() : tensor<3xf32>
  %out = scf.for %iv = %c0 to %c3 step %c1 iter_args(%iter = %init) -> (tensor<3xf32>) {
    %v = tensor.extract %arg0[%iv] : tensor<3xf32>
    %next = tensor.insert %v into %iter[%iv] : tensor<3xf32>
    scf.yield %next : tensor<3xf32>
  }
  return %out : tensor<3xf32>
}
