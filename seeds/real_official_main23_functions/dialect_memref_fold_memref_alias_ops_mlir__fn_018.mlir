func.func @fold_scalar_equivalent_vector_load_subview(
  %arg0 : memref<16xf32>, %off : index, %idx : index) -> vector<1xf32> {
  %0 = memref.subview %arg0[%off][4][2] : memref<16xf32> to memref<4xf32, strided<[2], offset: ?>>
  %1 = vector.load %0[%idx] : memref<4xf32, strided<[2], offset: ?>>, vector<1xf32>
  return %1 : vector<1xf32>
}
