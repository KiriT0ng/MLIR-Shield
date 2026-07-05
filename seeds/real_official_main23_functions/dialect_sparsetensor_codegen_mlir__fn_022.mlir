#SV = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
#SparseVector = #sparse_tensor.encoding<{
#Dense2D = #sparse_tensor.encoding<{
#Row = #sparse_tensor.encoding<{
#CSR = #sparse_tensor.encoding<{
#UCSR = #sparse_tensor.encoding<{
#CSC = #sparse_tensor.encoding<{
#BCSR = #sparse_tensor.encoding<{
#DCSR = #sparse_tensor.encoding<{
#Dense3D = #sparse_tensor.encoding<{
#Coo = #sparse_tensor.encoding<{
#SoACOO = #sparse_tensor.encoding<{
#CooPNo = #sparse_tensor.encoding<{
#ccoo = #sparse_tensor.encoding<{
func.func @sparse_alloc_csc(%arg0: index) -> tensor<10x?xf64, #CSC> {
  %0 = tensor.empty(%arg0) : tensor<10x?xf64, #CSC>
  %1 = sparse_tensor.load %0 : tensor<10x?xf64, #CSC>
  return %1 : tensor<10x?xf64, #CSC>
}
