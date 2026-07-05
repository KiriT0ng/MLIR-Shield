func.func @dim_of_memref_reshape_block_arg_index(%arg0: memref<*xf32>, %arg1: memref<?xindex>, %arg2: index) -> index {
  %reshape = memref.reshape %arg0(%arg1) : (memref<*xf32>, memref<?xindex>) -> memref<*xf32>
  %dim = memref.dim %reshape, %arg2 : memref<*xf32>
  return %dim : index
}
