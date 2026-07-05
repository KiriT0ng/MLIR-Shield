func.func @fill_pack_general() -> tensor<1x1x8x4x4x8xi32>{
  %c0_i32 = arith.constant 0 : i32
  %alloc = memref.alloc() : memref<1x1x8x4x4x8xi32>
  %9 = tensor.empty() : tensor<1x1x16x64xi32>
  %extracted_slice_15 = tensor.extract_slice %9[0, 0, 0, 0] [1, 1, 16, 64] [1, 1, 1, 1] : tensor<1x1x16x64xi32> to tensor<1x1x16x64xi32>
  %16 = linalg.fill ins(%c0_i32 : i32) outs(%extracted_slice_15 : tensor<1x1x16x64xi32>) -> tensor<1x1x16x64xi32>
  %0 = bufferization.to_tensor %alloc restrict writable : memref<1x1x8x4x4x8xi32> to tensor<1x1x8x4x4x8xi32>
  %pack_18 = linalg.pack %16 outer_dims_perm = [0, 1, 3, 2] inner_dims_pos = [2, 3] inner_tiles = [4, 8] into %0 : tensor<1x1x16x64xi32> -> tensor<1x1x8x4x4x8xi32>
  return %pack_18 : tensor<1x1x8x4x4x8xi32>
}
