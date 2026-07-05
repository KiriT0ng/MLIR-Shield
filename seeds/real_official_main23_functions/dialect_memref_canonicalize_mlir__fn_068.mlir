func.func @reinterpret_of_extract_strided_metadata_w_different_stride(%arg0 : memref<8x2xf32>) -> memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>> {
  %base, %offset, %sizes:2, %strides:2 = memref.extract_strided_metadata %arg0 : memref<8x2xf32> -> memref<f32>, index, index, index, index, index
  %m2 = memref.reinterpret_cast %base to offset: [%offset], sizes: [4, 2, 2], strides: [1, 1, %strides#1] : memref<f32> to memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>
  return %m2 : memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>
}
