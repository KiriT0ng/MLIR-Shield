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
func.func @sparse_indices_coo(%arg0: tensor<?x?x?xf64, #ccoo>) -> memref<?xindex, strided<[?], offset: ?>> {
  %0 = sparse_tensor.coordinates  %arg0 { level = 1 : index } : tensor<?x?x?xf64, #ccoo> to memref<?xindex, strided<[?], offset: ?>>
  return %0 : memref<?xindex, strided<[?], offset: ?>>
}
