#SV = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>

#SparseVector = #sparse_tensor.encoding<{
  map = (d0) -> (d0 : compressed),
  crdWidth = 64,
  posWidth = 32
}>

#Dense2D = #sparse_tensor.encoding<{
  map = (d0, d1) -> (d0 : dense, d1 : dense),
  crdWidth = 64,
  posWidth = 32
}>

#Row = #sparse_tensor.encoding<{
  map = (d0, d1) -> (d0 : compressed, d1 : dense),
  crdWidth = 64,
  posWidth = 32
}>

#CSR = #sparse_tensor.encoding<{
  map = (d0, d1) -> (d0 : dense, d1 : compressed),
  crdWidth = 64,
  posWidth = 32
}>

#UCSR = #sparse_tensor.encoding<{
  map = (d0, d1) -> (d0 : dense, d1 : compressed(nonordered))
}>

#CSC = #sparse_tensor.encoding<{
  map = (d0, d1) -> (d1 : dense, d0 : compressed)
}>

#BCSR = #sparse_tensor.encoding<{
  map = (d0, d1, d2, d3) -> (d0: batch, d1: batch, d2 : dense, d3 : compressed)
}>

#DCSR = #sparse_tensor.encoding<{
  map = (d0, d1) -> (d0 : compressed, d1 : compressed),
  crdWidth = 64,
  posWidth = 32
}>

#Dense3D = #sparse_tensor.encoding<{
  map = (d0, d1, d2) -> (d2 : dense, d0 : dense, d1 : dense)
}>

#Coo = #sparse_tensor.encoding<{
  map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton)
}>

#SoACOO = #sparse_tensor.encoding<{
  map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa))
}>

#CooPNo = #sparse_tensor.encoding<{
  map = (d0, d1) -> (d1 : compressed(nonunique), d0 : singleton(nonordered))
}>

#ccoo = #sparse_tensor.encoding<{
  map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed(nonunique), d2 : singleton)
}>

func.func @sparse_nop(%arg0: tensor<?xf64, #SparseVector>) -> tensor<?xf64, #SparseVector> {
  return %arg0 : tensor<?xf64, #SparseVector>
}

func.func @sparse_nop_aos_coo(%arg0: tensor<?x?xf64, #Coo>) -> tensor<?x?xf64, #Coo> {
  return %arg0 : tensor<?x?xf64, #Coo>
}

func.func @sparse_nop_soa_coo(%arg0: tensor<?x?xf64, #SoACOO>) -> tensor<?x?xf64, #SoACOO> {
  return %arg0 : tensor<?x?xf64, #SoACOO>
}


