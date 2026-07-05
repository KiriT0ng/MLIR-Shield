func.func @reinterpret_noop(%arg : memref<2x3x4xf32>) -> memref<2x3x4xf32> {
  %0 = memref.reinterpret_cast %arg to offset: [0], sizes: [2, 3, 4], strides: [12, 4, 1] : memref<2x3x4xf32> to memref<2x3x4xf32>
  return %0 : memref<2x3x4xf32>
}
