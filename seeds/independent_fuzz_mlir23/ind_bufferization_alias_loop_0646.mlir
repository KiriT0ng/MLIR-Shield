func.func @ind_bufferization_alias_loop_646(%arg0: tensor<7xf32>) -> tensor<7xf32> {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c7 = arith.constant 7 : index
  %init = tensor.empty() : tensor<7xf32>
  %out = scf.for %iv = %c0 to %c7 step %c1 iter_args(%iter = %init) -> (tensor<7xf32>) {
    %v = tensor.extract %arg0[%iv] : tensor<7xf32>
    %next = tensor.insert %v into %iter[%iv] : tensor<7xf32>
    scf.yield %next : tensor<7xf32>
  }
  return %out : tensor<7xf32>
}