func.func @sparse_nop_multi_ret(%arg0: tensor<?xf64, #SparseVector>,
                                %arg1: tensor<?xf64, #SparseVector>) ->
                                (tensor<?xf64, #SparseVector>, tensor<?xf64, #SparseVector>) {
  return %arg0, %arg1 : tensor<?xf64, #SparseVector>, tensor<?xf64, #SparseVector>
}

func.func @sparse_nop_call(%arg0: tensor<?xf64, #SparseVector>,
                           %arg1: tensor<?xf64, #SparseVector>) ->
                           (tensor<?xf64, #SparseVector>, tensor<?xf64, #SparseVector>) {
  %1, %2 = call @sparse_nop_multi_ret(%arg0, %arg1) :
                           (tensor<?xf64, #SparseVector>, tensor<?xf64, #SparseVector>) ->
                           (tensor<?xf64, #SparseVector>, tensor<?xf64, #SparseVector>)
  return %1, %2: tensor<?xf64, #SparseVector>, tensor<?xf64, #SparseVector>
}

func.func @sparse_nop_cast(%arg0: tensor<64xf32, #SparseVector>) -> tensor<?xf32, #SparseVector> {
  %0 = tensor.cast %arg0 : tensor<64xf32, #SparseVector> to tensor<?xf32, #SparseVector>
  return %0 : tensor<?xf32, #SparseVector>
}

func.func @sparse_nop_cast_3d(%arg0: tensor<10x20x30xf32, #Dense3D>) -> tensor<?x?x?xf32, #Dense3D> {
  %0 = tensor.cast %arg0 : tensor<10x20x30xf32, #Dense3D> to tensor<?x?x?xf32, #Dense3D>
  return %0 : tensor<?x?x?xf32, #Dense3D>
}

func.func @sparse_dense_2d(%arg0: tensor<?x?xf64, #Dense2D>) {
  return
}

func.func @sparse_row(%arg0: tensor<?x?xf64, #Row>) {
  return
}

func.func @sparse_csr(%arg0: tensor<?x?xf64, #CSR>) {
  return
}

func.func @sparse_bcsr_0(%arg0: tensor<?x2x?x?xf64, #BCSR>) {
  return
}

func.func @sparse_bcsr_1(%arg0: tensor<?x?x?x?xf64, #BCSR>) {
  return
}

func.func @sparse_bcsr_2(%arg0: tensor<18x6x4x2xf64, #BCSR>) {
  return
}

func.func @sparse_dcsr(%arg0: tensor<?x?xf64, #DCSR>) {
  return
}

//
// Querying for dimension 1 in the tensor type can immediately
// fold using the original static dimension sizes.
//
func.func @sparse_dense_3d(%arg0: tensor<10x20x30xf64, #Dense3D>) -> index {
  %c = arith.constant 1 : index
  %0 = tensor.dim %arg0, %c : tensor<10x20x30xf64, #Dense3D>
  return %0 : index
}

//
// Querying for dimension 1 in the tensor type needs to be permuted
// into querying for dimension 2 in the stored sparse tensor scheme,
// since the latter honors the dimToLvl mapping.
//
func.func @sparse_dense_3d_dyn(%arg0: tensor<?x?x?xf64, #Dense3D>) -> index {
  %c = arith.constant 1 : index
  %0 = tensor.dim %arg0, %c : tensor<?x?x?xf64, #Dense3D>
  return %0 : index
}

func.func @sparse_positions_dcsr(%arg0: tensor<?x?xf64, #DCSR>) -> memref<?xi32> {
  %0 = sparse_tensor.positions %arg0 { level = 1 : index } : tensor<?x?xf64, #DCSR> to memref<?xi32>
  return %0 : memref<?xi32>
}

func.func @sparse_indices_dcsr(%arg0: tensor<?x?xf64, #DCSR>) -> memref<?xi64> {
  %0 = sparse_tensor.coordinates %arg0 { level = 1 : index } : tensor<?x?xf64, #DCSR> to memref<?xi64>
  return %0 : memref<?xi64>
}

func.func @sparse_values_dcsr(%arg0: tensor<?x?xf64, #DCSR>) -> memref<?xf64> {
  %0 = sparse_tensor.values %arg0 : tensor<?x?xf64, #DCSR> to memref<?xf64>
  return %0 : memref<?xf64>
}

func.func @sparse_values_coo(%arg0: tensor<?x?x?xf64, #ccoo>) -> memref<?xf64> {
  %0 = sparse_tensor.values %arg0 : tensor<?x?x?xf64, #ccoo> to memref<?xf64>
  return %0 : memref<?xf64>
}

func.func @sparse_indices_coo(%arg0: tensor<?x?x?xf64, #ccoo>) -> memref<?xindex, strided<[?], offset: ?>> {
  %0 = sparse_tensor.coordinates  %arg0 { level = 1 : index } : tensor<?x?x?xf64, #ccoo> to memref<?xindex, strided<[?], offset: ?>>
  return %0 : memref<?xindex, strided<[?], offset: ?>>
}

func.func @sparse_indices_buffer_coo(%arg0: tensor<?x?x?xf64, #ccoo>) -> memref<?xindex> {
  %0 = sparse_tensor.coordinates_buffer  %arg0 : tensor<?x?x?xf64, #ccoo> to memref<?xindex>
  return %0 : memref<?xindex>
}

func.func @sparse_noe(%arg0: tensor<128xf64, #SparseVector>) -> index {
  %0 = sparse_tensor.number_of_entries %arg0 : tensor<128xf64, #SparseVector>
  return %0 : index
}

func.func @sparse_dealloc_csr(%arg0: tensor<?x?xf64, #CSR>) {
  bufferization.dealloc_tensor %arg0 : tensor<?x?xf64, #CSR>
  return
}

func.func @sparse_alloc_csc(%arg0: index) -> tensor<10x?xf64, #CSC> {
  %0 = tensor.empty(%arg0) : tensor<10x?xf64, #CSC>
  %1 = sparse_tensor.load %0 : tensor<10x?xf64, #CSC>
  return %1 : tensor<10x?xf64, #CSC>
}

func.func @sparse_alloc_3d() -> tensor<10x20x30xf64, #Dense3D> {
  %0 = tensor.empty() : tensor<10x20x30xf64, #Dense3D>
  %1 = sparse_tensor.load %0 : tensor<10x20x30xf64, #Dense3D>
  return %1 : tensor<10x20x30xf64, #Dense3D>
}

func.func @sparse_expansion1() -> memref<?xindex> {
  %0 = tensor.empty() : tensor<4x8xf64, #CSR>
  %values, %filled, %added, %count = sparse_tensor.expand %0
    : tensor<4x8xf64, #CSR> to memref<?xf64>, memref<?xi1>, memref<?xindex>
  return %added : memref<?xindex>
}

func.func @sparse_expansion2() -> memref<?xindex> {
  %0 = tensor.empty() : tensor<4x8xf64, #CSC>
  %values, %filled, %added, %count = sparse_tensor.expand %0
    : tensor<4x8xf64, #CSC> to memref<?xf64>, memref<?xi1>, memref<?xindex>
  return %added : memref<?xindex>
}

func.func @sparse_expansion3(%arg0: index, %arg1: index) -> memref<?xindex> {
  %0 = tensor.empty(%arg0, %arg1) : tensor<?x?xf64, #CSC>
  %values, %filled, %added, %count = sparse_tensor.expand %0
    : tensor<?x?xf64, #CSC> to memref<?xf64>, memref<?xi1>, memref<?xindex>
  return %added : memref<?xindex>
}

//
func.func @sparse_compression_1d(%tensor: tensor<100xf64, #SV>,
                                 %values: memref<?xf64>,
                                 %filled: memref<?xi1>,
                                 %added: memref<?xindex>,
                                 %count: index) -> tensor<100xf64, #SV> {
  %0 = sparse_tensor.compress %values, %filled, %added, %count into %tensor[]
    : memref<?xf64>, memref<?xi1>, memref<?xindex>, tensor<100xf64, #SV>
  %1 = sparse_tensor.load %0 hasInserts : tensor<100xf64, #SV>
  return %1 : tensor<100xf64, #SV>
}

//
func.func @sparse_compression(%tensor: tensor<8x8xf64, #CSR>,
                              %values: memref<?xf64>,
                              %filled: memref<?xi1>,
                              %added: memref<?xindex>,
                              %count: index,
                              %i: index) -> tensor<8x8xf64, #CSR> {
  %0 = sparse_tensor.compress %values, %filled, %added, %count into %tensor[%i]
    : memref<?xf64>, memref<?xi1>, memref<?xindex>, tensor<8x8xf64, #CSR>
  %1 = sparse_tensor.load %0 hasInserts : tensor<8x8xf64, #CSR>
  return %1 : tensor<8x8xf64, #CSR>
}

