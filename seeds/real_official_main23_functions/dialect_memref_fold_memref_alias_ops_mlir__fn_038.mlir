func.func @fold_memref_load_collapse_shape(
  %arg0 : memref<4x8xf32>, %arg1 : index) -> f32 {
  %0 = memref.collapse_shape %arg0 [[0, 1]] : memref<4x8xf32> into memref<32xf32>
  %1 = memref.load %0[%arg1] {nontemporal = true} : memref<32xf32>
  return %1 : f32
}
