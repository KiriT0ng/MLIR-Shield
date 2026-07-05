func.func @orig_scf_loop_106(%lb: index, %ub: index, %step: index, %init: tensor<4xf32>) -> tensor<4xf32> {
  %r = scf.for %i = %lb to %ub step %step iter_args(%acc = %init) -> (tensor<4xf32>) {
    %next = tensor.insert_slice %acc into %acc[0] [4] [1] : tensor<4xf32> into tensor<4xf32>
    scf.yield %next : tensor<4xf32>
  }
  return %r : tensor<4xf32>
}
