func.func @dim_of_memref_reshape_undominated(%arg0: memref<*xf32>, %arg1: memref<?xindex>, %arg2: index) -> index {
    %c4 = arith.constant 4 : index
    %reshape = memref.reshape %arg0(%arg1) : (memref<*xf32>, memref<?xindex>) -> memref<*xf32>
    %0 = arith.muli %arg2, %c4 : index
    %dim = memref.dim %reshape, %0 : memref<*xf32>
    return %dim : index
  }
