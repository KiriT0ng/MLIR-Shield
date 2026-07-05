func.func @collapse_shape_identity_fold(%arg0 : memref<5xi8>) -> memref<5xi8> {
  %0 = memref.collapse_shape %arg0 [[0]] : memref<5xi8> into memref<5xi8>
  return %0 : memref<5xi8>
}

// -----

func.func @expand_shape_identity_fold(%arg0 : memref<5x4xi8>) -> memref<5x4xi8> {
  %0 = memref.expand_shape %arg0 [[0], [1]] output_shape [5, 4] : memref<5x4xi8> into memref<5x4xi8>
  return %0 : memref<5x4xi8>
}

// -----

func.func @collapse_expand_rank0_cancel(%arg0 : memref<1x1xi8>) -> memref<1x1xi8> {
  %0 = memref.collapse_shape %arg0 [] : memref<1x1xi8> into memref<i8>
  %1 = memref.expand_shape %0 [] output_shape [1, 1] : memref<i8> into memref<1x1xi8>
  return %1 : memref<1x1xi8>
}

// -----

func.func @subview_of_size_memcast(%arg : memref<4x6x16x32xi8>) ->
  memref<16x32xi8, strided<[32, 1], offset: 512>>{
  %0 = memref.cast %arg : memref<4x6x16x32xi8> to memref<?x?x16x32xi8>
  %1 = memref.subview %0[0, 1, 0, 0] [1, 1, 16, 32] [1, 1, 1, 1] :
    memref<?x?x16x32xi8> to
    memref<16x32xi8, strided<[32, 1], offset: 512>>
  return %1 : memref<16x32xi8, strided<[32, 1], offset: 512>>
}

// -----

func.func @subview_of_strides_memcast(%arg : memref<1x1x?xf32, strided<[35, 7, 1], offset: ?>>) -> memref<1x4xf32, strided<[?, ?], offset: ?>> {
  %0 = memref.cast %arg : memref<1x1x?xf32, strided<[35, 7, 1], offset: ?>> to memref<1x1x?xf32, strided<[?, ?, ?], offset: ?>>
  %1 = memref.subview %0[0, 0, 0] [1, 1, 4] [1, 1, 1] : memref<1x1x?xf32, strided<[?, ?, ?], offset: ?>> to memref<1x4xf32, strided<[?, ?], offset: ?>>
  return %1 : memref<1x4xf32, strided<[?, ?], offset: ?>>
}

// -----

func.func @subview_of_static_full_size(%arg0 : memref<4x6x16x32xi8>) -> memref<4x6x16x32xi8> {
  %0 = memref.subview %arg0[0, 0, 0, 0] [4, 6, 16, 32] [1, 1, 1, 1] : memref<4x6x16x32xi8> to memref<4x6x16x32xi8>
  return %0 : memref<4x6x16x32xi8>
}

// -----

func.func @negative_subview_of_static_full_size(%arg0:  memref<16x4xf32,  strided<[4, 1], offset: ?>>, %idx: index) -> memref<16x4xf32,  strided<[4, 1], offset: ?>> {
  %0 = memref.subview %arg0[%idx, 0][16, 4][1, 1] : memref<16x4xf32,  strided<[4, 1], offset: ?>> to memref<16x4xf32,  strided<[4, 1], offset: ?>>
  return %0 : memref<16x4xf32,  strided<[4, 1], offset: ?>>
}

// -----

func.func @subview_canonicalize(%arg0 : memref<?x?x?xf32>, %arg1 : index,
    %arg2 : index) -> memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>
{
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c4 = arith.constant 4 : index
  %0 = memref.subview %arg0[%c0, %arg1, %c1] [%c4, %c1, %arg2] [%c1, %c1, %c1] : memref<?x?x?xf32> to memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>
  return %0 : memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>
}

// -----

func.func @rank_reducing_subview_canonicalize(%arg0 : memref<?x?x?xf32>, %arg1 : index,
  %arg2 : index) -> memref<?x?xf32, strided<[?, ?], offset: ?>>
{
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c4 = arith.constant 4 : index
  %0 = memref.subview %arg0[%c0, %arg1, %c1] [%c4, 1, %arg2] [%c1, %c1, %c1] : memref<?x?x?xf32> to memref<?x?xf32, strided<[?, ?], offset: ?>>
  return %0 : memref<?x?xf32, strided<[?, ?], offset: ?>>
}

// -----

func.func @multiple_reducing_dims(%arg0 : memref<1x384x384xf32>,
    %arg1 : index, %arg2 : index, %arg3 : index) -> memref<?xf32, strided<[1], offset: ?>>
{
  %c1 = arith.constant 1 : index
  %0 = memref.subview %arg0[0, %arg1, %arg2] [1, %c1, %arg3] [1, 1, 1] : memref<1x384x384xf32> to memref<?x?xf32, strided<[384, 1], offset: ?>>
  %1 = memref.subview %0[0, 0] [1, %arg3] [1, 1] : memref<?x?xf32, strided<[384, 1], offset: ?>> to memref<?xf32, strided<[1], offset: ?>>
  return %1 : memref<?xf32, strided<[1], offset: ?>>
}

// -----

func.func @multiple_reducing_dims_dynamic(%arg0 : memref<?x?x?xf32>,
    %arg1 : index, %arg2 : index, %arg3 : index) -> memref<?xf32, strided<[1], offset: ?>>
{
  %c1 = arith.constant 1 : index
  %0 = memref.subview %arg0[0, %arg1, %arg2] [1, %c1, %arg3] [1, 1, 1] : memref<?x?x?xf32> to memref<?x?xf32, strided<[?, 1], offset: ?>>
  %1 = memref.subview %0[0, 0] [1, %arg3] [1, 1] : memref<?x?xf32, strided<[?, 1], offset: ?>> to memref<?xf32, strided<[1], offset: ?>>
  return %1 : memref<?xf32, strided<[1], offset: ?>>
}

// -----

func.func @multiple_reducing_dims_all_dynamic(%arg0 : memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>,
    %arg1 : index, %arg2 : index, %arg3 : index) -> memref<?xf32, strided<[?], offset: ?>>
{
  %c1 = arith.constant 1 : index
  %0 = memref.subview %arg0[0, %arg1, %arg2] [1, %c1, %arg3] [1, 1, 1]
      : memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>> to memref<?x?xf32, strided<[?, ?], offset: ?>>
  %1 = memref.subview %0[0, 0] [1, %arg3] [1, 1] : memref<?x?xf32, strided<[?, ?], offset: ?>> to memref<?xf32, strided<[?], offset: ?>>
  return %1 : memref<?xf32, strided<[?], offset: ?>>
}

// -----

func.func @subview_negative_stride1(%arg0 : memref<?xf32>) -> memref<?xf32, strided<[?], offset: ?>>
{
  %c0 = arith.constant 0 : index
  %c1 = arith.constant -1 : index
  %1 = memref.dim %arg0, %c0 : memref<?xf32>
  %2 = arith.addi %1, %c1 : index
  %3 = memref.subview %arg0[%2] [%1] [%c1] : memref<?xf32> to memref<?xf32, strided<[?], offset: ?>>
  return %3 : memref<?xf32, strided<[?], offset: ?>>
}

// -----

func.func @subview_negative_stride2(%arg0 : memref<7xf32>) -> memref<?xf32, strided<[?], offset: ?>>
{
  %c0 = arith.constant 0 : index
  %c1 = arith.constant -1 : index
  %1 = memref.dim %arg0, %c0 : memref<7xf32>
  %2 = arith.addi %1, %c1 : index
  %3 = memref.subview %arg0[%2] [%1] [%c1] : memref<7xf32> to memref<?xf32, strided<[?], offset: ?>>
  return %3 : memref<?xf32, strided<[?], offset: ?>>
}

