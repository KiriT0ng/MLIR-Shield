func.func @dim_of_alloca_with_dynamic_size(%arg0: memref<*xf32>) -> index {
  %0 = memref.rank %arg0 : memref<*xf32>
  %1 = memref.alloca(%0) : memref<?xindex>
  %c0 = arith.constant 0 : index
  %2 = memref.dim %1, %c0 : memref<?xindex>
  return %2 : index
}
