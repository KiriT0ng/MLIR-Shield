func.func @memref_copy_ranked() {
  %0 = memref.alloc() : memref<2xf32>
  %1 = memref.cast %0 : memref<2xf32> to memref<?xf32>
  %2 = memref.alloc() : memref<2xf32>
  %3 = memref.cast %2 : memref<2xf32> to memref<?xf32>
  memref.copy %1, %3 : memref<?xf32> to memref<?xf32>
  return
}
