#Sparse1D = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
func.func @ind_sparse_rank_convert_788(%arg0: tensor<8xf32, #Sparse1D>) -> tensor<?xf32, #Sparse1D> {
  %out = sparse_tensor.convert %arg0 : tensor<8xf32, #Sparse1D> to tensor<?xf32, #Sparse1D>
  return %out : tensor<?xf32, #Sparse1D>
}
