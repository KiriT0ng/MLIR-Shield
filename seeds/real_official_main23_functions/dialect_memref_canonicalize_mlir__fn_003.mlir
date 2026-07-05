func.func @subview_of_size_memcast(%arg : memref<4x6x16x32xi8>) ->
  memref<16x32xi8, strided<[32, 1], offset: 512>>{
  %0 = memref.cast %arg : memref<4x6x16x32xi8> to memref<?x?x16x32xi8>
  %1 = memref.subview %0[0, 1, 0, 0] [1, 1, 16, 32] [1, 1, 1, 1] :
    memref<?x?x16x32xi8> to
    memref<16x32xi8, strided<[32, 1], offset: 512>>
  return %1 : memref<16x32xi8, strided<[32, 1], offset: 512>>
}
