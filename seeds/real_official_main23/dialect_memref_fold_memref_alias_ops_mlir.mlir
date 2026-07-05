func.func @fold_static_stride_subview_with_load(%arg0 : memref<12x32xf32>, %arg1 : index, %arg2 : index, %arg3 : index, %arg4 : index) -> f32 {
  %0 = memref.subview %arg0[%arg1, %arg2][4, 4][2, 3] : memref<12x32xf32> to memref<4x4xf32, strided<[64, 3], offset: ?>>
  %1 = memref.load %0[%arg3, %arg4] : memref<4x4xf32, strided<[64, 3], offset: ?>>
  return %1 : f32
}

// -----

func.func @fold_dynamic_stride_subview_with_load(%arg0 : memref<12x32xf32>, %arg1 : index, %arg2 : index, %arg3 : index, %arg4 : index, %arg5 : index, %arg6 : index) -> f32 {
  %0 = memref.subview %arg0[%arg1, %arg2][4, 4][%arg5, %arg6] :
    memref<12x32xf32> to memref<4x4xf32, strided<[?, ?], offset: ?>>
  %1 = memref.load %0[%arg3, %arg4] : memref<4x4xf32, strided<[?, ?], offset: ?>>
  return %1 : f32
}

// -----

func.func @fold_static_stride_subview_with_store(%arg0 : memref<12x32xf32>, %arg1 : index, %arg2 : index, %arg3 : index, %arg4 : index, %arg5 : f32) {
  %0 = memref.subview %arg0[%arg1, %arg2][4, 4][2, 3] :
    memref<12x32xf32> to memref<4x4xf32, strided<[64, 3], offset: ?>>
  memref.store %arg5, %0[%arg3, %arg4] : memref<4x4xf32, strided<[64, 3], offset: ?>>
  return
}

// -----

func.func @fold_dynamic_stride_subview_with_store(%arg0 : memref<12x32xf32>, %arg1 : index, %arg2 : index, %arg3 : index, %arg4 : index, %arg5 : index, %arg6 : index, %arg7 : f32) {
  %0 = memref.subview %arg0[%arg1, %arg2][4, 4][%arg5, %arg6] :
    memref<12x32xf32> to memref<4x4xf32, strided<[?, ?], offset: ?>>
  memref.store %arg7, %0[%arg3, %arg4] : memref<4x4xf32, strided<[?, ?], offset: ?>>
  return
}

// -----

func.func @fold_subview_with_transfer_read_0d(
  %arg0 : memref<12x32xf32>, %arg1 : index, %arg2 : index, %arg3 : index)
    -> vector<f32> {
  %f1 = arith.constant 1.0 : f32
  %0 = memref.subview %arg0[%arg1, %arg2][1, 1][1, 1] : memref<12x32xf32> to memref<f32, strided<[], offset: ?>>
  %1 = vector.transfer_read %0[], %f1 : memref<f32, strided<[], offset: ?>>, vector<f32>
  return %1 : vector<f32>
}

// -----

func.func @fold_subview_with_transfer_read(%arg0 : memref<12x32xf32>, %arg1 : index, %arg2 : index, %arg3 : index, %arg4 : index, %arg5 : index, %arg6 : index) -> vector<4xf32> {
  %f1 = arith.constant 1.0 : f32

  %0 = memref.subview %arg0[%arg1, %arg2][4, 4][%arg5, %arg6] : memref<12x32xf32> to memref<4x4xf32, strided<[?, ?], offset: ?>>
  %1 = vector.transfer_read %0[%arg3, %arg4], %f1 {in_bounds = [true]} : memref<4x4xf32, strided<[?, ?], offset: ?>>, vector<4xf32>
  return %1 : vector<4xf32>
}
// Can't fold this atm since we don't emit the proper vector.extract_strided_slice.

// -----

func.func @fold_static_stride_subview_with_transfer_write_0d(
    %arg0 : memref<12x32xf32>, %arg1 : index, %arg2 : index, %arg3 : index,
    %v : vector<f32>) {
  %f1 = arith.constant 1.0 : f32
  %0 = memref.subview %arg0[%arg1, %arg2][1, 1][1, 1] : memref<12x32xf32> to memref<f32, strided<[], offset: ?>>
  vector.transfer_write %v, %0[] {in_bounds = []} : vector<f32>, memref<f32, strided<[], offset: ?>>
  return
}

// -----

func.func @fold_static_stride_subview_with_transfer_write(%arg0 : memref<12x32xf32>, %arg1 : index, %arg2 : index, %arg3 : index, %arg4 : index, %arg5: index, %arg6 : index, %arg7 : vector<4xf32>) {
  %0 = memref.subview %arg0[%arg1, %arg2][4, 4][%arg5, %arg6] :
    memref<12x32xf32> to memref<4x4xf32, strided<[?, ?], offset: ?>>
  vector.transfer_write %arg7, %0[%arg3, %arg4] {in_bounds = [true]} : vector<4xf32>, memref<4x4xf32, strided<[?, ?], offset: ?>>
  return
}
// Can't fold this atm since we don't emit the proper vector.extract_strided_slice.

// -----

func.func @fold_rank_reducing_subview_with_load
    (%arg0 : memref<?x?x?x?x?x?xf32>, %arg1 : index, %arg2 : index,
     %arg3 : index, %arg4 : index, %arg5 : index, %arg6 : index,
     %arg7 : index, %arg8 : index, %arg9 : index, %arg10: index,
     %arg11 : index, %arg12 : index, %arg13 : index, %arg14: index,
     %arg15 : index, %arg16 : index) -> f32 {
  %0 = memref.subview %arg0[%arg1, %arg2, %arg3, %arg4, %arg5, %arg6][4, 1, 1, 4, 1, 1][%arg7, %arg8, %arg9, %arg10, %arg11, %arg12] : memref<?x?x?x?x?x?xf32> to memref<4x1x4x1xf32, strided<[?, ?, ?, ?], offset: ?>>
  %1 = memref.load %0[%arg13, %arg14, %arg15, %arg16] : memref<4x1x4x1xf32, strided<[?, ?, ?, ?], offset: ?>>
  return %1 : f32
}

