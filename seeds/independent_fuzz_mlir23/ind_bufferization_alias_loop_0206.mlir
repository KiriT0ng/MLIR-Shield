func.func @ind_bufferization_alias_loop_206(%arg0: tensor<5xf32>) -> tensor<5xf32> {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c5 = arith.constant 5 : index
  %init = tensor.empty() : tensor<5xf32>
  %out = scf.for %iv = %c0 to %c5 step %c1 iter_args(%iter = %init) -> (tensor<5xf32>) {
    %v = tensor.extract %arg0[%iv] : tensor<5xf32>
    %next = tensor.insert %v into %iter[%iv] : tensor<5xf32>
    scf.yield %next : tensor<5xf32>
  }
  return %out : tensor<5xf32>
}
