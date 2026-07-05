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
func.func @sparse_expansion3(%arg0: index, %arg1: index) -> memref<?xindex> {
  %0 = tensor.empty(%arg0, %arg1) : tensor<?x?xf64, #CSC>
  %values, %filled, %added, %count = sparse_tensor.expand %0
    : tensor<?x?xf64, #CSC> to memref<?xf64>, memref<?xi1>, memref<?xindex>
  return %added : memref<?xindex>
}