// -----

func.func @fold_rank_reducing_subview_1x8x1x3_to_1x8x3_drop_middle_unit_dim(
    %arg0 : memref<?x?x?x?xf32, strided<[?, ?, ?, ?], offset: ?>>,
    %arg1 : index, %arg2 : index, %arg3 : index, %arg4 : index) -> f32 {
  %c0 = arith.constant 0 : index
  %0 = memref.subview %arg0[0, 0, 0, 0][1, 8, 1, 3][1, 1, 1, 1]
      : memref<?x?x?x?xf32, strided<[?, ?, ?, ?], offset: ?>> to
        memref<1x8x3xf32, strided<[?, ?, ?], offset: ?>>
  %1 = memref.load %0[%c0, %arg1, %arg2] : memref<1x8x3xf32, strided<[?, ?, ?], offset: ?>>
  return %1 : f32
}

// -----

func.func @fold_vector_transfer_read_with_rank_reduced_subview(
    %arg0 : memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>,
    %arg1: index, %arg2 : index, %arg3 : index, %arg4: index, %arg5 : index,
    %arg6 : index) -> vector<4xf32> {
  %cst = arith.constant 0.0 : f32
  %0 = memref.subview %arg0[0, %arg1, %arg2] [1, %arg3, %arg4] [1, 1, 1]
      : memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>> to
        memref<?x?xf32, strided<[?, ?], offset: ?>>
  %1 = vector.transfer_read %0[%arg5, %arg6], %cst {in_bounds = [true]}
      : memref<?x?xf32, strided<[?, ?], offset: ?>>, vector<4xf32>
  return %1 : vector<4xf32>
}

// -----

func.func @fold_vector_transfer_write_with_rank_reduced_subview(
    %arg0 : memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>,
    %arg1 : vector<4xf32>, %arg2: index, %arg3 : index, %arg4 : index,
    %arg5: index, %arg6 : index, %arg7 : index) {
  %cst = arith.constant 0.0 : f32
  %0 = memref.subview %arg0[0, %arg2, %arg3] [1, %arg4, %arg5] [1, 1, 1]
      : memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>> to
        memref<?x?xf32, strided<[?, ?], offset: ?>>
  vector.transfer_write %arg1, %0[%arg6, %arg7] {in_bounds = [true]}
      : vector<4xf32>, memref<?x?xf32, strided<[?, ?], offset: ?>>
  return
}

// -----

func.func @fold_vector_transfer_write_with_inner_rank_reduced_subview(
    %arg0 : memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>,
    %arg1 : vector<4xf32>, %arg2: index, %arg3 : index, %arg4 : index,
    %arg5: index, %arg6 : index, %arg7 : index) {
  %cst = arith.constant 0.0 : f32
  %0 = memref.subview %arg0[%arg2, %arg3, 0] [%arg4, %arg5, 1] [1, 1, 1]
      : memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>> to
        memref<?x?xf32, strided<[?, ?], offset: ?>>
  vector.transfer_write %arg1, %0[%arg6, %arg7] {in_bounds = [true]}
      : vector<4xf32>, memref<?x?xf32, strided<[?, ?], offset: ?>>
  return
}

// -----

func.func @fold_masked_vector_transfer_read_with_subview(
    %arg0 : memref<?x?xf32, strided<[?, ?], offset: ?>>,
    %arg1: index, %arg2 : index, %arg3 : index, %arg4: index, %arg5 : index,
    %arg6 : index, %mask : vector<4xi1>) -> vector<4xf32> {
  %cst = arith.constant 0.0 : f32
  %0 = memref.subview %arg0[%arg1, %arg2] [%arg3, %arg4] [1, 1]
      : memref<?x?xf32, strided<[?, ?], offset: ?>> to
        memref<?x?xf32, strided<[?, ?], offset: ?>>
  %1 = vector.transfer_read %0[%arg5, %arg6], %cst, %mask {in_bounds = [true]}
      : memref<?x?xf32, strided<[?, ?], offset: ?>>, vector<4xf32>
  return %1 : vector<4xf32>
}

// -----

func.func @fold_masked_vector_transfer_read_with_rank_reducing_subview(
    %arg0 : memref<?x?x?x?xf32, strided<[?, ?, ?, ?], offset: ?>>,
    %arg1: index, %arg2 : index, %arg3 : index, %arg4: index, %arg5 : index,
    %arg6 : index, %mask : vector<4x3xi1>) -> vector<3x4xf32> {
  %cst = arith.constant 0.0 : f32
  %0 = memref.subview %arg0[0, %arg1, 0, %arg2] [1, %arg3, 1, %arg4] [1, 1, 1, 1]
      : memref<?x?x?x?xf32, strided<[?, ?, ?, ?], offset: ?>> to
        memref<?x?xf32, strided<[?, ?], offset: ?>>
  %1 = vector.transfer_read %0[%arg5, %arg6], %cst, %mask {
         permutation_map = affine_map<(d0, d1) -> (d1, d0)>, in_bounds = [true, true]}
      : memref<?x?xf32, strided<[?, ?], offset: ?>>, vector<3x4xf32>
  return %1 : vector<3x4xf32>
}

// -----

