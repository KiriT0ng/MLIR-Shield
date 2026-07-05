func.func @vec_non_scalar_type() {
  %idx0 = index.constant 0
  %alloc_82 = memref.alloc() : memref<1xi64>
  affine.for %arg0 = 0 to 78 {
    %dim_191 = memref.dim %alloc_82, %idx0 : memref<1xi64>
  }
  return
}
