func.func @negative_pack_unpack_memref_no_canonicalization(%source: memref<128x256xf32>, %packed: memref<16x8x8x32xf32>, %dest: memref<128x256xf32>) {
  linalg.pack %source inner_dims_pos = [0, 1] inner_tiles = [8, 32] into %packed : memref<128x256xf32> -> memref<16x8x8x32xf32>
  linalg.unpack %packed inner_dims_pos = [0, 1] inner_tiles = [8, 32] into %dest : memref<16x8x8x32xf32> -> memref<128x256xf32>
  return
}