func.func @fold_masked_vector_transfer_write_with_subview(
    %arg0 : memref<?x?xf32, strided<[?, ?], offset: ?>>,
    %arg1 : vector<4xf32>, %arg2: index, %arg3 : index, %arg4 : index,
    %arg5: index, %arg6 : index, %arg7 : index, %mask : vector<4xi1>) {
  %cst = arith.constant 0.0 : f32
  %0 = memref.subview %arg0[%arg2, %arg3] [%arg4, %arg5] [1, 1]
      : memref<?x?xf32, strided<[?, ?], offset: ?>> to
        memref<?x?xf32, strided<[?, ?], offset: ?>>
  vector.transfer_write %arg1, %0[%arg6, %arg7], %mask {in_bounds = [true]}
      : vector<4xf32>, memref<?x?xf32, strided<[?, ?], offset: ?>>
  return
}

// -----

func.func @fold_masked_vector_transfer_write_with_rank_reducing_subview(
    %arg0 : memref<?x?x?x?xf32, strided<[?, ?, ?, ?], offset: ?>>,
    %arg1 : vector<3x4xf32>, %arg2: index, %arg3 : index, %arg4 : index,
    %arg5: index, %arg6 : index, %arg7 : index, %mask : vector<4x3xi1>) {
  %cst = arith.constant 0.0 : f32
  %0 = memref.subview %arg0[0, %arg2, 0, %arg3] [1, %arg4, 1, %arg5] [1, 1, 1, 1]
      : memref<?x?x?x?xf32, strided<[?, ?, ?, ?], offset: ?>> to
        memref<?x?xf32, strided<[?, ?], offset: ?>>
  vector.transfer_write %arg1, %0[%arg6, %arg7], %mask {
        permutation_map = affine_map<(d0, d1) -> (d1, d0)>, in_bounds = [true, true]}
      : vector<3x4xf32>, memref<?x?xf32, strided<[?, ?], offset: ?>>
  return
}

// -----

func.func @fold_dynamic_subview_with_memref_load_expand_shape(%arg0 : memref<16x?xf32, strided<[16, 1]>>, %arg1 : index, %arg2 : index, %sz0: index) -> f32 {
  %c0 = arith.constant 0 : index
  %expand_shape = memref.expand_shape %arg0 [[0, 1], [2, 3]] output_shape [1, 16, %sz0, 1] : memref<16x?xf32, strided<[16, 1]>> into memref<1x16x?x1xf32, strided<[256, 16, 1, 1]>>
  %0 = memref.load %expand_shape[%c0, %arg1, %arg2, %c0] {nontemporal = true} : memref<1x16x?x1xf32, strided<[256, 16, 1, 1]>>
  return %0 : f32
}

// -----

func.func @fold_dynamic_subview_with_memref_store_expand_shape(%arg0 : memref<16x?xf32, strided<[16, 1]>>, %arg1 : index, %arg2 : index, %sz0 : index) {
  %c0 = arith.constant 0 : index
  %c1f32 = arith.constant 1.0 : f32
  %expand_shape = memref.expand_shape %arg0 [[0, 1], [2, 3]] output_shape [1, 16, %sz0, 1] : memref<16x?xf32, strided<[16, 1]>> into memref<1x16x?x1xf32, strided<[256, 16, 1, 1]>>
  memref.store %c1f32, %expand_shape[%c0, %arg1, %arg2, %c0] {nontemporal = true} : memref<1x16x?x1xf32, strided<[256, 16, 1, 1]>>
  return
}

// -----

func.func @fold_static_stride_subview_with_memref_expand_shape_with_constant_access_index(%arg0: memref<1024x1024xf32>, %arg1: memref<1xf32>, %arg2: index) -> f32 {
  %0 = memref.expand_shape %arg0 [[0, 1], [2, 3]] output_shape [1, 1024, 1024, 1] : memref<1024x1024xf32> into memref<1x1024x1024x1xf32>
  %cst = arith.constant 0 : index
  affine.for %arg3 = 0 to 1 {
    affine.for %arg4 = 0 to 1024 {
      affine.for %arg5 = 0 to 1020 {
        affine.for %arg6 = 0 to 1 {
          %1 = memref.load %0[%arg3, %cst, %arg5, %arg6] : memref<1x1024x1024x1xf32>
          memref.store %1, %arg1[%arg2] : memref<1xf32>
        }
      }
    }
  }
  %2 = memref.load %arg1[%arg2] : memref<1xf32>
  return %2 : f32
}

// -----

func.func @subview_of_subview(%m: memref<8x1024xf32, 3>, %pos: index)
    -> memref<f32, strided<[], offset: ?>, 3>
{
  %0 = memref.subview %m[3, %pos] [5, 7] [1, 1]
      : memref<8x1024xf32, 3>
        to memref<5x7xf32, strided<[1024, 1], offset: ?>, 3>
  %1 = memref.subview %0[1, 2] [1, 1] [1, 1]
      : memref<5x7xf32, strided<[1024, 1], offset: ?>, 3>
        to memref<f32, strided<[], offset: ?>, 3>
  return %1 : memref<f32, strided<[], offset: ?>, 3>
}

// -----

func.func @subview_of_subview_rank_reducing(%m: memref<?x?x?xf32>,
                                            %sz: index, %pos: index)
    -> memref<f32, strided<[], offset: ?>>
{
  %0 = memref.subview %m[3, 1, 8] [1, %sz, 1] [1, 1, 1]
      : memref<?x?x?xf32>
        to memref<?xf32, strided<[?], offset: ?>>
  %1 = memref.subview %0[6] [1] [1]
      : memref<?xf32, strided<[?], offset: ?>>
        to memref<f32, strided<[], offset: ?>>
  return %1 : memref<f32, strided<[], offset: ?>>
}

// -----

func.func @subview_of_subview_no_unit_stride(%arg0: memref<8x8xf32, strided<[8, 1]>>) -> memref<2x2xf32, strided<[32, 4], offset: 27>> {
  %subview = memref.subview %arg0[1, 1] [4, 4] [2, 2] : memref<8x8xf32, strided<[8, 1]>> to memref<4x4xf32, strided<[16, 2], offset: 9>>
  %subview_0 = memref.subview %subview[1, 1] [2, 2] [2, 2] : memref<4x4xf32, strided<[16, 2], offset: 9>> to memref<2x2xf32, strided<[32, 4], offset: 27>>
  return %subview_0 : memref<2x2xf32, strided<[32, 4], offset: 27>>
}

