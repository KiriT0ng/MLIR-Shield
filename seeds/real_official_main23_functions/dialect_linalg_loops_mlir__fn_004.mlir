func.func @dot_bool(%arg0: memref<?xi1>, %arg1: memref<?xi1>,
                    %arg3: memref<i1>) {
  // Verifies that we use the correct (saturating) arith operations for booleans.
  linalg.dot ins(%arg0, %arg1 : memref<?xi1>, memref<?xi1>)
             outs(%arg3 : memref<i1>)
  return
}
