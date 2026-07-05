func.func @fold_vector_load_collapse_shape(
  %arg0 : memref<4x8xf32>, %arg1 : index) -> vector<8xf32> {
  %0 = memref.collapse_shape %arg0 [[0, 1]] : memref<4x8xf32> into memref<32xf32>
  %1 = vector.load %0[%arg1] {nontemporal = true} : memref<32xf32>, vector<8xf32>
  return %1 : vector<8xf32>
}
