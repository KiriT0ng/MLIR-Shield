func.func @generic_region(%arg0: memref<?x?xf32, strided<[?, 1], offset: ?>>, %arg1: memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>>, %arg2: memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>>) {
  linalg.generic #trait2
    ins(%arg0: memref<?x?xf32, strided<[?, 1], offset: ?>>)
   outs(%arg1, %arg2 : memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>>,
                       memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>>) {
    ^bb0(%a: f32, %b: f32, %c: f32):
      %d = arith.mulf %a, %b : f32
      %e = arith.addf %c, %d : f32
      linalg.yield %d, %e : f32, f32
  }
  return
}
