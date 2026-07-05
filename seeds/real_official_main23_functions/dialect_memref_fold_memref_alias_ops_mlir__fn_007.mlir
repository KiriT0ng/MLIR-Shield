func.func @fold_dynamic_subview_with_memref_store_expand_shape(%arg0 : memref<16x?xf32, strided<[16, 1]>>, %arg1 : index, %arg2 : index, %sz0 : index) {
  %c0 = arith.constant 0 : index
  %c1f32 = arith.constant 1.0 : f32
  %expand_shape = memref.expand_shape %arg0 [[0, 1], [2, 3]] output_shape [1, 16, %sz0, 1] : memref<16x?xf32, strided<[16, 1]>> into memref<1x16x?x1xf32, strided<[256, 16, 1, 1]>>
  memref.store %c1f32, %expand_shape[%c0, %arg1, %arg2, %c0] {nontemporal = true} : memref<1x16x?x1xf32, strided<[256, 16, 1, 1]>>
  return
}
