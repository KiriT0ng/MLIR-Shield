func.func @memcpy_after_cast(%arg0: memref<10xf32>, %arg1: memref<10xf32>) {
  %0 = memref.cast %arg0 : memref<10xf32> to memref<?xf32>
  %1 = memref.cast %arg1 : memref<10xf32> to memref<?xf32>
  gpu.memcpy %0, %1 : memref<?xf32>, memref<?xf32>
  return
}
