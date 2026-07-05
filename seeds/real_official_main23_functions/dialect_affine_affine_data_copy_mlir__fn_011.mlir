#id = affine_map<(d0) -> (d0)>
#ub = affine_map<(d0) -> (d0 + 128)>
func.func @memref_def_inside(%arg0: index) {
  %0 = llvm.mlir.constant(1.000000e+00 : f32) : f32
  // No copy generation can happen at this depth given the definition inside.
  affine.for %arg1 = 0 to 29 {
    %alloc_7 = memref.alloc() : memref<1xf32>
    affine.store %0, %alloc_7[0] : memref<1xf32>
  }

  // With the limited capacity specified, buffer generation happens at the
  // innermost depth. Tests that copy-placement is proper and respects the
  // memref definition.

  return
}
