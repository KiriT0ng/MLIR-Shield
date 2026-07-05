func.func @fold_trivial_memory_space_cast(%arg : memref<?xf32>) -> memref<?xf32> {
  %0 = memref.memory_space_cast %arg : memref<?xf32> to memref<?xf32>
  return %0 : memref<?xf32>
}
