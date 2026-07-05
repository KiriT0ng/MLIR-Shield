func.func @atomicrmw_cast_fold(%arg0 : f32, %arg1 : memref<4xf32>, %c : index) {
  %v = memref.cast %arg1 : memref<4xf32> to memref<?xf32>
  %a = memref.atomic_rmw addf %arg0, %v[%c] : (f32, memref<?xf32>) -> f32
  return
}
