func.func @vector_loop_nothing_invariant() {
  %m1 = memref.alloc() : memref<40xf32>
  %m2 = memref.alloc() : memref<40xf32>
  affine.for %arg0 = 0 to 10 {
    %v0 = affine.vector_load %m1[%arg0*4] : memref<40xf32>, vector<4xf32>
    %v1 = affine.vector_load %m2[%arg0*4] : memref<40xf32>, vector<4xf32>
    %v2 = arith.addf %v0, %v1 : vector<4xf32>
    affine.vector_store %v2, %m1[%arg0*4] : memref<40xf32>, vector<4xf32>
  }
  return
}
