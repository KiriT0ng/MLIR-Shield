func.func @fold_wait_op_test2(%arg0: i1) -> (memref<5xf16>, memref<5xf16>) {
  %0 = gpu.wait async
  %memref, %asyncToken = gpu.alloc async [%0] () : memref<5xf16>
  gpu.wait [%0]
  %1 = gpu.wait async [%0]
  %memref_0, %asyncToken_0 = gpu.alloc async [%1] () : memref<5xf16>
  gpu.wait [%1]
  return %memref, %memref_0 : memref<5xf16>, memref<5xf16>
}
