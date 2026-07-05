#SV = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>

func.func @empty_sparse_vector(%arg0: index) -> tensor<?xf64, #SV> {
  %0 = tensor.empty(%arg0) : tensor<?xf64, #SV>
  %1 = sparse_tensor.load %0 : tensor<?xf64, #SV>
  return %1 : tensor<?xf64, #SV>
}
