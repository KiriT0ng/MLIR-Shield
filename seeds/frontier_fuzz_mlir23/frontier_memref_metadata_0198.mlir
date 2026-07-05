func.func @frontier_memref_metadata_198(%m: memref<?x?xf32, strided<[?, ?], offset: ?>>, %i0: index, %i1: index) -> f32 {
  %base, %offset, %sizes:2, %strides:2 = memref.extract_strided_metadata %m : memref<?x?xf32, strided<[?, ?], offset: ?>> -> memref<f32>, index, index, index, index, index
  %v = memref.load %m[%i0, %i1] : memref<?x?xf32, strided<[?, ?], offset: ?>>
  return %v : f32
}
