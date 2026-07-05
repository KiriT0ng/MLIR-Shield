func.func @empty_copy(%m1: memref<0x10xf32>, %m2: memref<?x10xf32>) {
  memref.copy %m1, %m2 : memref<0x10xf32> to memref<?x10xf32>
  memref.copy %m2, %m1 : memref<?x10xf32> to memref<0x10xf32>
  return
}
