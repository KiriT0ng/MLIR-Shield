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
func.func @sparse_insert_typed(%arg0: tensor<128xf64, #SparseVector>, %arg1: index, %arg2: f64) -> tensor<128xf64, #SparseVector> {
  %0 = tensor.insert %arg2 into %arg0[%arg1] : tensor<128xf64, #SparseVector>
  %1 = sparse_tensor.load %0 hasInserts : tensor<128xf64, #SparseVector>
  return %1 : tensor<128xf64, #SparseVector>
}
