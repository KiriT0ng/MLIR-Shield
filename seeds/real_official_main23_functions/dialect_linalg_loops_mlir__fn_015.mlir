func.func @generic_const_init(%arg0: memref<?xf32>) {
        %cst = arith.constant 1.0 : f32
  linalg.generic #trait_const_fill outs(%arg0 : memref<?xf32>) {
    ^bb0(%arg1: f32):
      linalg.yield %cst : f32
    }
    return
}
