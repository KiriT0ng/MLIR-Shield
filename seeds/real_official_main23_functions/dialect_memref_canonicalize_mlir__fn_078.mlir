func.func @fold_const_splat_global() -> memref<32xf32> {
  %0 = memref.get_global @__constant_32xf32 : memref<32xf32>
  %alloc = memref.alloc() : memref<32xf32>
  %c32 = arith.constant 32 : index
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  scf.for %arg0 = %c0 to %c32 step %c1 {
    %1 = memref.load %0[%arg0] : memref<32xf32>
    memref.store %1, %alloc[%arg0] : memref<32xf32>
  }
  return %alloc : memref<32xf32>
}