// -----

func.func @no_fold_subview_negative_size(%input: memref<4x1024xf32>) -> memref<?x256xf32, strided<[1024, 1], offset: 2304>> {
  %cst = arith.constant -13 : index
  %0 = memref.subview %input[2, 256] [%cst, 256] [1, 1] : memref<4x1024xf32> to memref<?x256xf32, strided<[1024, 1], offset: 2304>>
  return %0 : memref<?x256xf32, strided<[1024, 1], offset: 2304>>
}

// -----

func.func @no_fold_subview_zero_stride(%arg0 : memref<10xf32>) -> memref<1xf32, strided<[?], offset: 1>> {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %1 = memref.subview %arg0[1] [1] [%c0] : memref<10xf32> to memref<1xf32, strided<[?], offset: 1>>
  return %1 : memref<1xf32, strided<[?], offset: 1>>
}

// -----

func.func @no_fold_of_store(%arg : memref<32xi8>, %holder: memref<memref<?xi8>>) {
  %0 = memref.cast %arg : memref<32xi8> to memref<?xi8>
  memref.store %0, %holder[] : memref<memref<?xi8>>
  return
}

// -----

// Test case: Folding of memref.dim(memref.alloca(%size), %idx) -> %size
func.func @dim_of_alloca(%size: index) -> index {
  %0 = memref.alloca(%size) : memref<?xindex>
  %c0 = arith.constant 0 : index
  %1 = memref.dim %0, %c0 : memref<?xindex>
  return %1 : index
}

// -----

// Test case: Folding of memref.dim(memref.alloca(rank(%v)), %idx) -> rank(%v)
func.func @dim_of_alloca_with_dynamic_size(%arg0: memref<*xf32>) -> index {
  %0 = memref.rank %arg0 : memref<*xf32>
  %1 = memref.alloca(%0) : memref<?xindex>
  %c0 = arith.constant 0 : index
  %2 = memref.dim %1, %c0 : memref<?xindex>
  return %2 : index
}

// -----

// Test case: Folding of memref.dim(memref.reshape %v %shp, %idx) -> memref.load %shp[%idx]
func.func @dim_of_memref_reshape(%arg0: memref<*xf32>, %arg1: memref<?xindex>)
    -> index {
  %c3 = arith.constant 3 : index
  %0 = memref.reshape %arg0(%arg1)
      : (memref<*xf32>, memref<?xindex>) -> memref<*xf32>
  // Update the shape to test that he load ends up in the right place.
  memref.store %c3, %arg1[%c3] : memref<?xindex>
  %1 = memref.dim %0, %c3 : memref<*xf32>
  return %1 : index
}

// -----

// Test case: Folding of memref.dim(memref.reshape %v %shp, %idx) -> memref.load %shp[%idx]
func.func @dim_of_memref_reshape_i32(%arg0: memref<*xf32>, %arg1: memref<?xi32>)
    -> index {
  %c3 = arith.constant 3 : index
  %0 = memref.reshape %arg0(%arg1)
      : (memref<*xf32>, memref<?xi32>) -> memref<*xf32>
  %1 = memref.dim %0, %c3 : memref<*xf32>
  return %1 : index
}

// -----

// Test case: memref.dim(memref.reshape %v %shp, %idx) -> memref.load %shp[%idx]
func.func @dim_of_memref_reshape_block_arg_index(%arg0: memref<*xf32>, %arg1: memref<?xindex>, %arg2: index) -> index {
  %reshape = memref.reshape %arg0(%arg1) : (memref<*xf32>, memref<?xindex>) -> memref<*xf32>
  %dim = memref.dim %reshape, %arg2 : memref<*xf32>
  return %dim : index
}

// -----

// Test case: memref.dim(memref.reshape %v %shp, %idx) is not folded into memref.load %shp[%idx]
func.func @dim_of_memref_reshape_for( %arg0: memref<*xf32>, %arg1: memref<?xindex>) -> index {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index

    %0 = memref.reshape %arg0(%arg1) : (memref<*xf32>, memref<?xindex>) -> memref<*xf32>

    %1 = scf.for %arg2 = %c0 to %c4 step %c1 iter_args(%arg3 = %c1) -> (index) {
      %2 = memref.dim %0, %arg2 : memref<*xf32>
      %3 = arith.muli %arg3, %2 : index
      scf.yield %3 : index
    }
    return %1 : index
}

// -----

// Test case: memref.dim(memref.reshape %v %shp, %idx) is not folded into memref.load %shp[%idx]
func.func @dim_of_memref_reshape_undominated(%arg0: memref<*xf32>, %arg1: memref<?xindex>, %arg2: index) -> index {
    %c4 = arith.constant 4 : index
    %reshape = memref.reshape %arg0(%arg1) : (memref<*xf32>, memref<?xindex>) -> memref<*xf32>
    %0 = arith.muli %arg2, %c4 : index
    %dim = memref.dim %reshape, %0 : memref<*xf32>
    return %dim : index
  }

// -----

func.func @alloc_const_fold() -> memref<?xf32> {
  %c4 = arith.constant 4 : index
  %a = memref.alloc(%c4) : memref<?xf32>

  return %a : memref<?xf32>
}

// -----

func.func @alloc_alignment_const_fold() -> memref<?xf32> {
  %c4 = arith.constant 4 : index
  %a = memref.alloc(%c4) {alignment = 4096 : i64} : memref<?xf32>

  return %a : memref<?xf32>
}

// -----

func.func @alloc_const_fold_with_symbols1(%arg0 : index) -> memref<?xi32, strided<[?], offset: ?>> {
  %c1 = arith.constant 1 : index
  %0 = memref.alloc(%arg0)[%c1, %c1] : memref<?xi32, strided<[?], offset: ?>>
  return %0 : memref<?xi32, strided<[?], offset: ?>>
}

// -----

func.func @alloc_const_fold_with_symbols2() -> memref<?xi32, strided<[?], offset: ?>> {
  %c1 = arith.constant 1 : index
  %0 = memref.alloc(%c1)[%c1, %c1] : memref<?xi32, strided<[?], offset: ?>>
  return %0 : memref<?xi32, strided<[?], offset: ?>>
}

// -----
func.func @allocator(%arg0 : memref<memref<?xi32>>, %arg1 : index)  {
  %0 = memref.alloc(%arg1) : memref<?xi32>
  memref.store %0, %arg0[] : memref<memref<?xi32>>
  return
}

// -----

func.func @compose_collapse_of_collapse_zero_dim(%arg0 : memref<1x1x1xf32>)
    -> memref<f32> {
  %0 = memref.collapse_shape %arg0 [[0, 1, 2]]
      : memref<1x1x1xf32> into memref<1xf32>
  %1 = memref.collapse_shape %0 [] : memref<1xf32> into memref<f32>
  return %1 : memref<f32>
}

// -----

func.func @compose_collapse_of_collapse(%arg0 : memref<?x?x?x?x?xf32>)
    -> memref<?x?xf32> {
  %0 = memref.collapse_shape %arg0 [[0, 1], [2], [3, 4]]
      : memref<?x?x?x?x?xf32> into memref<?x?x?xf32>
  %1 = memref.collapse_shape %0 [[0, 1], [2]]
      : memref<?x?x?xf32> into memref<?x?xf32>
  return %1 : memref<?x?xf32>
}

