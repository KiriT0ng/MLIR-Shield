func.func @invariant_constant_and_load() {
  %m = memref.alloc() : memref<100xf32>
  %m2 = memref.alloc() : memref<100xf32>
  affine.for %arg0 = 0 to 5 {
    %c0 = arith.constant 0 : index
    %v = affine.load %m2[%c0] : memref<100xf32>
    affine.store %v, %m[%arg0] : memref<100xf32>
  }



  return
}