// -----

func.func @subview_of_subview_rank_reducing_no_unit_stride(%arg0: memref<8x8xf32, strided<[8, 1]>>) -> memref<2xf32, strided<[4], offset: 27>> {
  %subview = memref.subview %arg0[1, 1] [4, 4] [2, 2] : memref<8x8xf32, strided<[8, 1]>> to memref<4x4xf32, strided<[16, 2], offset: 9>>
  %subview_0 = memref.subview %subview[1, 1] [1, 2] [2, 2] : memref<4x4xf32, strided<[16, 2], offset: 9>> to memref<2xf32, strided<[4], offset: 27>>
  return %subview_0 : memref<2xf32, strided<[4], offset: 27>>
}

// -----

func.func @fold_load_keep_nontemporal(%arg0 : memref<12x32xf32>, %arg1 : index, %arg2 : index, %arg3 : index, %arg4 : index) -> f32 {
  %0 = memref.subview %arg0[%arg1, %arg2][4, 4][2, 3] : memref<12x32xf32> to memref<4x4xf32, strided<[64, 3], offset: ?>>
  %1 = memref.load %0[%arg3, %arg4] {nontemporal = true }: memref<4x4xf32, strided<[64, 3], offset: ?>>
  return %1 : f32
}

// -----

func.func @fold_store_keep_nontemporal(%arg0 : memref<12x32xf32>, %arg1 : index, %arg2 : index, %arg3 : index, %arg4 : index, %arg5 : f32) {
  %0 = memref.subview %arg0[%arg1, %arg2][4, 4][2, 3] :
    memref<12x32xf32> to memref<4x4xf32, strided<[64, 3], offset: ?>>
  memref.store %arg5, %0[%arg3, %arg4] {nontemporal=true}: memref<4x4xf32, strided<[64, 3], offset: ?>>
  return
}

// -----

func.func @fold_prefetch_expand_shape(%src: memref<32xf32>, %i0: index, %i1: index) {
  %expand = memref.expand_shape %src [[0, 1]] output_shape [4, 8] : memref<32xf32> into memref<4x8xf32>
  memref.prefetch %expand[%i0, %i1], read, locality<2>, data : memref<4x8xf32>
  return
}


// -----

func.func @fold_gpu_subgroup_mma_load_matrix_1d(%src: memref<?xvector<4xf32>>, %offset: index, %i: index) -> !gpu.mma_matrix<16x16xf16, "COp"> {
  %subview = memref.subview %src[%offset] [81920] [1] : memref<?xvector<4xf32>> to memref<81920xvector<4xf32>, strided<[1], offset: ?>>
  %matrix = gpu.subgroup_mma_load_matrix %subview[%i] {leadDimension = 160 : index} : memref<81920xvector<4xf32>, strided<[1], offset: ?>> -> !gpu.mma_matrix<16x16xf16, "COp">
  return %matrix: !gpu.mma_matrix<16x16xf16, "COp">
}


// -----

func.func @fold_gpu_subgroup_mma_store_matrix_1d(%dst: memref<?xvector<4xf32>>, %offset: index, %i: index, %matrix: !gpu.mma_matrix<16x16xf16, "COp">) {
  %subview = memref.subview %dst[%offset] [81920] [1] : memref<?xvector<4xf32>> to memref<81920xvector<4xf32>, strided<[1], offset: ?>>
  gpu.subgroup_mma_store_matrix %matrix, %subview[%i] {leadDimension = 160 : index} : !gpu.mma_matrix<16x16xf16, "COp">, memref<81920xvector<4xf32>, strided<[1], offset: ?>>
  return
}


// -----

func.func @fold_gpu_subgroup_mma_load_matrix_2d(%arg0 : memref<128x128xf32>, %arg1 : index, %arg2 : index, %arg3 : index, %arg4 : index) -> !gpu.mma_matrix<16x16xf16, "COp"> {
  %subview = memref.subview %arg0[%arg1, %arg2][64, 32][2, 1] : memref<128x128xf32> to memref<64x32xf32, strided<[256, 1], offset: ?>>
  %matrix = gpu.subgroup_mma_load_matrix %subview[%arg3, %arg4] {leadDimension = 32 : index} : memref<64x32xf32, strided<[256, 1], offset: ?>> -> !gpu.mma_matrix<16x16xf16, "COp">
  return %matrix : !gpu.mma_matrix<16x16xf16, "COp">
}

// -----

func.func @fold_gpu_subgroup_mma_load_matrix_2d(%arg0 : memref<128x128xf32>, %arg1 : index, %arg2 : index, %arg3 : index, %arg4 : index, %matrix: !gpu.mma_matrix<16x16xf16, "COp">) {
  %subview = memref.subview %arg0[%arg1, %arg2][64, 32][2, 1] : memref<128x128xf32> to memref<64x32xf32, strided<[256, 1], offset: ?>>
  gpu.subgroup_mma_store_matrix %matrix, %subview[%arg3, %arg4] {leadDimension = 32 : index} :  !gpu.mma_matrix<16x16xf16, "COp">, memref<64x32xf32, strided<[256, 1], offset: ?>>
  return
}

// -----

func.func @fold_vector_load_subview(%src : memref<24x64xf32>,
                                    %off1 : index,
                                    %off2 : index,
                                    %dim1 : index,
                                    %dim2 : index,
                                    %idx : index) -> vector<12x32xf32> {

    %0 = memref.subview %src[%off1, %off2][%dim1, %dim2][1, 1] : memref<24x64xf32> to memref<?x?xf32, strided<[64, 1], offset: ?>>
    %1 = vector.load %0[%idx, %idx] :  memref<?x?xf32, strided<[64, 1], offset: ?>>, vector<12x32xf32>
    return %1 : vector<12x32xf32>
}


