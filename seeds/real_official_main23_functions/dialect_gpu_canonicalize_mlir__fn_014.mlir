func.func @do_not_fold_memcpy_op2(%arg0: i1, %arg1: index) -> f16 {
    %cst = arith.constant 0.000000e+00 : f16
    %1 = memref.alloc() : memref<2xf16>
    %2 = gpu.wait async
    %memref, %asyncToken = gpu.alloc async [%2] () : memref<2xf16>
    gpu.wait [%2]
    affine.store %cst, %memref[0] : memref<2xf16>
    %3 = gpu.wait async
    %4 = gpu.memcpy async [%3] %1, %memref : memref<2xf16>, memref<2xf16>
    gpu.wait [%3]
    %5 = memref.load %1[%arg1] : memref<2xf16>
    return %5 : f16
}
