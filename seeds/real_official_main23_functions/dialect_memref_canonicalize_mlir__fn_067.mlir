func.func @reinterpret_of_extract_strided_metadata_same_type(%arg0 : memref<?x?xf32, strided<[?,?], offset: ?>>) -> memref<?x?xf32, strided<[?,?], offset: ?>> {
  %base, %offset, %sizes:2, %strides:2 = memref.extract_strided_metadata %arg0 : memref<?x?xf32, strided<[?,?], offset: ?>> -> memref<f32>, index, index, index, index, index
  %m2 = memref.reinterpret_cast %base to offset: [%offset], sizes: [%sizes#0, %sizes#1], strides: [%strides#0, %strides#1] : memref<f32> to memref<?x?xf32, strided<[?,?], offset:?>>
  return %m2 : memref<?x?xf32, strided<[?,?], offset:?>>
}
