func.func @copy_view(%arg0: memref<?xf32, strided<[1], offset: ?>>, %arg1: memref<?xf32, strided<[1], offset: ?>>) {
  linalg.generic {
    iterator_types = ["parallel"],
    indexing_maps = [ affine_map<(i) -> (i)>, affine_map<(i) -> (i)>] }
    ins(%arg0: memref<?xf32, strided<[1], offset: ?>>)
   outs(%arg1: memref<?xf32, strided<[1], offset: ?>>) {
    ^bb0(%a: f32, %b: f32):
      linalg.yield %a : f32
  }
  return
}
