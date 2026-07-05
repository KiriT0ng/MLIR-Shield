func.func @simplify_gpu_launch() attributes {llvm.emit_c_interface} {
  %cst = arith.constant 0.000000e+00 : f32
  %c1 = arith.constant 1 : index
  %c32 = arith.constant 32 : index
  %c16 = arith.constant 16 : index
  %c2 = arith.constant 2 : index
  %c0 = arith.constant 0 : index
  %0 = memref.alloc() : memref<2x16x16xf32>
  scf.for %arg0 = %c0 to %c2 step %c1 {
    scf.for %arg1 = %c0 to %c16 step %c1 {
      scf.for %arg2 = %c0 to %c16 step %c1 {
        memref.store %cst, %0[%arg0, %arg1, %arg2] : memref<2x16x16xf32>
      }
    }
  }
  %1 = gpu.wait async
  %memref, %asyncToken = gpu.alloc async [%1] () : memref<2x16x16xf32>
  %2 = gpu.memcpy async [%1] %memref, %0 : memref<2x16x16xf32>, memref<2x16x16xf32>
  gpu.wait [%1]
  gpu.launch blocks(%arg0, %arg1, %arg2) in (%arg6 = %c1, %arg7 = %c1, %arg8 = %c1)
    threads(%arg3, %arg4, %arg5) in (%arg9 = %c32, %arg10 = %c1, %arg11 = %c1) {
    %3 = arith.muli %arg5, %c32 : index
    %4 = arith.muli %arg4, %c32 : index
    %5 = arith.addi %3, %4 : index
    %6 = arith.addi %5, %arg3 : index
    %7 = arith.divui %6, %c32 : index
    %8 = arith.muli %arg0, %c16 : index
    %9 = arith.muli %arg1, %c2 : index
    %10 = arith.muli %7, %c2 : index
    %11 = arith.addi %9, %10 : index
    %12 = memref.load %memref[%11, %c0, %8] : memref<2x16x16xf32>
    %13 = arith.addi %11, %c1 : index
    %14 = memref.load %memref[%13, %c0, %8] : memref<2x16x16xf32>
    memref.store %12, %memref[%11, %c0, %8] : memref<2x16x16xf32>
    memref.store %14, %memref[%13, %c0, %8] : memref<2x16x16xf32>
    gpu.terminator
  }
  return
}