// -----

func.func @fold_scalar_equivalent_vector_load_subview(
  %arg0 : memref<16xf32>, %off : index, %idx : index) -> vector<1xf32> {
  %0 = memref.subview %arg0[%off][4][2] : memref<16xf32> to memref<4xf32, strided<[2], offset: ?>>
  %1 = vector.load %0[%idx] : memref<4xf32, strided<[2], offset: ?>>, vector<1xf32>
  return %1 : vector<1xf32>
}


// -----

func.func @fold_vector_maskedload_subview(
  %arg0 : memref<12x32xf32>, %arg1 : index, %arg2 : index, %arg3: vector<32xi1>, %arg4: vector<32xf32>) -> vector<32xf32> {
  %0 = memref.subview %arg0[%arg1, %arg2][1, 1][1, 1] : memref<12x32xf32> to memref<f32, strided<[], offset: ?>>
  %1 = vector.maskedload %0[], %arg3, %arg4 : memref<f32, strided<[], offset: ?>>, vector<32xi1>, vector<32xf32> into vector<32xf32>
  return %1 : vector<32xf32>
}


// -----

func.func @no_fold_vector_maskedload_subview_high_rank_vector(
  %arg0 : memref<8xf32>, %idx : index,
  %mask : vector<2x2x2xi1>, %pass : vector<2x2x2xf32>) -> vector<2x2x2xf32> {
  %0 = memref.subview %arg0[%idx][1][1] : memref<8xf32> to memref<1xf32, strided<[1], offset: ?>>
  %1 = vector.maskedload %0[%idx], %mask, %pass : memref<1xf32, strided<[1], offset: ?>>, vector<2x2x2xi1>, vector<2x2x2xf32> into vector<2x2x2xf32>
  return %1 : vector<2x2x2xf32>
}


// -----

func.func @fold_vector_store_subview(%src : memref<24x64xf32>,
                                     %off1 : index,
                                     %off2 : index,
                                     %vec: vector<2x32xf32>,
                                     %idx : index,
                                     %dim1 : index,
                                     %dim2 : index) -> () {

    %0 = memref.subview %src[%off1, %off2][%dim1, %dim2][1, 1] : memref<24x64xf32> to memref<?x?xf32, strided<[64, 1], offset: ?>>
    vector.store %vec, %0[%idx, %idx] : memref<?x?xf32, strided<[64, 1], offset: ?>> , vector<2x32xf32>
    return
}



// -----

func.func @fold_vector_maskedstore_subview(
  %arg0 : memref<12x32xf32>, %arg1 : index, %arg2 : index, %arg3: vector<32xi1>, %arg4: vector<32xf32>) -> () {
  %0 = memref.subview %arg0[%arg1, %arg2][1, 1][1, 1] : memref<12x32xf32> to memref<f32, strided<[], offset: ?>>
  vector.maskedstore %0[], %arg3, %arg4 : memref<f32, strided<[], offset: ?>>, vector<32xi1>, vector<32xf32>
  return
}


// -----

func.func @fold_vector_load_expand_shape(
  %arg0 : memref<32xf32>, %arg1 : index) -> vector<8xf32> {
  %c0 = arith.constant 0 : index
  %0 = memref.expand_shape %arg0 [[0, 1]] output_shape [4, 8] : memref<32xf32> into memref<4x8xf32>
  %1 = vector.load %0[%arg1, %c0] {nontemporal = true} : memref<4x8xf32>, vector<8xf32>
  return %1 : vector<8xf32>
}


// -----

func.func @fold_vector_load_expand_shape_leading_unit(
  %arg0 : memref<32xf32>, %arg1 : index) -> vector<1x8xf32> {
  %c0 = arith.constant 0 : index
  %0 = memref.expand_shape %arg0 [[0, 1]] output_shape [4, 8] : memref<32xf32> into memref<4x8xf32>
  %1 = vector.load %0[%arg1, %c0] : memref<4x8xf32>, vector<1x8xf32>
  return %1 : vector<1x8xf32>
}


// -----

func.func @fold_vector_load_expand_shape_all_unit(
  %arg0 : memref<f32>) -> vector<1xf32> {
  %c0 = arith.constant 0 : index
  %0 = memref.expand_shape %arg0 [] output_shape [1] : memref<f32> into memref<1xf32>
  %1 = vector.load %0[%c0] : memref<1xf32>, vector<1xf32>
  return %1 : vector<1xf32>
}


// -----

func.func @fold_vector_maskedload_expand_shape(
  %arg0 : memref<32xf32>, %arg1 : index, %arg3: vector<8xi1>, %arg4: vector<8xf32>) -> vector<8xf32> {
  %c0 = arith.constant 0 : index
  %0 = memref.expand_shape %arg0 [[0, 1]] output_shape [4, 8] : memref<32xf32> into memref<4x8xf32>
  %1 = vector.maskedload %0[%arg1, %c0], %arg3, %arg4 : memref<4x8xf32>, vector<8xi1>, vector<8xf32> into vector<8xf32>
  return %1 : vector<8xf32>
}


// -----

func.func @fold_vector_maskedload_expand_shape_leading_unit(
  %arg0 : memref<32xf32>, %arg1 : index, %mask: vector<1x8xi1>,
  %pass: vector<1x8xf32>) -> vector<1x8xf32> {
  %c0 = arith.constant 0 : index
  %0 = memref.expand_shape %arg0 [[0, 1]] output_shape [4, 8] : memref<32xf32> into memref<4x8xf32>
  %1 = vector.maskedload %0[%arg1, %c0], %mask, %pass : memref<4x8xf32>, vector<1x8xi1>, vector<1x8xf32> into vector<1x8xf32>
  return %1 : vector<1x8xf32>
}


// -----

