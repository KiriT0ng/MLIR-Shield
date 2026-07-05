func.func @empty_tensor_canonicalize(%i : index) {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index

  %0 = tensor.empty(%i) : tensor<?x42xf32>

  %1 = tensor.dim %0, %c0: tensor<?x42xf32>
  %2 = tensor.dim %0, %c1: tensor<?x42xf32>

  call @some_use(%1, %2) : (index, index) -> ()

  return
}
