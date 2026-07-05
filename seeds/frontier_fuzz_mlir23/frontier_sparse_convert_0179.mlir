#SV = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
func.func @frontier_sparse_convert_179(%arg0: tensor<11xf32, #SV>) -> tensor<?xf32, #SV> {
  %0 = sparse_tensor.convert %arg0 : tensor<11xf32, #SV> to tensor<?xf32, #SV>
  return %0 : tensor<?xf32, #SV>
}
