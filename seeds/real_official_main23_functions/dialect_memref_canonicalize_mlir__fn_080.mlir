func.func @fold_multiple_memory_space_cast(%arg : memref<?xf32>) -> memref<?xf32, 2> {
  %0 = memref.memory_space_cast %arg : memref<?xf32> to memref<?xf32, 1>
  %1 = memref.memory_space_cast %0 : memref<?xf32, 1> to memref<?xf32, 2>
  return %1 : memref<?xf32, 2>
}