//
func.func @sparse_compression_unordered(%tensor: tensor<8x8xf64, #UCSR>,
                                        %values: memref<?xf64>,
                                        %filled: memref<?xi1>,
                                        %added: memref<?xindex>,
                                        %count: index,
                                        %i: index) -> tensor<8x8xf64, #UCSR> {
  %0 = sparse_tensor.compress %values, %filled, %added, %count into %tensor[%i]
    : memref<?xf64>, memref<?xi1>, memref<?xindex>, tensor<8x8xf64, #UCSR>
  %1 = sparse_tensor.load %0 hasInserts : tensor<8x8xf64, #UCSR>
  return %1 : tensor<8x8xf64, #UCSR>
}

//
func.func @sparse_insert(%arg0: tensor<128xf64, #SV>, %arg1: index, %arg2: f64) -> tensor<128xf64, #SV> {
  %0 = tensor.insert %arg2 into %arg0[%arg1] : tensor<128xf64, #SV>
  %1 = sparse_tensor.load %0 hasInserts : tensor<128xf64, #SV>
  return %1 : tensor<128xf64, #SV>
}

//
func.func @sparse_insert_typed(%arg0: tensor<128xf64, #SparseVector>, %arg1: index, %arg2: f64) -> tensor<128xf64, #SparseVector> {
  %0 = tensor.insert %arg2 into %arg0[%arg1] : tensor<128xf64, #SparseVector>
  %1 = sparse_tensor.load %0 hasInserts : tensor<128xf64, #SparseVector>
  return %1 : tensor<128xf64, #SparseVector>
}

//
func.func @sparse_insert_coo(%arg0: tensor<5x6xf64, #Coo>, %arg1: index, %arg2: f64) -> tensor<5x6xf64, #Coo> {
  %0 = tensor.insert %arg2 into %arg0[%arg1, %arg1] : tensor<5x6xf64, #Coo>
  %1 = sparse_tensor.load %0 hasInserts : tensor<5x6xf64, #Coo>
  return %1 : tensor<5x6xf64, #Coo>
}

func.func @sparse_nop_convert(%arg0: tensor<32xf32, #SparseVector>) -> tensor<?xf32, #SparseVector> {
  %0 = sparse_tensor.convert %arg0 : tensor<32xf32, #SparseVector> to tensor<?xf32, #SparseVector>
  return %0 : tensor<?xf32, #SparseVector>
}

func.func @sparse_convert_element_type(%arg0: tensor<32xf32, #SparseVector>) -> tensor<?xi32, #SparseVector> {
  %0 = sparse_tensor.convert %arg0 : tensor<32xf32, #SparseVector> to tensor<?xi32, #SparseVector>
  return %0 : tensor<?xi32, #SparseVector>
}

func.func @sparse_new_coo(%arg0: !llvm.ptr) -> tensor<?x?xf32, #Coo> {
  %0 = sparse_tensor.new %arg0 : !llvm.ptr to tensor<?x?xf32, #Coo>
  return %0 : tensor<?x?xf32, #Coo>
}

func.func @sparse_new_coo_permute_no(%arg0: !llvm.ptr) -> tensor<?x?xf32, #CooPNo> {
  %0 = sparse_tensor.new %arg0 : !llvm.ptr to tensor<?x?xf32, #CooPNo>
  return %0 : tensor<?x?xf32, #CooPNo>
}
