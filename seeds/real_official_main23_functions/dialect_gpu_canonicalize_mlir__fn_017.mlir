func.func @memset_after_cast(%arg0: memref<10xf32>, %arg1: f32) {
  %0 = memref.cast %arg0 : memref<10xf32> to memref<?xf32>
  gpu.memset %0, %arg1 : memref<?xf32>, f32
  return
}
