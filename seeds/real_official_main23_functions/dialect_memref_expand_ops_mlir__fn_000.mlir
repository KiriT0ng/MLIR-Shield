func.func @atomic_rmw_no_conversion(%F: memref<10xf32>, %f: f32, %i: index) -> (f32, f32) {
  %x = memref.atomic_rmw addf %f, %F[%i] : (f32, memref<10xf32>) -> f32
  %y = memref.atomic_rmw maximumf %f, %F[%i] : (f32, memref<10xf32>) -> f32
  return %x, %y : f32, f32
}