// -----

func.func @compose_collapse_of_expand_partially_dynamic(%arg0: memref<?xf16>, %arg1: index, %arg2: index) -> memref<8x?x?xf16> {
  %expanded = memref.expand_shape %arg0 [[0, 1, 2, 3, 4]] output_shape [4, 2, %arg1, %arg2, 32] : memref<?xf16> into memref<4x2x?x?x32xf16>
  %collapsed = memref.collapse_shape %expanded [[0, 1], [2], [3, 4]] : memref<4x2x?x?x32xf16> into memref<8x?x?xf16>
  return %collapsed : memref<8x?x?xf16>
}

// -----

func.func @do_not_compose_collapse_of_expand_non_identity_layout(
    %arg0: memref<?x?xf32, strided<[?, 1], offset: 0>>, %sz0: index, %sz1: index)
    -> memref<?xf32, strided<[?], offset: 0>> {
  %1 = memref.expand_shape %arg0 [[0, 1], [2]] output_shape [%sz0, 4, %sz1] :
    memref<?x?xf32, strided<[?, 1], offset: 0>> into
    memref<?x4x?xf32, strided<[?, ?, 1], offset: 0>>
  %2 = memref.collapse_shape %1 [[0, 1, 2]] :
    memref<?x4x?xf32, strided<[?, ?, 1], offset: 0>> into
    memref<?xf32, strided<[?], offset: 0>>
  return %2 : memref<?xf32, strided<[?], offset: 0>>
}

// -----

func.func @compose_expand_of_expand(%arg0 : memref<?x?xf32>, %sz0: index, %sz1: index, %sz2: index, %sz3: index)
    -> memref<?x6x4x5x?xf32> {
  %0 = memref.expand_shape %arg0 [[0, 1], [2]] output_shape [%sz0, 4, %sz1]
      : memref<?x?xf32> into memref<?x4x?xf32>
  %1 = memref.expand_shape %0 [[0, 1], [2], [3, 4]] output_shape [%sz2, 6, 4, 5, %sz3] : memref<?x4x?xf32> into memref<?x6x4x5x?xf32>
  return %1 : memref<?x6x4x5x?xf32>
}

// -----

func.func @compose_expand_of_expand_of_zero_dim(%arg0 : memref<f32>)
    -> memref<1x1x1xf32> {
  %0 = memref.expand_shape %arg0 [] output_shape [1] : memref<f32> into memref<1xf32>
  %1 = memref.expand_shape %0 [[0, 1, 2]] output_shape [1, 1, 1]
      : memref<1xf32> into memref<1x1x1xf32>
  return %1 : memref<1x1x1xf32>
}

// -----

func.func @fold_collapse_of_expand(%arg0 : memref<12x4xf32>) -> memref<12x4xf32> {
  %0 = memref.expand_shape %arg0 [[0, 1], [2]] output_shape [3, 4, 4]
      : memref<12x4xf32> into memref<3x4x4xf32>
  %1 = memref.collapse_shape %0 [[0, 1], [2]]
      : memref<3x4x4xf32> into memref<12x4xf32>
  return %1 : memref<12x4xf32>
}

// -----

func.func @fold_collapse_collapse_of_expand(%arg0 : memref<?x?xf32>, %sz0: index, %sz1: index)
    -> memref<?x?xf32> {
  %0 = memref.expand_shape %arg0 [[0, 1], [2]] output_shape [%sz0, 4, %sz1]
      : memref<?x?xf32> into memref<?x4x?xf32>
  %1 = memref.collapse_shape %0 [[0, 1], [2]]
      : memref<?x4x?xf32> into memref<?x?xf32>
  return %1 : memref<?x?xf32>
}

// -----

func.func @fold_memref_expand_cast(%arg0 : memref<?x?xf32>) -> memref<2x4x4xf32> {
  %0 = memref.cast %arg0 : memref<?x?xf32> to memref<8x4xf32>
  %1 = memref.expand_shape %0 [[0, 1], [2]] output_shape [2, 4, 4]
      : memref<8x4xf32> into memref<2x4x4xf32>
  return %1 : memref<2x4x4xf32>
}


// -----

func.func @fold_memref_expand_with_static_to_dynamic_cast(%arg0: memref<8x4xf32>) -> memref<2x1x4x4xf32> {
  %c2 = arith.constant 2 : index
  %cast = memref.cast %arg0 : memref<8x4xf32> to memref<?x4xf32>
  %expand_shape = memref.expand_shape %cast [[0, 1, 2], [3]] output_shape [%c2, 1, 4, 4]
      : memref<?x4xf32> into memref<?x1x4x4xf32>
  %cast_0 = memref.cast %expand_shape : memref<?x1x4x4xf32> to memref<2x1x4x4xf32>
  return %cast_0 : memref<2x1x4x4xf32>
}

// -----

func.func @fold_memref_expand_static_to_dynamic_partial(%arg0 : memref<8x?xf32>) -> memref<1x8x1x?xf32> {
  %0 = memref.cast %arg0 : memref<8x?xf32> to memref<?x?xf32>
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %dim0 = memref.dim %0, %c0 : memref<?x?xf32>
  %dim1 = memref.dim %0, %c1 : memref<?x?xf32>
  %1 = memref.expand_shape %0 [[0, 1], [2, 3]] output_shape [1, %dim0, 1, %dim1]
      : memref<?x?xf32> into memref<1x?x1x?xf32>
  %2 = memref.cast %1 : memref<1x?x1x?xf32> to memref<1x8x1x?xf32>
  return %2 : memref<1x8x1x?xf32>
}

// -----

func.func @fold_memref_expand_static_to_dynamic_partial_with_arith_const_as_dim(%arg0 : memref<8x?xf32>) -> memref<1x8x1x?xf32> {
  %0 = memref.cast %arg0 : memref<8x?xf32> to memref<?x?xf32>
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %dim0 = memref.dim %0, %c0 : memref<?x?xf32>
  %dim1 = memref.dim %0, %c1 : memref<?x?xf32>
  %1 = memref.expand_shape %0 [[0, 1], [2, 3]] output_shape [%c1, %dim0, %c1, %dim1]
      : memref<?x?xf32> into memref<?x?x?x?xf32>
  %2 = memref.cast %1 : memref<?x?x?x?xf32> to memref<1x8x1x?xf32>
  return %2 : memref<1x8x1x?xf32>
}

// -----

func.func @fold_memref_expand_static_to_dynamic_multiple(%arg0 : memref<8x?xf32>, %arg1 : index, %arg2 : index) -> memref<8x1x?x?xf32> {
  %0 = memref.cast %arg0 : memref<8x?xf32> to memref<?x?xf32>
  %c0 = arith.constant 0 : index
  %dim0 = memref.dim %0, %c0 : memref<?x?xf32>
  %1 = memref.expand_shape %0 [[0, 1], [2, 3]] output_shape [%dim0, 1, %arg1, %arg2]
      : memref<?x?xf32> into memref<?x1x?x?xf32>
  %2 = memref.cast %1 : memref<?x1x?x?xf32> to memref<8x1x?x?xf32>
  return %2 : memref<8x1x?x?xf32>
}

// -----

func.func @not_fold_memref_expand_with_dynamic_to_static_cast(%arg0 : memref<?x4xf32>) -> memref<2x1x4x4xf32> {
  %0 = memref.cast %arg0 : memref<?x4xf32> to memref<8x4xf32>
  %1 = memref.expand_shape %0 [[0, 1, 2], [3]] output_shape [2, 1, 4, 4]
      : memref<8x4xf32> into memref<2x1x4x4xf32>
  return %1 : memref<2x1x4x4xf32>
}

