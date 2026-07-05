func.func @fold_const_splat_global() -> memref<32xf32> {
  %alloc = memref.alloc() : memref<32xf32>
  return %alloc : memref<32xf32>
}
func.func @fold_trivial_memory_space_cast(%arg : memref<?xf32>) -> memref<?xf32> {
  %0 = memref.memory_space_cast %arg : memref<?xf32> to memref<?xf32>
  return %0 : memref<?xf32>
}
func.func @fold_multiple_memory_space_cast(%arg : memref<?xf32>) -> memref<?xf32, 2> {
  %0 = memref.memory_space_cast %arg : memref<?xf32> to memref<?xf32, 1>
  %1 = memref.memory_space_cast %0 : memref<?xf32, 1> to memref<?xf32, 2>
  return %1 : memref<?xf32, 2>
}
func.func private @ub_negative_alloc_size() -> memref<?x?x?xi1> {
  %idx1 = index.constant 1
  %c-2 = arith.constant -2 : index
  %c15 = arith.constant 15 : index
  %alloc = memref.alloc(%c15, %c-2, %idx1) : memref<?x?x?xi1>
  return %alloc : memref<?x?x?xi1>
}
func.func @subview_rank_reduction(%arg0: memref<1x384x384xf32>, %idx: index)
    -> memref<?x?xf32, strided<[384, 1], offset: ?>> {
  %c1 = arith.constant 1 : index
  %0 = memref.subview %arg0[0, %idx, %idx] [1, %c1, %idx] [1, 1, 1]
      : memref<1x384x384xf32> to memref<?x?xf32, strided<[384, 1], offset: ?>>
  return %0 : memref<?x?xf32, strided<[384, 1], offset: ?>>
}
func.func @fold_double_transpose(%arg0: memref<1x2x3x4x5xf32>) -> memref<5x3x2x4x1xf32, strided<[1, 20, 60, 5, 120]>> {
  %0 = memref.transpose %arg0 (d0, d1, d2, d3, d4) -> (d1, d0, d4, d3, d2) : memref<1x2x3x4x5xf32> to memref<2x1x5x4x3xf32, strided<[60, 120, 1, 5, 20]>>
  %1 = memref.transpose %0 (d1, d0, d4, d3, d2) -> (d4, d2, d1, d3, d0) : memref<2x1x5x4x3xf32, strided<[60, 120, 1, 5, 20]>> to memref<5x3x2x4x1xf32, strided<[1, 20, 60, 5, 120]>>
  return %1 : memref<5x3x2x4x1xf32, strided<[1, 20, 60, 5, 120]>>
}
#transpose_map = affine_map<(d0, d1)[s0] -> (d0 + d1 * s0)>
func.func @cannot_fold_transpose_cast(%arg0: memref<?x4xf32>) -> memref<?x?xf32, #transpose_map> {
    %cast = memref.cast %arg0 : memref<?x4xf32> to memref<?x?xf32>
    %transpose = memref.transpose %cast (d0, d1) -> (d1, d0) : memref<?x?xf32> to memref<?x?xf32, #transpose_map>
    return %transpose : memref<?x?xf32, #transpose_map>
}
func.func @fold_assume_alignment_chain(%0: memref<128xf32>) -> memref<128xf32> {
  %1 = memref.assume_alignment %0, 16 : memref<128xf32>
  %2 = memref.assume_alignment %1, 16 : memref<128xf32>
  return %2 : memref<128xf32>
}
func.func @replace_view_static_dims(%src: memref<?xi8>, %offset : index) -> memref<?x4xi32> {
  %c5 = arith.constant 5: index
  %res = memref.view %src[%offset][%c5] : memref<?xi8> to memref<?x4xi32>
  return %res : memref<?x4xi32>
}
func.func @non_replace_view_negative_static_dims(%src: memref<?xi8>, %offset : index) -> memref<?x4xi32> {
  %c-1 = arith.constant -1: index
  %res = memref.view %src[%offset][%c-1] : memref<?xi8> to memref<?x4xi32>
  return %res : memref<?x4xi32>
}
func.func @no_crash_dim_of_ambiguous_subview(
    %arg0: memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>, %arg1: index) -> index {
  %c1 = arith.constant 1 : index
  %subview = memref.subview %arg0[0, 0, 0] [1, %arg1, 1] [1, 1, 1]
      : memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>> to memref<1x?xf32, strided<[?, ?], offset: ?>>
  %dim = memref.dim %subview, %c1 : memref<1x?xf32, strided<[?, ?], offset: ?>>
  return %dim : index
}