func.func @negative_fold_vector_maskedload_expand_shape_all_unit(
  %arg0 : memref<f32>, %mask: vector<1xi1>, %pass: vector<1xf32>)
  -> vector<1xf32> {
  %c0 = arith.constant 0 : index
  %0 = memref.expand_shape %arg0 [] output_shape [1] : memref<f32> into memref<1xf32>
  %1 = vector.maskedload %0[%c0], %mask, %pass : memref<1xf32>, vector<1xi1>, vector<1xf32> into vector<1xf32>
  return %1 : vector<1xf32>
}


// -----

func.func @no_fold_vector_maskedload_expand_shape_high_rank_vector(
  %arg0 : memref<32xf32>, %arg1 : index,
  %mask : vector<2x2x2xi1>, %pass : vector<2x2x2xf32>) -> vector<2x2x2xf32> {
  %c0 = arith.constant 0 : index
  %0 = memref.expand_shape %arg0 [[0, 1]] output_shape [4, 8] : memref<32xf32> into memref<4x8xf32>
  %1 = vector.maskedload %0[%arg1, %c0], %mask, %pass : memref<4x8xf32>, vector<2x2x2xi1>, vector<2x2x2xf32> into vector<2x2x2xf32>
  return %1 : vector<2x2x2xf32>
}


// -----

func.func @fold_vector_store_expand_shape(
  %arg0 : memref<32xf32>, %arg1 : index, %val : vector<8xf32>) {
  %c0 = arith.constant 0 : index
  %0 = memref.expand_shape %arg0 [[0, 1]] output_shape [4, 8] : memref<32xf32> into memref<4x8xf32>
  vector.store %val, %0[%arg1, %c0] {nontemporal = true} : memref<4x8xf32>, vector<8xf32>
  return
}


// -----

func.func @fold_vector_store_expand_shape_leading_unit(
  %arg0 : memref<32xf32>, %arg1 : index, %val : vector<1x8xf32>) {
  %c0 = arith.constant 0 : index
  %0 = memref.expand_shape %arg0 [[0, 1]] output_shape [4, 8] : memref<32xf32> into memref<4x8xf32>
  vector.store %val, %0[%arg1, %c0] : memref<4x8xf32>, vector<1x8xf32>
  return
}


// -----

func.func @fold_vector_store_expand_shape_all_unit(
  %arg0 : memref<f32>, %val : vector<1xf32>) {
  %c0 = arith.constant 0 : index
  %0 = memref.expand_shape %arg0 [] output_shape [1] : memref<f32> into memref<1xf32>
  vector.store %val, %0[%c0] : memref<1xf32>, vector<1xf32>
  return
}


// -----

func.func @fold_vector_maskedstore_expand_shape(
  %arg0 : memref<32xf32>, %arg1 : index, %arg3: vector<8xi1>, %arg4: vector<8xf32>) {
  %c0 = arith.constant 0 : index
  %0 = memref.expand_shape %arg0 [[0, 1]] output_shape [4, 8] : memref<32xf32> into memref<4x8xf32>
  vector.maskedstore %0[%arg1, %c0], %arg3, %arg4 : memref<4x8xf32>, vector<8xi1>, vector<8xf32>
  return
}


// -----

func.func @fold_vector_maskedstore_expand_shape_leading_unit(
  %arg0 : memref<32xf32>, %arg1 : index, %mask: vector<1x8xi1>,
  %val: vector<1x8xf32>) {
  %c0 = arith.constant 0 : index
  %0 = memref.expand_shape %arg0 [[0, 1]] output_shape [4, 8] : memref<32xf32> into memref<4x8xf32>
  vector.maskedstore %0[%arg1, %c0], %mask, %val : memref<4x8xf32>, vector<1x8xi1>, vector<1x8xf32>
  return
}


// -----

func.func @no_fold_vector_maskedstore_expand_shape_all_unit(
  %arg0 : memref<f32>, %mask: vector<1xi1>, %val: vector<1xf32>) {
  %c0 = arith.constant 0 : index
  %0 = memref.expand_shape %arg0 [] output_shape [1] : memref<f32> into memref<1xf32>
  vector.maskedstore %0[%c0], %mask, %val : memref<1xf32>, vector<1xi1>, vector<1xf32>
  return
}


// -----

func.func @fold_vector_expandload_expand_shape(
  %arg0 : memref<32xf32>, %arg1 : index, %arg3: vector<8xi1>, %arg4: vector<8xf32>) -> vector<8xf32> {
  %c0 = arith.constant 0 : index
  %0 = memref.expand_shape %arg0 [[0, 1]] output_shape [4, 8] : memref<32xf32> into memref<4x8xf32>
  %1 = vector.expandload %0[%arg1, %c0], %arg3, %arg4 : memref<4x8xf32>, vector<8xi1>, vector<8xf32> into vector<8xf32>
  return %1 : vector<8xf32>
}


// -----

func.func @no_fold_vector_expandload_expand_shape_all_unit(
  %arg0 : memref<f32>, %mask: vector<1xi1>, %pass: vector<1xf32>)
  -> vector<1xf32> {
  %c0 = arith.constant 0 : index
  %0 = memref.expand_shape %arg0 [] output_shape [1] : memref<f32> into memref<1xf32>
  %1 = vector.expandload %0[%c0], %mask, %pass : memref<1xf32>, vector<1xi1>, vector<1xf32> into vector<1xf32>
  return %1 : vector<1xf32>
}


// -----

func.func @fold_vector_compressstore_expand_shape(
  %arg0 : memref<32xf32>, %arg1 : index, %arg3: vector<8xi1>, %arg4: vector<8xf32>) {
  %c0 = arith.constant 0 : index
  %0 = memref.expand_shape %arg0 [[0, 1]] output_shape [4, 8] : memref<32xf32> into memref<4x8xf32>
  vector.compressstore %0[%arg1, %c0], %arg3, %arg4 : memref<4x8xf32>, vector<8xi1>, vector<8xf32>
  return
}


