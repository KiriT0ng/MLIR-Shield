func.func @identity_buffer(%arg0 : memref<?xf32>, %arg1: memref<?xf32>) {
  linalg.generic {
    indexing_maps = [#map, #map],
    iterator_types = ["parallel"]
  } ins(%arg0 : memref<?xf32>)
    outs(%arg1 : memref<?xf32>) {
  ^bb0(%arg2 : f32, %arg3 : f32):
    linalg.yield %arg2 : f32
  }
  return
}
