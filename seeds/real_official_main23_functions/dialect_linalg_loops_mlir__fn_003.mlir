func.func @dot_int(%arg0: memref<?xi32>, %arg1: memref<?xi32>,
                   %arg3: memref<i32>) {
  // Verifies that we use the correct arith operations for integers.
  linalg.dot ins(%arg0, %arg1 : memref<?xi32>, memref<?xi32>)
             outs(%arg3 : memref<i32>)
  return
}
