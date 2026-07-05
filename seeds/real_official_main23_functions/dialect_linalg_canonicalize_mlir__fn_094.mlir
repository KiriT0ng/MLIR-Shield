func.func @negative_unpack_pack_memref_no_canonicalization(%packed: memref<16x8x8x32xf32>, %unpacked: memref<128x256xf32>, %dest: memref<16x8x8x32xf32>) {
  linalg.unpack %packed inner_dims_pos = [0, 1] inner_tiles = [8, 32] into %unpacked : memref<16x8x8x32xf32> -> memref<128x256xf32>
  linalg.pack %unpacked inner_dims_pos = [0, 1] inner_tiles = [8, 32] into %dest : memref<128x256xf32> -> memref<16x8x8x32xf32>
  return
}