// -----

func.func @negative_fold_vector_compressstore_expand_shape_all_unit(
  %arg0 : memref<f32>, %mask: vector<1xi1>, %val: vector<1xf32>) {
  %c0 = arith.constant 0 : index
  %0 = memref.expand_shape %arg0 [] output_shape [1] : memref<f32> into memref<1xf32>
  vector.compressstore %0[%c0], %mask, %val : memref<1xf32>, vector<1xi1>, vector<1xf32>
  return
}


// -----

func.func @fold_vector_transfer_read_expand_shape(
  %arg0 : memref<32xf32>, %arg1 : index) -> vector<8xf32> {
  %c0 = arith.constant 0 : index
  %pad = ub.poison : f32
  %0 = memref.expand_shape %arg0 [[0, 1]] output_shape [4, 8] : memref<32xf32> into memref<4x8xf32>
  %1 = vector.transfer_read %0[%arg1, %c0], %pad {in_bounds = [true]} : memref<4x8xf32>, vector<8xf32>
  return %1 : vector<8xf32>
}


// -----

func.func @fold_vector_transfer_read_expand_shape_non_identity(
  %arg0 : memref<32x32xf32>, %arg1 : index, %arg2 : index) -> vector<8x8xf32> {
  %c0 = arith.constant 0 : index
  %pad = ub.poison : f32
  %0 = memref.expand_shape %arg0 [[0, 1], [2, 3]] output_shape [4, 8, 4, 8] : memref<32x32xf32> into memref<4x8x4x8xf32>
  %1 = vector.transfer_read %0[%arg1, %c0, %arg2, %c0], %pad {in_bounds = [true, true], permutation_map = affine_map<(d0, d1, d2, d3) -> (d1, d3)>} : memref<4x8x4x8xf32>, vector<8x8xf32>
  return %1 : vector<8x8xf32>
}


// -----

func.func @fold_vector_transfer_read_expand_shape_non_identity_non_contiguous(
  %arg0 : memref<32x32xf32>, %arg1 : index, %arg2 : index) -> vector<8x8xf32> {
  %c0 = arith.constant 0 : index
  %pad = ub.poison : f32
  %0 = memref.expand_shape %arg0 [[0, 1], [2, 3]] output_shape [4, 8, 4, 8] : memref<32x32xf32> into memref<4x8x4x8xf32>
  %1 = vector.transfer_read %0[%arg1, %c0, %arg2, %c0], %pad {in_bounds = [true, true], permutation_map = affine_map<(d0, d1, d2, d3) -> (d0, d3)>} : memref<4x8x4x8xf32>, vector<8x8xf32>
  return %1 : vector<8x8xf32>
}


// -----

func.func @fold_vector_transfer_read_with_perm_map(
  %arg0 : memref<32xf32>, %arg1 : index) -> vector<4x4xf32> {
  %c0 = arith.constant 0 : index
  %pad = ub.poison : f32
  %0 = memref.expand_shape %arg0 [[0, 1]] output_shape [4, 8] : memref<32xf32> into memref<4x8xf32>
  %1 = vector.transfer_read %0[%arg1, %c0], %pad { permutation_map = affine_map<(d0, d1) -> (d1, d0)>, in_bounds = [true, true]} : memref<4x8xf32>, vector<4x4xf32>
  return %1 : vector<4x4xf32>
}


// -----

func.func @fold_vector_transfer_read_rank_mismatch(
  %arg0 : memref<32xf32>, %arg1 : index) -> vector<4x4xf32> {
  %c0 = arith.constant 0 : index
  %pad = ub.poison : f32
  %0 = memref.expand_shape %arg0 [[0, 1, 2]] output_shape [2, 4, 4] : memref<32xf32> into memref<2x4x4xf32>
  %1 = vector.transfer_read %0[%arg1, %c0, %c0], %pad {in_bounds = [true, true]} : memref<2x4x4xf32>, vector<4x4xf32>
  return %1 : vector<4x4xf32>
}


// -----

func.func @fold_memref_load_collapse_shape(
  %arg0 : memref<4x8xf32>, %arg1 : index) -> f32 {
  %0 = memref.collapse_shape %arg0 [[0, 1]] : memref<4x8xf32> into memref<32xf32>
  %1 = memref.load %0[%arg1] {nontemporal = true} : memref<32xf32>
  return %1 : f32
}


// -----

func.func @fold_vector_load_collapse_shape(
  %arg0 : memref<4x8xf32>, %arg1 : index) -> vector<8xf32> {
  %0 = memref.collapse_shape %arg0 [[0, 1]] : memref<4x8xf32> into memref<32xf32>
  %1 = vector.load %0[%arg1] {nontemporal = true} : memref<32xf32>, vector<8xf32>
  return %1 : vector<8xf32>
}


// -----

func.func @fold_vector_maskedload_collapse_shape(
  %arg0 : memref<4x8xf32>, %arg1 : index, %arg3: vector<8xi1>, %arg4: vector<8xf32>) -> vector<8xf32> {
  %0 = memref.collapse_shape %arg0 [[0, 1]] : memref<4x8xf32> into memref<32xf32>
  %1 = vector.maskedload %0[%arg1], %arg3, %arg4 : memref<32xf32>, vector<8xi1>, vector<8xf32> into vector<8xf32>
  return %1 : vector<8xf32>
}


// -----

func.func @fold_memref_store_collapse_shape(
  %arg0 : memref<4x8xf32>, %arg1 : index, %val : f32) {
  %0 = memref.collapse_shape %arg0 [[0, 1]] : memref<4x8xf32> into memref<32xf32>
  memref.store %val, %0[%arg1] {nontemporal = true} : memref<32xf32>
  return
}


// -----

