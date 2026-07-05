func.func @matmul_on_tensors(%t0: tensor<32x1024xf32>) -> tensor<?x?xf32> {
  %c0 = arith.constant 0 : index
  %c32 = arith.constant 32 : index
  %c1024 = arith.constant 1024 : index
  %0 = tensor.cast %t0 : tensor<32x1024xf32> to tensor<?x?xf32>
  %1 = scf.for %i = %c0 to %c1024 step %c32 iter_args(%iter_t0 = %0) -> (tensor<?x?xf32>) {
    %2 = func.call @do(%iter_t0) : (tensor<?x?xf32>) -> tensor<?x?xf32>
    scf.yield %2 : tensor<?x?xf32>
  } {some_attr}
  return %1 : tensor<?x?xf32>
}
