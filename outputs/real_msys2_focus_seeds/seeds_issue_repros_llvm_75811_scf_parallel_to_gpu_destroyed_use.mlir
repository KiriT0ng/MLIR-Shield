// Source: https://github.com/llvm/llvm-project/issues/75811
// Command from issue:
// mlir-opt -convert-parallel-loops-to-gpu tmp3.mlir
module {
  func.func @main() {
    %alloc = memref.alloc() : memref<1x1xf64>
    %alloc_1 = memref.alloc() : memref<1x1xf64>
    %alloc_2 = memref.alloc() : memref<1x1xf64>
    %c0_6 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c1_7 = arith.constant 1 : index
    scf.parallel (%arg0) = (%c0_6) to (%c1) step (%c1_7) {
      %c0_8 = arith.constant 0 : index
      %c1_9 = arith.constant 1 : index
      %c1_10 = arith.constant 1 : index
      scf.parallel (%arg1) = (%c0_8) to (%c1_9) step (%c1_10) {
        %0 = memref.load %alloc_2[%arg0, %arg1] : memref<1x1xf64>
        %1 = memref.load %alloc_1[%arg0, %arg1] : memref<1x1xf64>
        %2 = arith.addf %0, %1 : f64
        memref.store %2, %alloc[%arg0, %arg1] : memref<1x1xf64>
        scf.yield
      } {mapping = [#gpu.loop_dim_map<processor = thread_x, map = (d0) -> (d0), bound = (d0) -> (d0)>]}
      scf.yield
    } {mapping = [#gpu.loop_dim_map<processor = block_x, map = (d0) -> (d0), bound = (d0) -> (d0)>]}
    memref.dealloc %alloc_2 : memref<1x1xf64>
    memref.dealloc %alloc_1 : memref<1x1xf64>
    memref.dealloc %alloc : memref<1x1xf64>
    return
  }
}
