func.func @vector_loop_all_invariant() {
  %m1 = memref.alloc() : memref<4xf32>
  %m2 = memref.alloc() : memref<4xf32>
  %m3 = memref.alloc() : memref<4xf32>
  affine.for %arg0 = 0 to 10 {
    %v0 = affine.vector_load %m1[0] : memref<4xf32>, vector<4xf32>
    %v1 = affine.vector_load %m2[0] : memref<4xf32>, vector<4xf32>
    %v2 = arith.addf %v0, %v1 : vector<4xf32>
    affine.vector_store %v2, %m3[0] : memref<4xf32>, vector<4xf32>
  }
  return
}
