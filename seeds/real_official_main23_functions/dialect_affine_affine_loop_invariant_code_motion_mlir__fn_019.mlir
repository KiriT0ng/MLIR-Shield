func.func @nested_load_store_same_memref2() {
  %m = memref.alloc() : memref<10xf32>
  %cst = arith.constant 8.0 : f32
  %c0 = arith.constant 0 : index
   affine.for %arg0 = 0 to 10 {
     affine.store %cst, %m[%c0] : memref<10xf32>
      affine.for %arg1 = 0 to 10 {
        %v0 = affine.load %m[%arg0] : memref<10xf32>
    }
  }



  return
}