// -----

func.func @not_fold_memref_expand_static_to_dynamic_cast_if_really_dynamic(%arg0 : memref<8x4xf32>, %arg1 : index) -> memref<2x1x4x4xf32> {
  %0 = memref.cast %arg0 : memref<8x4xf32> to memref<?x4xf32>
  %c0 = arith.constant 0 : index
  %dim0 = memref.dim %0, %c0 : memref<?x4xf32>
  %dim_ext = arith.divui %dim0 , %arg1: index
  %1 = memref.expand_shape %0 [[0, 1, 2], [3]] output_shape [%dim_ext, 1, 4, 4]
      : memref<?x4xf32> into memref<?x1x4x4xf32>
  %2 = memref.cast %1 : memref<?x1x4x4xf32> to memref<2x1x4x4xf32>
  return %2 : memref<2x1x4x4xf32>
}

// -----

func.func @fold_memref_expand_static_to_dynamic_layout(%arg0 : memref<8x4xf32>) -> memref<8x1x4xf32> {
  %0 = memref.cast %arg0 : memref<8x4xf32> to memref<8x4xf32, strided<[?, ?], offset: ?>>
  %1 = memref.expand_shape %0 [[0, 1], [2]] output_shape [8, 1, 4]
      : memref<8x4xf32, strided<[?, ?], offset: ?>> into memref<8x1x4xf32, strided<[?,?,?], offset: ?>>
  %2 = memref.cast %1 : memref<8x1x4xf32, strided<[?,?,?], offset: ?>> to memref<8x1x4xf32>
  return %2 : memref<8x1x4xf32>
}

// -----

func.func @collapse_after_memref_cast_type_change(%arg0 : memref<?x512x1x1xf32>) -> memref<?x?xf32> {
  %dynamic = memref.cast %arg0: memref<?x512x1x1xf32> to memref<?x?x?x?xf32>
  %collapsed = memref.collapse_shape %dynamic [[0], [1, 2, 3]] : memref<?x?x?x?xf32> into memref<?x?xf32>
  return %collapsed : memref<?x?xf32>
}

// -----

func.func @collapse_after_memref_cast(%arg0 : memref<?x512x1x?xf32>) -> memref<?x?xf32> {
  %dynamic = memref.cast %arg0: memref<?x512x1x?xf32> to memref<?x?x?x?xf32>
  %collapsed = memref.collapse_shape %dynamic [[0], [1, 2, 3]] : memref<?x?x?x?xf32> into memref<?x?xf32>
  return %collapsed : memref<?x?xf32>
}

// -----

func.func @collapse_after_memref_cast_type_change_dynamic(%arg0: memref<1x1x1x?xi64>) -> memref<?x?xi64> {
  %casted = memref.cast %arg0 : memref<1x1x1x?xi64> to memref<1x1x?x?xi64>
  %collapsed = memref.collapse_shape %casted [[0, 1, 2], [3]] : memref<1x1x?x?xi64> into memref<?x?xi64>
  return %collapsed : memref<?x?xi64>
}

// -----

func.func @reduced_memref(%arg0: memref<2x5x7x1xf32>, %arg1 :index)
    -> memref<1x4x1xf32, strided<[35, 7, 1], offset: ?>> {
  %c0 = arith.constant 0 : index
  %c5 = arith.constant 5 : index
  %c4 = arith.constant 4 : index
  %c2 = arith.constant 2 : index
  %c1 = arith.constant 1 : index
  %0 = memref.subview %arg0[%arg1, %arg1, %arg1, 0] [%c1, %c4, %c1, 1] [1, 1, 1, 1]
      : memref<2x5x7x1xf32> to memref<?x?x?xf32, strided<[35, 7, 1], offset: ?>>
  %1 = memref.cast %0
      : memref<?x?x?xf32, strided<[35, 7, 1], offset: ?>> to
        memref<1x4x1xf32, strided<[35, 7, 1], offset: ?>>
  return %1 : memref<1x4x1xf32, strided<[35, 7, 1], offset: ?>>
}


// -----

func.func @fold_rank_memref(%arg0 : memref<?x?xf32>) -> (index) {
  // Fold a rank into a constant
  %rank_0 = memref.rank %arg0 : memref<?x?xf32>

  return %rank_0 : index
}

// -----

func.func @fold_no_op_subview(%arg0 : memref<20x42xf32>) -> memref<20x42xf32, strided<[42, 1]>> {
  %0 = memref.subview %arg0[0, 0] [20, 42] [1, 1] : memref<20x42xf32> to memref<20x42xf32, strided<[42, 1]>>
  return %0 : memref<20x42xf32, strided<[42, 1]>>
}

// -----

func.func @no_fold_subview_with_non_zero_offset(%arg0 : memref<20x42xf32>) -> memref<20x41xf32, strided<[42, 1], offset: 1>> {
  %0 = memref.subview %arg0[0, 1] [20, 41] [1, 1] : memref<20x42xf32> to memref<20x41xf32, strided<[42, 1], offset: 1>>
  return %0 : memref<20x41xf32, strided<[42, 1], offset: 1>>
}

// -----

func.func @no_fold_subview_with_non_unit_stride(%arg0 : memref<20x42xf32>) -> memref<20x5xf32, strided<[42, 2]>> {
  %0 = memref.subview %arg0[0, 0] [20, 5] [1, 2] : memref<20x42xf32> to memref<20x5xf32, strided<[42, 2]>>
  return %0 : memref<20x5xf32, strided<[42, 2]>>
}

// -----

func.func @no_fold_invalid_dynamic_slice(%arg0: memref<10xf32>) -> memref<?xf32, strided<[1], offset: 2>> {
  %c11 = arith.constant 11 : index
  %0 = memref.subview %arg0 [2][%c11][1] : memref<10xf32> to memref<?xf32, strided<[1], offset: 2>>
  func.return %0 : memref<?xf32, strided<[1], offset: 2>>
}

// -----

func.func @no_fold_dynamic_no_op_subview(%arg0 : memref<?x?xf32>) -> memref<?x?xf32, strided<[?, 1]>> {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %0 = memref.dim %arg0, %c0 : memref<?x?xf32>
  %1 = memref.dim %arg0, %c1 : memref<?x?xf32>
  %2 = memref.subview %arg0[0, 0] [%0, %1] [1, 1] : memref<?x?xf32> to memref<?x?xf32, strided<[?, 1]>>
  return %2 : memref<?x?xf32, strided<[?, 1]>>
}

// -----

func.func @atomicrmw_cast_fold(%arg0 : f32, %arg1 : memref<4xf32>, %c : index) {
  %v = memref.cast %arg1 : memref<4xf32> to memref<?xf32>
  %a = memref.atomic_rmw addf %arg0, %v[%c] : (f32, memref<?xf32>) -> f32
  return
}


// -----

func.func @copy_of_cast(%m1: memref<?xf32>, %m2: memref<*xf32>) {
  %casted1 = memref.cast %m1 : memref<?xf32> to memref<?xf32, strided<[?], offset: ?>>
  %casted2 = memref.cast %m2 : memref<*xf32> to memref<?xf32, strided<[?], offset: ?>>
  memref.copy %casted1, %casted2 : memref<?xf32, strided<[?], offset: ?>> to memref<?xf32, strided<[?], offset: ?>>
  return
}


// -----

