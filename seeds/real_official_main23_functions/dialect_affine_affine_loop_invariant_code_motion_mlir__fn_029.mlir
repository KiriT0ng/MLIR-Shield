func.func @affine_prefetch_invariant() {
  %0 = memref.alloc() : memref<10x10xf32>
  affine.for %i0 = 0 to 10 {
    affine.for %i1 = 0 to 10 {
      %1 = affine.load %0[%i0, %i1] : memref<10x10xf32>
      // A prefetch shouldn't be hoisted.
      affine.prefetch %0[%i0, %i0], write, locality<0>, data : memref<10x10xf32>
    }
  }

  return
}