func.func @fold_vector_store_collapse_shape(
  %arg0 : memref<4x8xf32>, %arg1 : index, %val : vector<8xf32>) {
  %0 = memref.collapse_shape %arg0 [[0, 1]] : memref<4x8xf32> into memref<32xf32>
  vector.store %val, %0[%arg1] {nontemporal = true} : memref<32xf32>, vector<8xf32>
  return
}


// -----

func.func @fold_vector_maskedstore_collapse_shape(
  %arg0 : memref<4x8xf32>, %arg1 : index, %arg3: vector<8xi1>, %arg4: vector<8xf32>) {
  %0 = memref.collapse_shape %arg0 [[0, 1]] : memref<4x8xf32> into memref<32xf32>
  vector.maskedstore %0[%arg1], %arg3, %arg4 : memref<32xf32>, vector<8xi1>, vector<8xf32>
  return
}


// -----

func.func @no_fold_collapse_shape_transfer_read(
    %arg0 : memref<4x4x8xf32>, %arg1 : index) -> vector<4x8xf32> {
  %c0 = arith.constant 0 : index
  %pad = ub.poison : f32
  %0 = memref.collapse_shape %arg0 [[0, 1], [2]] : memref<4x4x8xf32> into memref<16x8xf32>
  %1 = vector.transfer_read %0[%arg1, %c0], %pad {in_bounds = [true, true]} : memref<16x8xf32>, vector<4x8xf32>
  return %1 : vector<4x8xf32>
}


// -----

func.func @fold_collapse_shape_transfer_read(
    %arg0 : memref<4x4x8xf32>, %arg1 : index) -> vector<8xf32> {
  %c0 = arith.constant 0 : index
  %pad = ub.poison : f32
  %0 = memref.collapse_shape %arg0 [[0, 1], [2]] : memref<4x4x8xf32> into memref<16x8xf32>
  %1 = vector.transfer_read %0[%arg1, %c0], %pad {in_bounds = [true]} : memref<16x8xf32>, vector<8xf32>
  return %1 : vector<8xf32>
}


// -----

func.func @fold_dma_start_subview_src(
    %src : memref<128x64xf32>, %dst : memref<32xf32, 1>, %tag : memref<1xi32>,
    %off0 : index, %off1 : index) {
  %c0 = arith.constant 0 : index
  %num_elements = arith.constant 32 : index
  %subview = memref.subview %src[%off0, %off1][32, 32][1, 1] : memref<128x64xf32> to memref<32x32xf32, strided<[64, 1], offset: ?>>
  memref.dma_start %subview[%c0, %c0], %dst[%c0], %num_elements, %tag[%c0] : memref<32x32xf32, strided<[64, 1], offset: ?>>, memref<32xf32, 1>, memref<1xi32>
  return
}


// -----

func.func @fold_dma_start_subview_dst(
    %src : memref<32xf32>, %dst : memref<128x64xf32, 1>, %tag : memref<1xi32>,
    %off0 : index, %off1 : index) {
  %c0 = arith.constant 0 : index
  %num_elements = arith.constant 32 : index
  %subview = memref.subview %dst[%off0, %off1][32, 32][1, 1] : memref<128x64xf32, 1> to memref<32x32xf32, strided<[64, 1], offset: ?>, 1>
  memref.dma_start %src[%c0], %subview[%c0, %c0], %num_elements, %tag[%c0] : memref<32xf32>, memref<32x32xf32, strided<[64, 1], offset: ?>, 1>, memref<1xi32>
  return
}

// -----

func.func @fold_dma_start_expand_shape_src(
    %src : memref<32xf32>, %dst : memref<8xf32, 1>, %tag : memref<1xi32>,
    %idx : index) {
  %c0 = arith.constant 0 : index
  %num_elements = arith.constant 8 : index
  %expand = memref.expand_shape %src [[0, 1]] output_shape [4, 8] : memref<32xf32> into memref<4x8xf32>
  memref.dma_start %expand[%idx, %c0], %dst[%c0], %num_elements, %tag[%c0] : memref<4x8xf32>, memref<8xf32, 1>, memref<1xi32>
  return
}


// -----

func.func @fold_dma_start_expand_shape_dst(
    %src : memref<8xf32>, %dst : memref<32xf32, 1>, %tag : memref<1xi32>,
    %idx : index) {
  %c0 = arith.constant 0 : index
  %num_elements = arith.constant 8 : index
  %expand = memref.expand_shape %dst [[0, 1]] output_shape [4, 8] : memref<32xf32, 1> into memref<4x8xf32, 1>
  memref.dma_start %src[%c0], %expand[%idx, %c0], %num_elements, %tag[%c0] : memref<8xf32>, memref<4x8xf32, 1>, memref<1xi32>
  return
}


// -----

func.func @fold_dma_start_collapse_shape_src(
    %src : memref<4x8xf32>, %dst : memref<8xf32, 1>, %tag : memref<1xi32>,
    %idx : index) {
  %c0 = arith.constant 0 : index
  %num_elements = arith.constant 8 : index
  %collapse = memref.collapse_shape %src [[0, 1]] : memref<4x8xf32> into memref<32xf32>
  memref.dma_start %collapse[%idx], %dst[%c0], %num_elements, %tag[%c0] : memref<32xf32>, memref<8xf32, 1>, memref<1xi32>
  return
}


// -----

func.func @fold_dma_start_collapse_shape_dst(
    %src : memref<8xf32>, %dst : memref<4x8xf32, 1>, %tag : memref<1xi32>,
    %idx : index) {
  %c0 = arith.constant 0 : index
  %num_elements = arith.constant 8 : index
  %collapse = memref.collapse_shape %dst [[0, 1]] : memref<4x8xf32, 1> into memref<32xf32, 1>
  memref.dma_start %src[%c0], %collapse[%idx], %num_elements, %tag[%c0] : memref<8xf32>, memref<32xf32, 1>, memref<1xi32>
  return
}