func.func @self_copy(%m1: memref<?xf32>) {
  memref.copy %m1, %m1 : memref<?xf32> to memref<?xf32>
  return
}


// -----

func.func @empty_copy(%m1: memref<0x10xf32>, %m2: memref<?x10xf32>) {
  memref.copy %m1, %m2 : memref<0x10xf32> to memref<?x10xf32>
  memref.copy %m2, %m1 : memref<?x10xf32> to memref<0x10xf32>
  return
}

// -----

func.func @scopeMerge() {
  memref.alloca_scope {
    %cnt = "test.count"() : () -> index
    %a = memref.alloca(%cnt) : memref<?xi64>
    "test.use"(%a) : (memref<?xi64>) -> ()
  }
  return
}

// -----

func.func @scopeMerge2() {
  "test.region"() ({
    memref.alloca_scope {
      %cnt = "test.count"() : () -> index
      %a = memref.alloca(%cnt) : memref<?xi64>
      "test.use"(%a) : (memref<?xi64>) -> ()
    }
    "test.terminator"() : () -> ()
  }) : () -> ()
  return
}


// -----

func.func @scopeMerge3() {
  %cnt = "test.count"() : () -> index
  "test.region"() ({
    memref.alloca_scope {
      %a = memref.alloca(%cnt) : memref<?xi64>
      "test.use"(%a) : (memref<?xi64>) -> ()
    }
    "test.terminator"() : () -> ()
  }) : () -> ()
  return
}


// -----

func.func @scopeMerge4() {
  %cnt = "test.count"() : () -> index
  "test.region"() ({
    memref.alloca_scope {
      %a = memref.alloca(%cnt) : memref<?xi64>
      "test.use"(%a) : (memref<?xi64>) -> ()
    }
    "test.op"() : () -> ()
    "test.terminator"() : () -> ()
  }) : () -> ()
  return
}


// -----

func.func @scopeMerge5() {
  "test.region"() ({
    memref.alloca_scope {
      affine.parallel (%arg) = (0) to (64) {
        %a = memref.alloca(%arg) : memref<?xi64>
        "test.use"(%a) : (memref<?xi64>) -> ()
      }
    }
    "test.op"() : () -> ()
    "test.terminator"() : () -> ()
  }) : () -> ()
  return
}


// -----

func.func @scopeInline(%arg : memref<index>) {
  %cnt = "test.count"() : () -> index
  "test.region"() ({
    memref.alloca_scope {
      memref.store %cnt, %arg[] : memref<index>
    }
    "test.terminator"() : () -> ()
  }) : () -> ()
  return
}


// -----

// Ensure this case not crash.

func.func @scope_merge_without_terminator() {
  "test.region"() ({
    memref.alloca_scope {
      %cnt = "test.count"() : () -> index
      %a = memref.alloca(%cnt) : memref<?xi64>
      "test.use"(%a) : (memref<?xi64>) -> ()
    }
  }) : () -> ()
  return
}

// -----

// Check that we simplify extract_strided_metadata of cast
// when the source of the cast is compatible with what
// `extract_strided_metadata`s accept.
//
// When we apply the transformation the resulting offset, sizes and strides
// should come straight from the inputs of the cast.
// Additionally the folder on extract_strided_metadata should propagate the
// static information.
//
//
//
func.func @extract_strided_metadata_of_cast(
  %arg : memref<3x?xi32, strided<[4, ?], offset:?>>)
  -> (memref<i32>, index,
      index, index,
      index, index) {

  %cast =
    memref.cast %arg :
      memref<3x?xi32, strided<[4, ?], offset: ?>> to
      memref<?x?xi32, strided<[?, ?], offset: ?>>

  %base, %base_offset, %sizes:2, %strides:2 =
    memref.extract_strided_metadata %cast:memref<?x?xi32, strided<[?, ?], offset: ?>>
    -> memref<i32>, index,
       index, index,
       index, index

  return %base, %base_offset,
    %sizes#0, %sizes#1,
    %strides#0, %strides#1 :
      memref<i32>, index,
      index, index,
      index, index
}

// -----

// Check that we simplify extract_strided_metadata of cast
// when the source of the cast is compatible with what
// `extract_strided_metadata`s accept.
//
// Same as extract_strided_metadata_of_cast but with constant sizes and strides
// in the destination type.
//
//
//
func.func @extract_strided_metadata_of_cast_w_csts(
  %arg : memref<?x?xi32, strided<[?, ?], offset:?>>)
  -> (memref<i32>, index,
      index, index,
      index, index) {

  %cast =
    memref.cast %arg :
      memref<?x?xi32, strided<[?, ?], offset: ?>> to
      memref<4x?xi32, strided<[?, 18], offset: 25>>

  %base, %base_offset, %sizes:2, %strides:2 =
    memref.extract_strided_metadata %cast:memref<4x?xi32, strided<[?, 18], offset: 25>>
    -> memref<i32>, index,
       index, index,
       index, index

  return %base, %base_offset,
    %sizes#0, %sizes#1,
    %strides#0, %strides#1 :
      memref<i32>, index,
      index, index,
      index, index
}

// -----

// Check that we don't simplify extract_strided_metadata of
// cast when the source of the cast is unranked.
// Unranked memrefs cannot feed into extract_strided_metadata operations.
// Note: Technically we could still fold the sizes and strides.
//
//
//
func.func @extract_strided_metadata_of_cast_unranked(
  %arg : memref<*xi32>)
  -> (memref<i32>, index,
      index, index,
      index, index) {

  %cast =
    memref.cast %arg :
      memref<*xi32> to
      memref<?x?xi32, strided<[?, ?], offset: ?>>

  %base, %base_offset, %sizes:2, %strides:2 =
    memref.extract_strided_metadata %cast:memref<?x?xi32, strided<[?, ?], offset: ?>>
    -> memref<i32>, index,
       index, index,
       index, index

  return %base, %base_offset,
    %sizes#0, %sizes#1,
    %strides#0, %strides#1 :
      memref<i32>, index,
      index, index,
      index, index
}

// -----

func.func @reinterpret_noop(%arg : memref<2x3x4xf32>) -> memref<2x3x4xf32> {
  %0 = memref.reinterpret_cast %arg to offset: [0], sizes: [2, 3, 4], strides: [12, 4, 1] : memref<2x3x4xf32> to memref<2x3x4xf32>
  return %0 : memref<2x3x4xf32>
}

// -----

func.func @reinterpret_constant_fold(%arg0: memref<f32>) -> memref<?x?xf32, strided<[?, ?], offset: ?>> {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c100 = arith.constant 100 : index
  %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [%c0], sizes: [%c100, %c100], strides: [%c100, %c1] : memref<f32> to memref<?x?xf32, strided<[?, ?], offset: ?>>
  return %reinterpret_cast : memref<?x?xf32, strided<[?, ?], offset: ?>>
}

// -----

func.func @reinterpret_of_reinterpret(%arg : memref<?xi8>, %size1: index, %size2: index) -> memref<?xi8> {
  %0 = memref.reinterpret_cast %arg to offset: [0], sizes: [%size1], strides: [1] : memref<?xi8> to memref<?xi8>
  %1 = memref.reinterpret_cast %0 to offset: [0], sizes: [%size2], strides: [1] : memref<?xi8> to memref<?xi8>
  return %1 : memref<?xi8>
}

// -----

func.func @reinterpret_of_cast(%arg : memref<?xi8>, %size: index) -> memref<?xi8> {
  %0 = memref.cast %arg : memref<?xi8> to memref<5xi8>
  %1 = memref.reinterpret_cast %0 to offset: [0], sizes: [%size], strides: [1] : memref<5xi8> to memref<?xi8>
  return %1 : memref<?xi8>
}

// -----

func.func @reinterpret_of_subview(%arg : memref<?xi8>, %size1: index, %size2: index) -> memref<?xi8> {
  %0 = memref.subview %arg[0] [%size1] [1] : memref<?xi8> to memref<?xi8>
  %1 = memref.reinterpret_cast %0 to offset: [0], sizes: [%size2], strides: [1] : memref<?xi8> to memref<?xi8>
  return %1 : memref<?xi8>
}

// -----

// Check that a reinterpret cast of an equivalent extract strided metadata
// is canonicalized to a plain cast when the destination type is different
// than the type of the original memref.
func.func @reinterpret_of_extract_strided_metadata_w_type_mistach(%arg0 : memref<8x2xf32>) -> memref<?x?xf32, strided<[?, ?], offset: ?>> {
  %base, %offset, %sizes:2, %strides:2 = memref.extract_strided_metadata %arg0 : memref<8x2xf32> -> memref<f32>, index, index, index, index, index
  %m2 = memref.reinterpret_cast %base to offset: [%offset], sizes: [%sizes#0, %sizes#1], strides: [%strides#0, %strides#1] : memref<f32> to memref<?x?xf32, strided<[?, ?], offset: ?>>
  return %m2 : memref<?x?xf32, strided<[?, ?], offset: ?>>
}

// -----

// Similar to reinterpret_of_extract_strided_metadata_w_type_mistach except that
// we check that the match happen when the static information has been folded.
// E.g., in this case, we know that size of dim 0 is 8 and size of dim 1 is 2.
// So even if we don't use the values sizes#0, sizes#1, as long as they have the
// same constant value, the match is valid.
func.func @reinterpret_of_extract_strided_metadata_w_constants(%arg0 : memref<8x2xf32>) -> memref<?x?xf32, strided<[?, ?], offset: ?>> {
  %base, %offset, %sizes:2, %strides:2 = memref.extract_strided_metadata %arg0 : memref<8x2xf32> -> memref<f32>, index, index, index, index, index
  %c8 = arith.constant 8: index
  %m2 = memref.reinterpret_cast %base to offset: [0], sizes: [%c8, 2], strides: [2, %strides#1] : memref<f32> to memref<?x?xf32, strided<[?, ?], offset: ?>>
  return %m2 : memref<?x?xf32, strided<[?, ?], offset: ?>>
}
// -----

// Check that a reinterpret cast of an equivalent extract strided metadata
// is completely removed when the original memref has the same type.
func.func @reinterpret_of_extract_strided_metadata_same_type(%arg0 : memref<?x?xf32, strided<[?,?], offset: ?>>) -> memref<?x?xf32, strided<[?,?], offset: ?>> {
  %base, %offset, %sizes:2, %strides:2 = memref.extract_strided_metadata %arg0 : memref<?x?xf32, strided<[?,?], offset: ?>> -> memref<f32>, index, index, index, index, index
  %m2 = memref.reinterpret_cast %base to offset: [%offset], sizes: [%sizes#0, %sizes#1], strides: [%strides#0, %strides#1] : memref<f32> to memref<?x?xf32, strided<[?,?], offset:?>>
  return %m2 : memref<?x?xf32, strided<[?,?], offset:?>>
}

// -----

// Check that we don't simplify reinterpret cast of extract strided metadata
// when the strides don't match.
func.func @reinterpret_of_extract_strided_metadata_w_different_stride(%arg0 : memref<8x2xf32>) -> memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>> {
  %base, %offset, %sizes:2, %strides:2 = memref.extract_strided_metadata %arg0 : memref<8x2xf32> -> memref<f32>, index, index, index, index, index
  %m2 = memref.reinterpret_cast %base to offset: [%offset], sizes: [4, 2, 2], strides: [1, 1, %strides#1] : memref<f32> to memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>
  return %m2 : memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>
}
// -----

// Check that we don't simplify reinterpret cast of extract strided metadata
// when the offset doesn't match.
func.func @reinterpret_of_extract_strided_metadata_w_different_offset(%arg0 : memref<8x2xf32>) -> memref<?x?xf32, strided<[?, ?], offset: ?>> {
  %base, %offset, %sizes:2, %strides:2 = memref.extract_strided_metadata %arg0 : memref<8x2xf32> -> memref<f32>, index, index, index, index, index
  %m2 = memref.reinterpret_cast %base to offset: [1], sizes: [%sizes#0, %sizes#1], strides: [%strides#0, %strides#1] : memref<f32> to memref<?x?xf32, strided<[?, ?], offset: ?>>
  return %m2 : memref<?x?xf32, strided<[?, ?], offset: ?>>
}

// -----

// Check that reinterpret_cast with a negative constant size.
// Folding would attempt to create a MemRefType with a negative static dimension,
// which triggers an assertion in MemRefType::get (issue #188407).
func.func @reinterpret_cast_with_negative_size(%arg0: memref<2x3xf32>) -> memref<?x?xf32, strided<[?, ?], offset: ?>> {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %sz = arith.constant -1 : index
  %output = memref.reinterpret_cast %arg0 to
            offset: [%c0], sizes: [%c1, %sz], strides: [%sz, %c1]
            : memref<2x3xf32> to memref<?x?xf32, strided<[?, ?], offset: ?>>
  return %output : memref<?x?xf32, strided<[?, ?], offset: ?>>
}

// -----

// Check that reinterpret_cast with a negative constant offset.
// Folding would create an op with a static negative offset, which violates the
// ViewLikeInterface constraint that offsets must be non-negative.
func.func @reinterpret_cast_with_negative_offset(%arg0: memref<2x3xf32>) -> memref<?x?xf32, strided<[?, ?], offset: ?>> {
  %c1 = arith.constant 1 : index
  %c2 = arith.constant 2 : index
  %neg = arith.constant -1 : index
  %output = memref.reinterpret_cast %arg0 to
            offset: [%neg], sizes: [%c1, %c2], strides: [%c2, %c1]
            : memref<2x3xf32> to memref<?x?xf32, strided<[?, ?], offset: ?>>
  return %output : memref<?x?xf32, strided<[?, ?], offset: ?>>
}

// -----

// Check that reinterpret_cast with a negative constant size and offset.
func.func @reinterpret_cast_with_negative_size_and_offset(%arg0: memref<2x3xf32>) -> memref<?x?xf32, strided<[?, ?], offset: ?>> {
  %c1 = arith.constant 1 : index
  %c2 = arith.constant 2 : index
  %neg = arith.constant -1 : index
  %output = memref.reinterpret_cast %arg0 to
            offset: [%neg], sizes: [%c1, %neg], strides: [%c2, %c1]
            : memref<2x3xf32> to memref<?x?xf32, strided<[?, ?], offset: ?>>
  return %output : memref<?x?xf32, strided<[?, ?], offset: ?>>
}

// -----

// Check that reinterpret_cast with all negative constant size and offset is not
// folded.
func.func @reinterpret_cast_no_fold_with_all_negative_size_and_offset(%arg0: memref<2x3xf32>) -> memref<?x?xf32, strided<[?, ?], offset: ?>> {
  %neg = arith.constant -1 : index
  %output = memref.reinterpret_cast %arg0 to
            offset: [%neg], sizes: [%neg, %neg], strides: [2, 1]
            : memref<2x3xf32> to memref<?x?xf32, strided<[?, ?], offset: ?>>
  return %output : memref<?x?xf32, strided<[?, ?], offset: ?>>
}

// -----

// Check that reinterpret_cast with a negative constant stride IS folded.
// Negative strides are valid in MemRef layouts (e.g. reverse iteration),
// and the ViewLikeInterface places no non-negativity constraint on strides.
func.func @reinterpret_cast_fold_negative_stride(%arg0: memref<2x3xf32>) -> memref<?x?xf32, strided<[?, ?], offset: ?>> {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c2 = arith.constant 2 : index
  %neg = arith.constant -1 : index
  %output = memref.reinterpret_cast %arg0 to
            offset: [%c0], sizes: [%c1, %c2], strides: [%neg, %c1]
            : memref<2x3xf32> to memref<?x?xf32, strided<[?, ?], offset: ?>>
  return %output : memref<?x?xf32, strided<[?, ?], offset: ?>>
}

// -----

func.func @canonicalize_rank_reduced_subview(%arg0 : memref<8x?xf32>,
    %arg1 : index) -> memref<?xf32, strided<[?], offset: ?>> {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %0 = memref.subview %arg0[%c0, %c0] [1, %arg1] [%c1, %c1] : memref<8x?xf32> to memref<?xf32, strided<[?], offset: ?>>
  return %0 :  memref<?xf32, strided<[?], offset: ?>>
}

// -----

func.func @memref_realloc_dead(%src : memref<2xf32>, %v : f32) -> memref<2xf32>{
  %0 = memref.realloc %src : memref<2xf32> to memref<4xf32>
  %i2 = arith.constant 2 : index
  memref.store %v, %0[%i2] : memref<4xf32>
  return %src : memref<2xf32>
}

// -----

func.func @collapse_expand_fold_to_cast(%m: memref<?xf32, strided<[1]>, 3>, %sz0: index)
    -> (memref<?xf32, 3>)
{
  %0 = memref.expand_shape %m [[0, 1]] output_shape [1, %sz0]
      : memref<?xf32, strided<[1]>, 3> into memref<1x?xf32, 3>
  %1 = memref.collapse_shape %0 [[0, 1]]
      : memref<1x?xf32, 3> into memref<?xf32, 3>
  return %1 : memref<?xf32, 3>
}

// -----


func.func @expand_collapse_fold_to_internal_stride_cast(%m: memref<3x1x2x384xui8, strided<[1179648, 768, 384, 1]>>)
    -> (memref<3x1x2x384xui8, strided<[1179648, 1179648, 384, 1]>>)
  {
  %0 = memref.collapse_shape %m [[0, 1], [2], [3]]
      : memref<3x1x2x384xui8, strided<[1179648, 768, 384, 1]>>
        into memref<3x2x384xui8, strided<[1179648, 384, 1]>>
  %1 = memref.expand_shape %0 [[0, 1], [2], [3]] output_shape [3, 1, 2, 384]
      : memref<3x2x384xui8, strided<[1179648, 384, 1]>>
        into memref<3x1x2x384xui8, strided<[1179648, 1179648, 384, 1]>>
  return %1 : memref<3x1x2x384xui8, strided<[1179648, 1179648, 384, 1]>>
}

// -----


func.func @expand_collapse_fold_to_outermost_stride_cast(%m: memref<1x3x2x384xui8, strided<[1179648, 768, 384, 1]>>)
    -> (memref<1x3x2x384xui8, strided<[2304, 768, 384, 1]>>)
  {
  %0 = memref.collapse_shape %m [[0, 1], [2], [3]]
      : memref<1x3x2x384xui8, strided<[1179648, 768, 384, 1]>>
        into memref<3x2x384xui8, strided<[768, 384, 1]>>
  %1 = memref.expand_shape %0 [[0, 1], [2], [3]] output_shape [1, 3, 2, 384]
      : memref<3x2x384xui8, strided<[768, 384, 1]>>
        into memref<1x3x2x384xui8, strided<[2304, 768, 384, 1]>>
  return %1 : memref<1x3x2x384xui8, strided<[2304, 768, 384, 1]>>
}

// -----


func.func @expand_collapse_do_not_fold_to_cast(%m: memref<1x3x2x384xui8, strided<[1179648, 768, 384, 1]>>)
    -> (memref<3x1x2x384xui8, strided<[768, 768, 384, 1]>>)
  {
  %0 = memref.collapse_shape %m [[0, 1], [2], [3]]
      : memref<1x3x2x384xui8, strided<[1179648, 768, 384, 1]>>
        into memref<3x2x384xui8, strided<[768, 384, 1]>>
  %1 = memref.expand_shape %0 [[0, 1], [2], [3]] output_shape [3, 1, 2, 384]
      : memref<3x2x384xui8, strided<[768, 384, 1]>>
        into memref<3x1x2x384xui8, strided<[768, 768, 384, 1]>>
  return %1 : memref<3x1x2x384xui8, strided<[768, 768, 384, 1]>>
}

// -----


func.func @expand_collapse_dynamic_do_not_fold_to_cast(%m: memref<1x?x1x32xsi8, strided<[?, 32, 32, 1]>>, %dyn_size: index)
    -> (memref<1x1x?x32xsi8, strided<[?, ?, 32, 1]>>)
  {
  %0 = memref.collapse_shape %m [[0], [1, 2], [3]]
      : memref<1x?x1x32xsi8, strided<[?, 32, 32, 1]>> into memref<1x?x32xsi8, strided<[?, 32, 1]>>
  %1 = memref.expand_shape %0 [[0, 1], [2], [3]] output_shape [1, 1, %dyn_size, 32]
      : memref<1x?x32xsi8, strided<[?, 32, 1]>> into memref<1x1x?x32xsi8, strided<[?, ?, 32, 1]>>
  return %1 : memref<1x1x?x32xsi8, strided<[?, ?, 32, 1]>>
}

// -----

func.func @fold_trivial_subviews(%m: memref<?xf32, strided<[?], offset: ?>>,
                                 %sz: index)
    -> memref<?xf32, strided<[?], offset: ?>>
{
  %0 = memref.subview %m[5] [%sz] [1]
      : memref<?xf32, strided<[?], offset: ?>>
        to memref<?xf32, strided<[?], offset: ?>>
  %1 = memref.subview %0[0] [%sz] [1]
      : memref<?xf32, strided<[?], offset: ?>>
        to memref<?xf32, strided<[?], offset: ?>>
  return %1 : memref<?xf32, strided<[?], offset: ?>>
}

// -----

func.func @load_store_nontemporal(%input : memref<32xf32, affine_map<(d0) -> (d0)>>, %output : memref<32xf32, affine_map<(d0) -> (d0)>>) {
  %1 = arith.constant 7 : index
  %2 = memref.load %input[%1] {nontemporal = true} : memref<32xf32, affine_map<(d0) -> (d0)>>
  memref.store %2, %output[%1] {nontemporal = true} : memref<32xf32, affine_map<(d0) -> (d0)>>
  func.return
}

// -----

memref.global "private" constant @__constant_32xf32 : memref<32xf32> = dense<1.000000e+00>
func.func @fold_const_splat_global() -> memref<32xf32> {
  %0 = memref.get_global @__constant_32xf32 : memref<32xf32>
  %alloc = memref.alloc() : memref<32xf32>
  %c32 = arith.constant 32 : index
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  scf.for %arg0 = %c0 to %c32 step %c1 {
    %1 = memref.load %0[%arg0] : memref<32xf32>
    memref.store %1, %alloc[%arg0] : memref<32xf32>
  }
  return %alloc : memref<32xf32>
}

// -----

func.func @fold_trivial_memory_space_cast(%arg : memref<?xf32>) -> memref<?xf32> {
  %0 = memref.memory_space_cast %arg : memref<?xf32> to memref<?xf32>
  return %0 : memref<?xf32>
}

// -----

func.func @fold_multiple_memory_space_cast(%arg : memref<?xf32>) -> memref<?xf32, 2> {
  %0 = memref.memory_space_cast %arg : memref<?xf32> to memref<?xf32, 1>
  %1 = memref.memory_space_cast %0 : memref<?xf32, 1> to memref<?xf32, 2>
  return %1 : memref<?xf32, 2>
}

// -----

func.func private @ub_negative_alloc_size() -> memref<?x?x?xi1> {
  %idx1 = index.constant 1
  %c-2 = arith.constant -2 : index
  %c15 = arith.constant 15 : index
  %alloc = memref.alloc(%c15, %c-2, %idx1) : memref<?x?x?xi1>
  return %alloc : memref<?x?x?xi1>
}

// -----

func.func @subview_rank_reduction(%arg0: memref<1x384x384xf32>, %idx: index)
    -> memref<?x?xf32, strided<[384, 1], offset: ?>> {
  %c1 = arith.constant 1 : index
  %0 = memref.subview %arg0[0, %idx, %idx] [1, %c1, %idx] [1, 1, 1]
      : memref<1x384x384xf32> to memref<?x?xf32, strided<[384, 1], offset: ?>>
  return %0 : memref<?x?xf32, strided<[384, 1], offset: ?>>
}

// -----

func.func @fold_double_transpose(%arg0: memref<1x2x3x4x5xf32>) -> memref<5x3x2x4x1xf32, strided<[1, 20, 60, 5, 120]>> {
  %0 = memref.transpose %arg0 (d0, d1, d2, d3, d4) -> (d1, d0, d4, d3, d2) : memref<1x2x3x4x5xf32> to memref<2x1x5x4x3xf32, strided<[60, 120, 1, 5, 20]>>
  %1 = memref.transpose %0 (d1, d0, d4, d3, d2) -> (d4, d2, d1, d3, d0) : memref<2x1x5x4x3xf32, strided<[60, 120, 1, 5, 20]>> to memref<5x3x2x4x1xf32, strided<[1, 20, 60, 5, 120]>>
  return %1 : memref<5x3x2x4x1xf32, strided<[1, 20, 60, 5, 120]>>
}

// -----

func.func @fold_double_transpose2(%arg0: memref<1x2x3x4x5xf32>) -> memref<5x3x2x4x1xf32, strided<[1, 20, 60, 5, 120]>> {
  %0 = memref.transpose %arg0 (d0, d1, d2, d3, d4) -> (d0, d1, d4, d3, d2) : memref<1x2x3x4x5xf32> to memref<1x2x5x4x3xf32, strided<[120, 60, 1, 5, 20]>>
  %1 = memref.transpose %0 (d0, d1, d4, d3, d2) -> (d4, d2, d1, d3, d0) : memref<1x2x5x4x3xf32, strided<[120, 60, 1, 5, 20]>> to memref<5x3x2x4x1xf32, strided<[1, 20, 60, 5, 120]>>
  return %1 : memref<5x3x2x4x1xf32, strided<[1, 20, 60, 5, 120]>>
}

// -----

func.func @fold_identity_transpose(%arg0: memref<1x2x3x4x5xf32>) -> memref<1x2x3x4x5xf32> {
  %0 = memref.transpose %arg0 (d0, d1, d2, d3, d4) -> (d1, d0, d4, d3, d2) : memref<1x2x3x4x5xf32> to memref<2x1x5x4x3xf32, strided<[60, 120, 1, 5, 20]>>
  %1 = memref.transpose %0 (d1, d0, d4, d3, d2) -> (d0, d1, d2, d3, d4) : memref<2x1x5x4x3xf32, strided<[60, 120, 1, 5, 20]>> to memref<1x2x3x4x5xf32>
  return %1 : memref<1x2x3x4x5xf32>
}

// -----

#transpose_map = affine_map<(d0, d1)[s0] -> (d0 + d1 * s0)>

func.func @cannot_fold_transpose_cast(%arg0: memref<?x4xf32>) -> memref<?x?xf32, #transpose_map> {
    %cast = memref.cast %arg0 : memref<?x4xf32> to memref<?x?xf32>
    %transpose = memref.transpose %cast (d0, d1) -> (d1, d0) : memref<?x?xf32> to memref<?x?xf32, #transpose_map>
    return %transpose : memref<?x?xf32, #transpose_map>
}

// -----

func.func @fold_assume_alignment_chain(%0: memref<128xf32>) -> memref<128xf32> {
  %1 = memref.assume_alignment %0, 16 : memref<128xf32>
  %2 = memref.assume_alignment %1, 16 : memref<128xf32>
  return %2 : memref<128xf32>
}

// -----

func.func @fold_view_cast(%0: memref<128xi8>) -> memref<i32> {
  %c0 = arith.constant 0 : index
  %1 = memref.cast %0 : memref<128xi8> to memref<?xi8>
  %res = memref.view %1[%c0][] : memref<?xi8> to memref<i32>
  return %res : memref<i32>
}

// -----

func.func @fold_view_same_source_result_types(%0: memref<128xi8>) -> memref<128xi8> {
  %c0 = arith.constant 0 : index
  %res = memref.view %0[%c0][] : memref<128xi8> to memref<128xi8>
  return %res : memref<128xi8>
}

// -----

func.func @non_fold_view_non_zero_offset(%0: memref<128xi8>) -> memref<128xi8> {
  %c1 = arith.constant 1 : index
  %res = memref.view %0[%c1][] : memref<128xi8> to memref<128xi8>
  return %res : memref<128xi8>
}

// -----

func.func @non_fold_view_same_source_dynamic_size(%0: memref<?xi8>, %arg0 : index) -> memref<?xi8> {
  %c0 = arith.constant 0: index
  %res = memref.view %0[%c0][%arg0] : memref<?xi8> to memref<?xi8>
  return %res : memref<?xi8>
}

// -----

func.func @replace_view_static_dims(%src: memref<?xi8>, %offset : index) -> memref<?x4xi32> {
  %c5 = arith.constant 5: index
  %res = memref.view %src[%offset][%c5] : memref<?xi8> to memref<?x4xi32>
  return %res : memref<?x4xi32>
}

// -----

func.func @non_replace_view_negative_static_dims(%src: memref<?xi8>, %offset : index) -> memref<?x4xi32> {
  %c-1 = arith.constant -1: index
  %res = memref.view %src[%offset][%c-1] : memref<?xi8> to memref<?x4xi32>
  return %res : memref<?x4xi32>
}

// -----

// Verify that canonicalization does not crash when a memref.dim is applied to
// a subview with ambiguous dropped dimensions (multiple size-1 source dims with
// all-dynamic strides). The dim should be folded to the corresponding subview
// size operand.
// See: https://github.com/llvm/llvm-project/issues/111244

func.func @no_crash_dim_of_ambiguous_subview(
    %arg0: memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>, %arg1: index) -> index {
  %c1 = arith.constant 1 : index
  %subview = memref.subview %arg0[0, 0, 0] [1, %arg1, 1] [1, 1, 1]
      : memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>> to memref<1x?xf32, strided<[?, ?], offset: ?>>
  %dim = memref.dim %subview, %c1 : memref<1x?xf32, strided<[?, ?], offset: ?>>
  return %dim : index
}
