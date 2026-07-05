func.func @expand_shape_identity_fold(%arg0 : tensor<5xf32>) -> tensor<5xf32> {
  %0 = tensor.expand_shape %arg0 [[0]] output_shape [5] : tensor<5xf32> into tensor<5xf32>
  return %0 : tensor<5xf32>
}

// -----

func.func @expand_shape_rank0_identity_fold(%arg0 : tensor<f32>) -> tensor<f32> {
  %0 = tensor.expand_shape %arg0 [] output_shape [] : tensor<f32> into tensor<f32>
  return %0 : tensor<f32>
}

// -----

func.func @collapse_shape_identity_fold(%arg0 : tensor<5x4xf32>) -> tensor<5x4xf32> {
  %0 = tensor.collapse_shape %arg0 [[0], [1]] : tensor<5x4xf32> into tensor<5x4xf32>
  return %0 : tensor<5x4xf32>
}

// -----

func.func @collapse_shape_rank0_identity_fold(%arg0 : tensor<f32>) -> tensor<f32> {
  %0 = tensor.collapse_shape %arg0 [] : tensor<f32> into tensor<f32>
  return %0 : tensor<f32>
}

// -----

func.func @tensor_bitcast_chain_ok(%input: tensor<2xi32>) -> tensor<2xf32> {
  %0 = tensor.bitcast %input : tensor<2xi32> to tensor<2xui32>
  %1 = tensor.bitcast %0 : tensor<2xui32> to tensor<2xf32>
  return %1 : tensor<2xf32>
}

// -----

func.func @tensor_bitcast_chain_nop(%input: tensor<4xi32>) -> tensor<4xi32> {
  %0 = tensor.bitcast %input : tensor<4xi32> to tensor<4xui32>
  %1 = tensor.bitcast %0 : tensor<4xui32> to tensor<4xi32>
  return %1 : tensor<4xi32>
}

// -----

// Checks that NOP casts are removed.
func.func @cast_values(%arg0: tensor<*xi32>) -> tensor<2xi32> {
  // NOP cast
  %0 = tensor.cast %arg0 : tensor<*xi32> to tensor<*xi32>
  %2 = tensor.cast %0 : tensor<*xi32> to tensor<2xi32>
  // NOP cast
  %4 = tensor.cast %2 : tensor<2xi32> to tensor<2xi32>
  return %4 : tensor<2xi32>
}

// -----

func.func @tensor.cast_chain_ok(%input: tensor<*xi32>) -> tensor<4x8xi32> {
  %0 = tensor.cast %input : tensor<*xi32> to tensor<4x?xi32>
  %1 = tensor.cast %0 : tensor<4x?xi32> to tensor<4x8xi32>
  return %1 : tensor<4x8xi32>
}

// -----

func.func @tensor.cast_chain_regain(%input: tensor<4xi32>) -> tensor<4xi32> {
  %0 = tensor.cast %input : tensor<4xi32> to tensor<?xi32>
  %1 = tensor.cast %0 : tensor<?xi32> to tensor<4xi32>
  return %1 : tensor<4xi32>
}

// -----

func.func @tensor.cast_chain_keep(%input: tensor<?x?xi32>) -> tensor<?x8xi32> {
  %0 = tensor.cast %input : tensor<?x?xi32> to tensor<4x?xi32>
  %1 = tensor.cast %0 : tensor<4x?xi32> to tensor<?x8xi32>
  return %1 : tensor<?x8xi32>
}

// -----

func.func @tensor.cast_chain_invalid(%input: tensor<4x8xi32>) -> tensor<8x4xi32> {
  %0 = tensor.cast %input : tensor<4x8xi32> to tensor<?x?xi32>
  %1 = tensor.cast %0 : tensor<?x?xi32> to tensor<8x4xi32>
  return %1 : tensor<8x4xi32>
}

// -----

func.func @fold_concat(%arg0: tensor<1x2x?xi32>) -> (tensor<1x2x3xi32>, tensor<1x2x?xi32>) {
  %0 = tensor.concat dim(2) %arg0 : (tensor<1x2x?xi32>) -> tensor<1x2x3xi32>
  %1 = tensor.concat dim(2) %arg0 : (tensor<1x2x?xi32>) -> tensor<1x2x?xi32>
  return %0, %1 : tensor<1x2x3xi32>, tensor<1x2x?xi32>
}

// -----

func.func @infer_concat_operand_types(%arg0: tensor<?x12xi32>, %arg1: tensor<?x?xi32>) -> (tensor<?x12xi32>) {
  %0 = tensor.concat dim(0) %arg0, %arg1: (tensor<?x12xi32>, tensor<?x?xi32>) -> tensor<?x12xi32>
  return %0 : tensor<?x12xi32>
}

// -----

func.func @infer_concat_return_type(%arg0: tensor<5x12xi32>, %arg1: tensor<?x12xi32>) -> (tensor<?x?xi32>) {
  %0 = tensor.concat dim(0) %arg0, %arg1: (tensor<5x12xi32>, tensor<?x12xi32>) -> tensor<?x?xi32>
  return %0 : tensor<?x?xi32>
}

// -----

func.func @fold_extract(%arg0 : index) -> (f32, f16, f16, i32, complex<f32>, i32) {
  %const_0 = arith.constant 0 : index
  %const_1 = arith.constant 1 : index
  %const_3 = arith.constant 3 : index

  // Fold an extract into a splat.
  %0 = arith.constant dense<4.0> : tensor<4xf32>
  %ext_1 = tensor.extract %0[%arg0] : tensor<4xf32>

  // Fold an extract into a sparse with a sparse index.
  %1 = arith.constant sparse<[[0, 0, 0], [1, 1, 1]],  [-5.0, -2.0]> : tensor<4x4x4xf16>
  %ext_2 = tensor.extract %1[%const_1, %const_1, %const_1] : tensor<4x4x4xf16>

  // Fold an extract into a sparse with a non sparse index.
  %2 = arith.constant sparse<[[1, 1, 1]],  [-2.0]> : tensor<2x2x2xf16>
  %ext_3 = tensor.extract %2[%const_0, %const_0, %const_0] : tensor<2x2x2xf16>

  // Fold an extract into a dense tensor.
  %3 = arith.constant dense<[[[1, -2, 1, 36]], [[0, 2, -1, 64]]]> : tensor<2x1x4xi32>
  %ext_4 = tensor.extract %3[%const_1, %const_0, %const_3] : tensor<2x1x4xi32>

  // Fold an extract into a complex constant.
  %4 = arith.constant dense<(1.2, 2.3)> : tensor<complex<f32>>
  %ext_5 = tensor.extract %4[] : tensor<complex<f32>>

  // Fold an extract after an insert.
  %c4_i32 = arith.constant 4 : i32
  %5 = arith.constant dense<[[1, 3], [0, 2]]> : tensor<2x2xi32>
  %inserted = tensor.insert %c4_i32 into %5[%const_1, %const_0] : tensor<2x2xi32>
  %ext_6 = tensor.extract %inserted[%const_1, %const_0] : tensor<2x2xi32>

  return %ext_1, %ext_2, %ext_3, %ext_4, %ext_5, %ext_6 : f32, f16, f16, i32, complex<f32>, i32
}

// -----

// Ensure extract dense resource elements not crash.

func.func @extract_dense_resource_nofold() -> i64 {
  %c0 = arith.constant 0 : index
  %cst = arith.constant dense_resource<__elided__> : tensor<1xi64>
  %extracted = tensor.extract %cst[%c0] : tensor<1xi64>
  return %extracted : i64
}

// -----

func.func @fold_insert(%arg0 : index) -> (tensor<4xf32>) {
  // Fold an insert into a splat.
  %0 = arith.constant dense<4.0> : tensor<4xf32>
  %1 = arith.constant 4.0 : f32
  %ins_1 = tensor.insert %1 into %0[%arg0] : tensor<4xf32>
  return %ins_1 : tensor<4xf32>
}

// -----

func.func @extract_from_tensor.cast(%tensor: tensor<9xf32>) -> f32 {
  %c0 = arith.constant 0 : index
  %casted = tensor.cast %tensor : tensor<9xf32> to tensor<?xf32>
  %result = tensor.extract %casted[%c0] : tensor<?xf32>
  return %result : f32
}

// -----

func.func @extract_from_tensor.from_elements(%element : index) -> index {
  %c0 = arith.constant 0 : index
  %tensor = tensor.from_elements %element : tensor<1xindex>
  %extracted_element = tensor.extract %tensor[%c0] : tensor<1xindex>
  return %extracted_element : index
}

// -----

func.func @extract_from_tensor.from_elements_0d(%element : index) -> index {
  %c0 = arith.constant 0 : index
  %tensor = tensor.from_elements %element : tensor<index>
  %extracted_element = tensor.extract %tensor[] : tensor<index>
  return %extracted_element : index
}

// -----

func.func @extract_from_tensor.from_elements_3d()
    -> (f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32) {
  %f0 = arith.constant 0.0 : f32
  %f1 = arith.constant 1.0 : f32
  %f2 = arith.constant 2.0 : f32
  %f3 = arith.constant 3.0 : f32
  %f4 = arith.constant 4.0 : f32
  %f5 = arith.constant 5.0 : f32
  %f6 = arith.constant 6.0 : f32
  %f7 = arith.constant 7.0 : f32
  %f8 = arith.constant 8.0 : f32
  %f9 = arith.constant 9.0 : f32
  %f10 = arith.constant 10.0 : f32
  %f11 = arith.constant 11.0 : f32

  %tensor = tensor.from_elements %f0,%f1,%f2,%f3,%f4,%f5,%f6,%f7,%f8,%f9,%f10,%f11
         : tensor<3x2x2xf32>
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c2 = arith.constant 2 : index

  %r0 = tensor.extract %tensor[%c0, %c0, %c0] : tensor<3x2x2xf32>
  %r1 = tensor.extract %tensor[%c0, %c0, %c1] : tensor<3x2x2xf32>
  %r2 = tensor.extract %tensor[%c0, %c1, %c0] : tensor<3x2x2xf32>
  %r3 = tensor.extract %tensor[%c0, %c1, %c1] : tensor<3x2x2xf32>
  %r4 = tensor.extract %tensor[%c1, %c0, %c0] : tensor<3x2x2xf32>
  %r5 = tensor.extract %tensor[%c1, %c0, %c1] : tensor<3x2x2xf32>
  %r6 = tensor.extract %tensor[%c1, %c1, %c0] : tensor<3x2x2xf32>
  %r7 = tensor.extract %tensor[%c1, %c1, %c1] : tensor<3x2x2xf32>
  %r8 = tensor.extract %tensor[%c2, %c0, %c0] : tensor<3x2x2xf32>
  %r9 = tensor.extract %tensor[%c2, %c0, %c1] : tensor<3x2x2xf32>
  %r10 = tensor.extract %tensor[%c2, %c1, %c0] : tensor<3x2x2xf32>
  %r11 = tensor.extract %tensor[%c2, %c1, %c1] : tensor<3x2x2xf32>
  return %r0,%r1,%r2,%r3,%r4,%r5,%r6,%r7,%r8,%r9,%r10,%r11
         : f32,f32,f32,f32,f32,f32,f32,f32,f32,f32,f32,f32
}


// -----

func.func @extract_from_tensor.from_elements_variable_3d(
    %f0: f32, %f1: f32, %f2: f32, %f3: f32, %f4: f32, %f5: f32,
    %f6: f32, %f7: f32, %f8: f32, %f9: f32, %f10: f32, %f11: f32)
    -> (f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32) {

  %tensor = tensor.from_elements %f0,%f1,%f2,%f3,%f4,%f5,%f6,%f7,%f8,%f9,%f10,%f11
         : tensor<3x2x2xf32>
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c2 = arith.constant 2 : index

  %r0 = tensor.extract %tensor[%c0, %c0, %c0] : tensor<3x2x2xf32>
  %r1 = tensor.extract %tensor[%c0, %c0, %c1] : tensor<3x2x2xf32>
  %r2 = tensor.extract %tensor[%c0, %c1, %c0] : tensor<3x2x2xf32>
  %r3 = tensor.extract %tensor[%c0, %c1, %c1] : tensor<3x2x2xf32>
  %r4 = tensor.extract %tensor[%c1, %c0, %c0] : tensor<3x2x2xf32>
  %r5 = tensor.extract %tensor[%c1, %c0, %c1] : tensor<3x2x2xf32>
  %r6 = tensor.extract %tensor[%c1, %c1, %c0] : tensor<3x2x2xf32>
  %r7 = tensor.extract %tensor[%c1, %c1, %c1] : tensor<3x2x2xf32>
  %r8 = tensor.extract %tensor[%c2, %c0, %c0] : tensor<3x2x2xf32>
  %r9 = tensor.extract %tensor[%c2, %c0, %c1] : tensor<3x2x2xf32>
  %r10 = tensor.extract %tensor[%c2, %c1, %c0] : tensor<3x2x2xf32>
  %r11 = tensor.extract %tensor[%c2, %c1, %c1] : tensor<3x2x2xf32>
  return %r0,%r1,%r2,%r3,%r4,%r5,%r6,%r7,%r8,%r9,%r10,%r11
         : f32,f32,f32,f32,f32,f32,f32,f32,f32,f32,f32,f32
}

// -----

func.func @extract_from_elements_complex_i() -> tensor<3xcomplex<i32>> {
  %c1 = arith.constant dense<(1, 2)> : tensor<complex<i32>>
  %complex1 = tensor.extract %c1[] : tensor<complex<i32>>
  %c2 = arith.constant dense<(3, 2)> : tensor<complex<i32>>
  %complex2 = tensor.extract %c2[] : tensor<complex<i32>>
  %tensor = tensor.from_elements %complex1, %complex2, %complex1 : tensor<3xcomplex<i32>>
  return %tensor : tensor<3xcomplex<i32>>
}

// -----

func.func @extract_from_elements_complex_f() -> tensor<3xcomplex<f32>> {
  %c1 = arith.constant dense<(1.2, 2.3)> : tensor<complex<f32>>
  %complex1 = tensor.extract %c1[] : tensor<complex<f32>>
  %c2 = arith.constant dense<(3.2, 2.1)> : tensor<complex<f32>>
  %complex2 = tensor.extract %c2[] : tensor<complex<f32>>
  %tensor = tensor.from_elements %complex1, %complex2, %complex1 : tensor<3xcomplex<f32>>
  return %tensor : tensor<3xcomplex<f32>>
}

// -----

// Ensure tensor.from_elements with poison values doesn't crash.
func.func @from_elements_with_poison() -> tensor<1xindex> {
  %0 = ub.poison : index
  %1 = tensor.from_elements %0 : tensor<1xindex>
  return %1 : tensor<1xindex>
}

// -----

// Ensure tensor.from_elements with a vector element type doesn't crash
// when the elements fold to constants (DenseElementsAttr does not support
// non-scalar element types via the Attribute overload).
func.func @from_elements_with_vector_element_type() -> tensor<1xvector<1xi1>> {
  %0 = vector.constant_mask [1] : vector<1xi1>
  %1 = tensor.from_elements %0 : tensor<1xvector<1xi1>>
  return %1 : tensor<1xvector<1xi1>>
}

// -----

// Ensure the optimization doesn't segfault from bad constants
func.func @extract_negative_from_tensor.from_elements(%element : index) -> index {
  %c-1 = arith.constant -1 : index
  %tensor = tensor.from_elements %element : tensor<1xindex>
  %extracted_element = tensor.extract %tensor[%c-1] : tensor<1xindex>
  return %extracted_element : index
}

// -----

// Ensure the optimization doesn't segfault from bad constants
func.func @extract_oob_from_tensor.from_elements(%element : index) -> index {
  %c1 = arith.constant 1 : index
  %tensor = tensor.from_elements %element : tensor<1xindex>
  %extracted_element = tensor.extract %tensor[%c1] : tensor<1xindex>
  return %extracted_element : index
}

// -----

// Ensure the optimization doesn't segfault from bad constants
func.func @extract_oob_from_tensor.from_elements(%element : index) -> index {
  %c2 = arith.constant 2 : index
  %tensor = tensor.from_elements %element : tensor<1xindex>
  %extracted_element = tensor.extract %tensor[%c2] : tensor<1xindex>
  return %extracted_element : index
}

// -----

func.func @extract_from_tensor.generate(%idx: index, %tensor: tensor<*xf32>) -> index {
  %size = tensor.rank %tensor : tensor<*xf32>
  %0 = tensor.generate %size {
    ^bb0(%arg0: index):
    %1 = tensor.dim %tensor, %arg0 : tensor<*xf32>
    tensor.yield %1 : index
  } : tensor<?xindex>
  %1 = tensor.extract %0[%idx] : tensor<?xindex>
  return %1 : index
}

// -----

func.func @extract_from_tensor.generate_2d(%idx0: index, %idx1: index, %tensor: tensor<*xf32>) -> index {
  %size = tensor.rank %tensor : tensor<*xf32>
  %0 = tensor.generate %size, %size {
    ^bb0(%arg0: index, %arg1: index):
    %1 = tensor.dim %tensor, %arg0 : tensor<*xf32>
    %2 = tensor.dim %tensor, %arg1 : tensor<*xf32>
    %3 = arith.addi %1, %2 : index
    tensor.yield %3 : index
  } : tensor<?x?xindex>
  %4 = tensor.extract %0[%idx0, %idx1] : tensor<?x?xindex>
  return %4 : index
}

// -----

func.func @extract_from_tensor.generate_sideeffects(%idx: index, %tensor: tensor<*xf32>, %mem: memref<?xindex>) -> index {
  %size = tensor.rank %tensor : tensor<*xf32>
  %0 = tensor.generate %size {
    ^bb0(%arg0: index):
    %1 = tensor.dim %tensor, %arg0 : tensor<*xf32>
    memref.store %1, %mem[%arg0] : memref<?xindex>
    tensor.yield %1 : index
  } : tensor<?xindex>
  %1 = tensor.extract %0[%idx] : tensor<?xindex>
  return %1 : index
}

// -----

func.func @static_tensor.generate(%size1: index, %size4: index) -> tensor<3x?x?x7x?xindex> {
  %c5 = arith.constant 5 : index
  %0 = tensor.generate %size1, %c5, %size4 {
    ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index):
    %1 = arith.constant 32 : index
    tensor.yield %1 : index
  } : tensor<3x?x?x7x?xindex>
  return %0 : tensor<3x?x?x7x?xindex>
}

// -----

func.func @from_elements.constant() -> tensor<3xindex> {
  %c1 = arith.constant 1 : index
  %c2 = arith.constant 2 : index
  %tensor = tensor.from_elements %c1, %c2, %c1 : tensor<3xindex>
  return %tensor : tensor<3xindex>
}

// -----

func.func @slice_canonicalize(%arg0 : tensor<?x?x?xf32>, %arg1 : index,
    %arg2 : index) -> tensor<?x?x?xf32>
{
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c4 = arith.constant 4 : index
  %0 = tensor.extract_slice %arg0[%c0, %arg1, %c1] [%c4, %c1, %arg2] [%c1, %c1, %c1] : tensor<?x?x?xf32> to tensor<?x?x?xf32>
  return %0 : tensor<?x?x?xf32>
}

// -----

func.func @rank_reducing_slice_canonicalize(%arg0 : tensor<?x?x?xf32>, %arg1 : index,
    %arg2 : index) -> tensor<?x?xf32>
{
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c4 = arith.constant 4 : index
  %0 = tensor.extract_slice %arg0[%c0, %arg1, %c1] [%c4, 1, %arg2] [%c1, %c1, %c1] : tensor<?x?x?xf32> to tensor<?x?xf32>
  return %0 : tensor<?x?xf32>
}

// -----

func.func @rank_reducing_slice_preserve_dropped_dims(
    %arg0 : tensor<1x1x8x1xf16>, %arg1 : index) -> tensor<1x4xf16> {
  %c0 = arith.constant 0 : index
  %0 = tensor.extract_slice %arg0[%c0, 0, %arg1, 0] [1, 1, 4, 1] [1, 1, 1, 1]
    : tensor<1x1x8x1xf16> to tensor<1x4xf16>
  return %0 : tensor<1x4xf16>
}

// -----

func.func @trivial_slice(%arg0 : tensor<4x6x16x32xi8>) -> tensor<4x6x16x32xi8> {
  %0 = tensor.extract_slice %arg0[0, 0, 0, 0] [4, 6, 16, 32] [1, 1, 1, 1] : tensor<4x6x16x32xi8> to tensor<4x6x16x32xi8>
  return %0 : tensor<4x6x16x32xi8>
}

// -----

func.func @trivial_insert_slice(%arg0 : tensor<4x6x16x32xi8>, %arg1 : tensor<4x6x16x32xi8>) -> tensor<4x6x16x32xi8> {
  %0 = tensor.insert_slice %arg0 into %arg1[0, 0, 0, 0] [4, 6, 16, 32] [1, 1, 1, 1] : tensor<4x6x16x32xi8> into tensor<4x6x16x32xi8>
  return %0 : tensor<4x6x16x32xi8>
}

// -----

func.func @empty_insert_slice(%arg0 : tensor<0x2xi8>, %arg1 : tensor<3x3xi8>) -> tensor<3x3xi8> {
  %0 = tensor.insert_slice %arg0 into %arg1[0, 0] [0, 2] [1, 1] : tensor<0x2xi8> into tensor<3x3xi8>
  return %0 : tensor<3x3xi8>
}

// -----

// Tensor cast is moved after slice and then gets canonicalized away.
func.func @rank_reducing_tensor_of_cast(%arg : tensor<4x6x16x32xi8>) -> tensor<16x32xi8> {
  %0 = tensor.cast %arg : tensor<4x6x16x32xi8> to tensor<?x?x16x32xi8>
  %1 = tensor.extract_slice %0[0, 1, 0, 0] [1, 1, 16, 32] [1, 1, 1, 1] : tensor<?x?x16x32xi8> to tensor<16x32xi8>
  return %1 : tensor<16x32xi8>
}

// -----

func.func @out_of_bounds_extract_slice(%t: tensor<5xf32>) -> tensor<?xf32> {
  %c10 = arith.constant 10 : index
  %r = tensor.extract_slice %t[0] [%c10] [1] : tensor<5xf32> to tensor<?xf32>
  return %r : tensor<?xf32>
}

// -----

func.func @out_of_bounds_extract_slice(%t: tensor<5xf32>) -> tensor<10xf32> {
  %t2 = tensor.cast %t : tensor<5xf32> to tensor<?xf32>
  %r = tensor.extract_slice %t2 [0][10][1] : tensor<?xf32> to tensor<10xf32>
  return %r : tensor<10xf32>
}

// -----

func.func @out_of_bounds_insert_slice(%src: tensor<5xf32>, %dst: tensor<10xf32>) -> tensor<10xf32> {
  %c10 = arith.constant 10 : index
  %r = tensor.insert_slice %src into %dst[%c10] [5] [1] : tensor<5xf32> into tensor<10xf32>
  return %r : tensor<10xf32>
}

// -----

func.func @out_of_bounds_insert_slice(%src: tensor<5xf32>, %dst: tensor<10xf32>, %sz: index) -> tensor<10xf32> {
  %src2 = tensor.cast %src : tensor<5xf32> to tensor<?xf32>
  %r = tensor.insert_slice %src2 into %dst[7] [%sz] [1] : tensor<?xf32> into tensor<10xf32>
  return %r : tensor<10xf32>
}

// -----

func.func @out_of_bounds_insert_slice(%src: tensor<5xf32>, %dst: tensor<10xf32>, %sz: index) -> tensor<?xf32> {
  %dst2 = tensor.cast %dst : tensor<10xf32> to tensor<?xf32>
  %r = tensor.insert_slice %src into %dst2[7] [5] [1] : tensor<5xf32> into tensor<?xf32>
  return %r : tensor<?xf32>
}

// -----

// Tensor cast is folded away.
func.func @rank_reducing_insert_slice_of_cast(%a : tensor<16x32xi8>, %b : tensor<4x6x16x32xi8>) -> tensor<4x6x16x32xi8> {
  %c0 = arith.constant 0: index
  %cast = tensor.cast %a : tensor<16x32xi8> to tensor<?x32xi8>
  %sz = tensor.dim %cast, %c0: tensor<?x32xi8>
  %res = tensor.insert_slice %cast into %b[0, 1, 0, 0] [1, 1, %sz, 32] [1, 1, 1, 1] : tensor<?x32xi8> into tensor<4x6x16x32xi8>
  return %res : tensor<4x6x16x32xi8>
}

// -----

func.func @insert_slice_canonicalize(%arg0 : tensor<?x?x?xf32>, %arg1 : index,
    %arg2 : index, %arg3 : tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
{
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c4 = arith.constant 4 : index
  %0 = tensor.insert_slice %arg0 into %arg3[%c0, %arg1, %c1] [%c4, %c1, %arg2] [%c1, %c1, %c1] : tensor<?x?x?xf32> into tensor<?x?x?xf32>
  return %0 : tensor<?x?x?xf32>
}

// -----

// Do not insert a cast for the following example. The new source type wouldn't be "more static" than the old one.
func.func @insert_slice_canonicalize_encoding(%arg0 : tensor<2x2xf32, "foo">,
                                              %arg1 : tensor<4x4xf32, "foo">) -> tensor<4x4xf32, "foo">
{
  %0 = tensor.insert_slice %arg0 into %arg1[0, 0] [2, 2] [1, 1] : tensor<2x2xf32, "foo"> into tensor<4x4xf32, "foo">
  return %0 : tensor<4x4xf32, "foo">
}

// -----

func.func @slice_to_insert_slice_canonicalize(%arg0 : tensor<?x?x?xf32>, %arg1 : index,
    %arg2 : index, %arg3 : tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
{
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c4 = arith.constant 4 : index
  %0 = tensor.extract_slice %arg0[%c0, %arg1, %c1] [%c4, %c1, %arg2] [%c1, %c1, %c1] : tensor<?x?x?xf32> to tensor<?x?x?xf32>
  %1 = tensor.insert_slice %0 into %arg3[%c0, %arg1, %c1] [%c4, %c1, %arg2] [%c1, %c1, %c1] : tensor<?x?x?xf32> into tensor<?x?x?xf32>
  return %1 : tensor<?x?x?xf32>
}

// -----

func.func @rank_reducing_insert_slice_canonicalize(%arg0 : tensor<?x?xf32>, %arg1 : index,
    %arg2 : index, %arg3 : tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
{
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c4 = arith.constant 4 : index
  %0 = tensor.insert_slice %arg0 into %arg3[%c0, %arg1, %c1] [%c4, 1, %arg2] [%c1, %c1, %c1] : tensor<?x?xf32> into tensor<?x?x?xf32>
  return %0 : tensor<?x?x?xf32>
}

// -----

func.func @rank_reducing_slice_to_insert_slice_canonicalize(%arg0 : tensor<?x?x?xf32>, %arg1 : index,
    %arg2 : index, %arg3 : tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
{
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c4 = arith.constant 4 : index
  %0 = tensor.extract_slice %arg0[%c0, %arg1, %c1] [%c4, 1, %arg2] [%c1, %c1, %c1] : tensor<?x?x?xf32> to tensor<?x?xf32>
  %1 = tensor.insert_slice %0 into %arg3[%c0, %arg1, %c1] [%c4, 1, %arg2] [%c1, %c1, %c1] : tensor<?x?xf32> into tensor<?x?x?xf32>
  return %1 : tensor<?x?x?xf32>
}

// -----

func.func @insert_slice_propagate_dest_cast(%arg0 : tensor<2x?xi32>, %arg1 : tensor<i32>,
    %arg2 : index, %arg3 : index) -> tensor<?x?xi32> {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c2 = arith.constant 2 : index
  %c8 = arith.constant 8 : index
  %0 = tensor.dim %arg0, %c1 : tensor<2x?xi32>
  %1 = tensor.extract %arg1[] : tensor<i32>
  %2 = tensor.generate %arg2, %c8 {
  ^bb0(%arg4: index, %arg5: index):
    tensor.yield %1 : i32
  } : tensor<?x?xi32>
  %3 = tensor.insert_slice %arg0 into %2[0, %arg3] [2, %0] [1, 1] : tensor<2x?xi32> into tensor<?x?xi32>
  return %3 : tensor<?x?xi32>
}

// -----

func.func @insert_slice_output_dest_canonicalize(%arg0 : tensor<2x3xi32>, %arg1 : tensor<i32>) -> tensor<3x9xi32> {
  %c9 = arith.constant 9 : index
  %c3 = arith.constant 3 : index
  %2 = tensor.extract %arg1[] : tensor<i32>
  %4 = tensor.generate %c3, %c9 {
  ^bb0(%arg2: index, %arg3: index):
    tensor.yield %2 : i32
  } : tensor<?x?xi32>
  %5 = tensor.insert_slice %arg0 into %4[0, 1] [2, 3] [1, 1] : tensor<2x3xi32> into tensor<?x?xi32>
  %6 = tensor.cast %5 : tensor<?x?xi32> to tensor<3x9xi32>
  return %6 : tensor<3x9xi32>
}

// -----

// Test case: Folding of tensor.dim(tensor.generate %idx) -> %idx
func.func @dim_of_tensor.generate(%arg0: index, %arg1: index) -> index {
  %c3 = arith.constant 3 : index
  %0 = tensor.generate %arg0, %arg1 {
  ^bb0(%arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index):
    tensor.yield %c3 : index
  } : tensor<2x?x4x?x5xindex>
  %1 = tensor.dim %0, %c3 : tensor<2x?x4x?x5xindex>
  return %1 : index
}

// -----

// Test case: Folding tensor.dim(tensor.cast %0, %idx) -> tensor.dim %0, %idx
func.func @fold_dim_of_tensor.cast(%arg0 : tensor<4x?xf32>) -> (index, index) {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %0 = tensor.cast %arg0 : tensor<4x?xf32> to tensor<?x?xf32>
  %1 = tensor.dim %0, %c0 : tensor<?x?xf32>
  %2 = tensor.dim %0, %c1 : tensor<?x?xf32>
  return %1, %2: index, index
}

// -----

func.func @insert_slice_cast(%arg0 : tensor<1x?xf32>, %arg1 : tensor<?x?xf32>, %arg2 : index, %arg3 : index, %arg4 : index, %arg5 : index, %arg6 : index, %arg7 : index) -> tensor<?x?xf32> {
  %0 = tensor.cast %arg0 : tensor<1x?xf32> to tensor<?x?xf32>
  %1 = tensor.insert_slice %0 into %arg1[%arg2, %arg3] [%arg4, %arg5] [%arg6, %arg7] : tensor<?x?xf32> into tensor<?x?xf32>
  return %1 : tensor<?x?xf32>
}

// -----

func.func @insert_slice_cast_no_fold(%arg0 : tensor<1x?xf32>, %arg1 : tensor<?x?xf32>, %arg2 : index, %arg3 : index, %arg4 : index, %arg5 : index, %arg6 : index, %arg7 : index) -> tensor<?x?xf32> {
  %0 = tensor.cast %arg0 : tensor<1x?xf32> to tensor<?x5xf32>
  %1 = tensor.insert_slice %0 into %arg1[%arg2, %arg3] [%arg4, 5] [%arg6, %arg7] : tensor<?x5xf32> into tensor<?x?xf32>
  return %1 : tensor<?x?xf32>
}

// -----

func.func @insert_tensor_cast_on_insert_slice_src(
    %arg0 : tensor<?x5x?xf32>,  %arg1 : tensor<?x?x?xf32>, %sz0: index, %sz2: index) -> tensor<?x?x?xf32> {
  %c64 = arith.constant 64: index
  %r = tensor.insert_slice %arg0 into %arg1[0, 1, 2] [%c64, 5, %c64] [1, 1, 1]
    : tensor<?x5x?xf32> into tensor<?x?x?xf32>
  return %r : tensor<?x?x?xf32>
}

// -----

func.func @fold_extract_insert(%input : tensor<?x?x?xf32>, %slice: tensor<4x?x8xf32>, %i: index, %size: index) -> (tensor<4x?x8xf32>) {
  %c0 = arith.constant 0: index
  %c1 = arith.constant 1: index
  %0 = tensor.insert_slice %slice into %input[%c0, %i, 0] [4, %size, 8] [1, 1, %c1] : tensor<4x?x8xf32> into tensor<?x?x?xf32>
  %1 = tensor.extract_slice %0[%c0, %i, 0] [4, %size, 8] [1, 1, %c1] : tensor<?x?x?xf32> to tensor<4x?x8xf32>
  return %1 : tensor<4x?x8xf32>
}

// -----

func.func @fold_gather_constant_splat(%indices : tensor<1x2x3xindex>) -> tensor<1x2x1x1x1xf32> {
  %cst = arith.constant dense<1.000000e-01> : tensor<4x4x4xf32>
  %0 = tensor.gather %cst[%indices] gather_dims([0, 1, 2]) :
    (tensor<4x4x4xf32>, tensor<1x2x 3xindex>) -> tensor<1x2x 1x1x1xf32>
  return %0 : tensor<1x2x 1x1x1xf32>
}

// -----

func.func @fold_reshape_constant_splat(%shape : tensor<1xi32>) -> tensor<4xf32> {
  %cst = arith.constant dense<1.000000e-01> : tensor<4x1xf32>
  %0 = tensor.reshape %cst(%shape)
             : (tensor<4x1xf32>, tensor<1xi32>) -> tensor<4xf32>
  return %0 : tensor<4xf32>
}

// -----

func.func @fold_reshape_chain(%input: tensor<*xf32>, %shape_0: tensor<?xindex>, %shape_1: tensor<?xindex>, %shape_2: tensor<?xindex>) -> tensor<*xf32> {
  %0 = tensor.reshape %input(%shape_0) : (tensor<*xf32>, tensor<?xindex>) -> tensor<*xf32>
  %1 = tensor.reshape %0(%shape_1) : (tensor<*xf32>, tensor<?xindex>) -> tensor<*xf32>
  %2 = tensor.reshape %1(%shape_2) : (tensor<*xf32>, tensor<?xindex>) -> tensor<*xf32>
  return %2 : tensor<*xf32>
}

// -----

func.func @fold_reshape_1d(%input: tensor<?xf32>, %shape: tensor<1xindex>) -> tensor<?xf32> {
  %0 = tensor.reshape %input(%shape) : (tensor<?xf32>, tensor<1xindex>) -> tensor<?xf32>
  return %0 : tensor<?xf32>
}

// -----

func.func @fold_reshape_0d(%input: tensor<f32>, %shape: tensor<0xindex>) -> tensor<f32> {
  %0 = tensor.reshape %input(%shape) : (tensor<f32>, tensor<0xindex>) -> tensor<f32>
  return %0 : tensor<f32>
}

// -----

func.func @fold_extract_constant_splat() -> (tensor<4x4xi32>) {
  %cst = arith.constant dense<42> : tensor<1024x1024xi32>
  %1 = tensor.extract_slice %cst[0,0] [4,4] [1, 1] : tensor<1024x1024xi32> to tensor<4x4xi32>
  return %1 : tensor<4x4xi32>
}

// -----

func.func @fold_overlapping_insert(%input : tensor<?x?x?xf32>, %slice1: tensor<4x?x8xf32>, %slice2: tensor<4x?x8xf32>, %i: index, %size: index) -> (tensor<?x?x?xf32>) {
  %c0 = arith.constant 0: index
  %c1 = arith.constant 1: index
  %0 = tensor.insert_slice %slice1 into %input[%c0, %i, 0] [4, %size, 8] [1, 1, %c1] : tensor<4x?x8xf32> into tensor<?x?x?xf32>
  %1 = tensor.insert_slice %slice2 into %0[0, %i, 0] [4, %size, 8] [1, 1, %c1] : tensor<4x?x8xf32> into tensor<?x?x?xf32>
  return %1 : tensor<?x?x?xf32>
}

// -----

func.func @compose_expand_of_expand(%arg0 : tensor<?x?xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index)
    -> tensor<?x6x4x?x5xf32> {
  %0 = tensor.expand_shape %arg0 [[0, 1], [2]] output_shape [%arg1, 4, %arg2]
      : tensor<?x?xf32> into tensor<?x4x?xf32>
  %1 = tensor.expand_shape %0 [[0, 1], [2], [3, 4]] output_shape [%arg3, 6, 4, %arg4, 5] : tensor<?x4x?xf32> into tensor<?x6x4x?x5xf32>
  return %1 : tensor<?x6x4x?x5xf32>
}

// -----

func.func @compose_expand_of_expand_of_zero_dim(%arg0 : tensor<f32>)
    -> tensor<1x1x1xf32> {
  %0 = tensor.expand_shape %arg0 [] output_shape [1] : tensor<f32> into tensor<1xf32>
  %1 = tensor.expand_shape %0 [[0, 1, 2]] output_shape [1, 1, 1]
      : tensor<1xf32> into tensor<1x1x1xf32>
  return %1 : tensor<1x1x1xf32>
}

// -----

func.func @collapse_of_cast(%t: tensor<8x12x32xf32>) -> tensor<?x32xf32> {
  %0 = tensor.cast %t : tensor<8x12x32xf32> to tensor<?x?x?xf32>
  %1 = tensor.collapse_shape %0 [[0, 1], [2]] : tensor<?x?x?xf32> into tensor<?x?xf32>
  %2 = tensor.cast %1 : tensor<?x?xf32> to tensor<?x32xf32>
  return %2 : tensor<?x32xf32>
}

// -----

func.func @fold_collapse_of_expand(%arg0 : tensor<12x4xf32>) -> tensor<12x4xf32> {
  %0 = tensor.expand_shape %arg0 [[0, 1], [2]] output_shape [3, 4, 4]
      : tensor<12x4xf32> into tensor<3x4x4xf32>
  %1 = tensor.collapse_shape %0 [[0, 1], [2]]
      : tensor<3x4x4xf32> into tensor<12x4xf32>
  return %1 : tensor<12x4xf32>
}

// -----

func.func @fold_collapse_of_expand_dynamic(%arg0 : tensor<?x?xf32>, %arg1: index, %arg2: index)
    -> tensor<?x?xf32> {
  %0 = tensor.expand_shape %arg0 [[0, 1], [2]] output_shape [%arg1, 4, %arg2]
      : tensor<?x?xf32> into tensor<?x4x?xf32>
  %1 = tensor.collapse_shape %0 [[0, 1], [2]]
      : tensor<?x4x?xf32> into tensor<?x?xf32>
  return %1 : tensor<?x?xf32>
}

// -----

func.func @fold_collapse_of_expand_fully_dynamic(%arg0 : tensor<?x?xf32>, %arg1: index, %arg2: index, %arg3: index)
    -> tensor<?x?xf32> {
  %0 = tensor.expand_shape %arg0 [[0, 1], [2]] output_shape [%arg1, %arg2, %arg3]
      : tensor<?x?xf32> into tensor<?x?x?xf32>
  %1 = tensor.collapse_shape %0 [[0, 1], [2]]
      : tensor<?x?x?xf32> into tensor<?x?xf32>
  return %1 : tensor<?x?xf32>
}

// -----

func.func @no_fold_parallel_collapse_of_expand_dynamic(%arg0 : tensor<?x?x?xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index)
    -> tensor<?x?x?xf32> {
  %0 = tensor.expand_shape %arg0 [[0, 1], [2], [3]] output_shape [%arg1, %arg2, %arg3, %arg4]
      : tensor<?x?x?xf32> into tensor<?x?x?x?xf32>
  %1 = tensor.collapse_shape %0 [[0], [1], [2, 3]]
      : tensor<?x?x?x?xf32> into tensor<?x?x?xf32>
  return %1 : tensor<?x?x?xf32>
}

// -----

func.func @fold_expand_of_collapse(%arg0 : tensor<3x4x4xf32>) -> tensor<3x4x4xf32> {
  %0 = tensor.collapse_shape %arg0 [[0, 1], [2]]
      : tensor<3x4x4xf32> into tensor<12x4xf32>
  %1 = tensor.expand_shape %0 [[0, 1], [2]] output_shape [3, 4, 4]
      : tensor<12x4xf32> into tensor<3x4x4xf32>
  return %1 : tensor<3x4x4xf32>
}

// -----

func.func @fold_expand_of_collapse_mixed_subshape(%arg0 : tensor<?x4x?xf32>, %arg1: index, %arg2: index)
    -> tensor<?x4x?xf32> {
  %0 = tensor.collapse_shape %arg0 [[0, 1], [2]]
      : tensor<?x4x?xf32> into tensor<?x?xf32>
  %1 = tensor.expand_shape %0 [[0, 1], [2]] output_shape [%arg1, 4, %arg2]
      : tensor<?x?xf32> into tensor<?x4x?xf32>
  return %1 : tensor<?x4x?xf32>
}

// -----

func.func @fold_expand_of_collapse_mixed_target_subshape(%arg0 : tensor<?x4x?x2xf32>, %arg1: index, %arg2: index)
    -> tensor<?x4x?xf32> {
  %0 = tensor.collapse_shape %arg0 [[0, 1], [2, 3]]
      : tensor<?x4x?x2xf32> into tensor<?x?xf32>
  %1 = tensor.expand_shape %0 [[0, 1], [2]] output_shape [%arg1, 4, %arg2]
      : tensor<?x?xf32> into tensor<?x4x?xf32>
  return %1 : tensor<?x4x?xf32>
}

// -----

func.func @no_fold_expand_of_collapse_fully_dynamic(%arg0 : tensor<?x?x?xf32>, %arg1: index, %arg2: index, %arg3: index)
    -> tensor<?x?x?xf32> {
  %0 = tensor.collapse_shape %arg0 [[0, 1], [2]]
      : tensor<?x?x?xf32> into tensor<?x?xf32>
  %1 = tensor.expand_shape %0 [[0, 1], [2]] output_shape [%arg1, %arg2, %arg3]
      : tensor<?x?xf32> into tensor<?x?x?xf32>
  return %1 : tensor<?x?x?xf32>
}

// -----

func.func @no_fold_expand_of_collapse_adjacent_dynamic(%arg0 : tensor<?x?x?xf32>, %arg1: index, %arg2: index)
    -> tensor<?x?xf32> {
  %0 = tensor.collapse_shape %arg0 [[0, 1, 2]]
      : tensor<?x?x?xf32> into tensor<?xf32>
  %1 = tensor.expand_shape %0 [[0, 1]] output_shape [%arg1, %arg2]
      : tensor<?xf32> into tensor<?x?xf32>
  return %1 : tensor<?x?xf32>
}

// -----

func.func @compose_expand_of_collapse_last_two_dims(%arg0: tensor<?x64x1xf32>) -> tensor<?x384xf32> {
  %collapsed = tensor.collapse_shape %arg0 [[0, 1, 2]] : tensor<?x64x1xf32> into tensor<?xf32>
  %c0 = arith.constant 0 : index
  %dim = tensor.dim %collapsed, %c0 : tensor<?xf32>
  %c384= arith.constant 384 : index
  %div = arith.divui %dim, %c384 : index
  %expanded = tensor.expand_shape %collapsed [[0, 1]] output_shape [%div, 384] : tensor<?xf32> into tensor<?x384xf32>
  return %expanded : tensor<?x384xf32>
}

// -----

func.func @compose_expand_of_collapse(%arg0 : tensor<2x3x4x5x6x7x8xf32>)
    -> tensor<24x5x42x8xf32> {
  %0 = tensor.collapse_shape %arg0 [[0, 1, 2, 3, 4, 5, 6]]
      : tensor<2x3x4x5x6x7x8xf32> into tensor<40320xf32>
  %1 = tensor.expand_shape %0 [[0, 1, 2, 3]] output_shape [24, 5, 42, 8]
      : tensor<40320xf32> into tensor<24x5x42x8xf32>
  return %1 : tensor<24x5x42x8xf32>
}

// -----

func.func @compose_expand_of_collapse_7D(%arg0 : tensor<24x5x42x8xf32>)
    -> tensor<2x3x4x5x6x7x8xf32> {
  %0 = tensor.collapse_shape %arg0 [[0, 1, 2, 3]]
      : tensor<24x5x42x8xf32> into tensor<40320xf32>
  %1 = tensor.expand_shape %0 [[0, 1, 2, 3, 4, 5, 6]] output_shape [2, 3, 4, 5, 6, 7, 8]
      : tensor<40320xf32> into tensor<2x3x4x5x6x7x8xf32>
  return %1 : tensor<2x3x4x5x6x7x8xf32>
}

// -----

func.func @compose_collapse_of_expand(%arg : tensor<?x?x?xi64>, %arg1: index, %arg2: index, %arg3: index)
    -> tensor<?x?xi64> {
  %0 = tensor.expand_shape %arg [[0], [1], [2, 3]] output_shape [%arg1, %arg2, %arg3, 1]
    : tensor<?x?x?xi64> into tensor<?x?x?x1xi64>
  %1 = tensor.collapse_shape %0 [[0, 1], [2, 3]]
    : tensor<?x?x?x1xi64> into tensor<?x?xi64>
  return %1 : tensor<?x?xi64>
}

// -----

func.func @compose_collapse_of_expand_1D(%arg0 : tensor<2048xf32>)
    -> tensor<4x512xf32> {
  %0 = tensor.expand_shape %arg0 [[0, 1, 2, 3]] output_shape [1, 4, 1, 512]
    : tensor<2048xf32> into tensor<1x4x1x512xf32>
  %1 = tensor.collapse_shape %0 [[0, 1, 2], [3]]
    : tensor<1x4x1x512xf32> into tensor<4x512xf32>
  return %1 : tensor<4x512xf32>
}

// -----

func.func @compose_collapse_of_expand_partially_dynamic(%arg0: tensor<?xf16>, %arg1: index, %arg2: index) -> tensor<8x?x?xf16> {
  %expanded = tensor.expand_shape %arg0 [[0, 1, 2, 3, 4]] output_shape [4, 2, %arg1, %arg2, 32] : tensor<?xf16> into tensor<4x2x?x?x32xf16>
  %collapsed = tensor.collapse_shape %expanded [[0, 1], [2], [3, 4]] : tensor<4x2x?x?x32xf16> into tensor<8x?x?xf16>
  return %collapsed : tensor<8x?x?xf16>
}

// -----

func.func @compose_expand_of_collapse_0_rank_to_expand(%arg0 : tensor<1x1x1xf32>)
    -> tensor<1x1x1x1xf32> {
  %0 = tensor.collapse_shape %arg0 []
      : tensor<1x1x1xf32> into tensor<f32>
  %1 = tensor.expand_shape %0 [] output_shape [1, 1, 1, 1]
      : tensor<f32> into tensor<1x1x1x1xf32>
  return %1 : tensor<1x1x1x1xf32>
}

// -----

func.func @compose_expand_of_collapse_0_rank_to_collapse(%arg0 : tensor<1x1x1x1xf32>)
    -> tensor<1x1x1xf32> {
  %0 = tensor.collapse_shape %arg0 []
      : tensor<1x1x1x1xf32> into tensor<f32>
  %1 = tensor.expand_shape %0 [] output_shape [1, 1, 1]
      : tensor<f32> into tensor<1x1x1xf32>
  return %1 : tensor<1x1x1xf32>
}

// -----

func.func @compose_expand_of_collapse_static(%arg0 : tensor<4x32x10x64x2xf16>) -> tensor<4x32x10x128xf16> {
  %collapsed = tensor.collapse_shape %arg0 [[0, 1], [2], [3, 4]] : tensor<4x32x10x64x2xf16> into tensor<128x10x128xf16>
  %expanded = tensor.expand_shape %collapsed [[0, 1], [2], [3]] output_shape [4, 32, 10, 128] : tensor<128x10x128xf16> into tensor<4x32x10x128xf16>
  return %expanded : tensor<4x32x10x128xf16>
}


// -----

func.func @compose_expand_of_collapse_dynamic(%arg0 : tensor<4x?x10x64x2xf16>, %arg1 : index) -> tensor<4x?x10x128xf16> {
  %collapsed = tensor.collapse_shape %arg0 [[0, 1], [2], [3, 4]] : tensor<4x?x10x64x2xf16> into tensor<?x10x128xf16>
  %expanded = tensor.expand_shape %collapsed [[0, 1], [2], [3]] output_shape [4, %arg1,  10, 128] : tensor<?x10x128xf16> into tensor<4x?x10x128xf16>
  return %expanded : tensor<4x?x10x128xf16>
}


// -----

func.func @no_compose_collapse_of_expand_dynamic(%arg0 : tensor<?x8x128x?xf16>, %arg1: index) -> tensor<?x128x?xf16> {
  %collapse = tensor.collapse_shape %arg0 [[0, 1, 2, 3]] : tensor<?x8x128x?xf16> into tensor<?xf16>
  %expanded_19 = tensor.expand_shape %collapse [[0, 1, 2]] output_shape [%arg1, 128, %arg1] : tensor<?xf16> into tensor<?x128x?xf16>
  return %expanded_19 : tensor<?x128x?xf16>
}

// -----

func.func @zero_rank_reshape_multi(%arg0: tensor<f32>) -> tensor<f32> {
  %0 = tensor.expand_shape %arg0 [] output_shape [1] : tensor<f32> into tensor<1xf32>
  %1 = tensor.expand_shape %0 [[0, 1]] output_shape [1, 1] : tensor<1xf32> into tensor<1x1xf32>
  %2 = tensor.collapse_shape %1 [] : tensor<1x1xf32> into tensor<f32>
  return %2 : tensor<f32>
}

// -----

func.func @compose_collapse_of_collapse(%arg0 : tensor<?x?x?x?x?xf32>)
    -> tensor<?x?xf32> {
  %0 = tensor.collapse_shape %arg0 [[0, 1], [2], [3, 4]]
      : tensor<?x?x?x?x?xf32> into tensor<?x?x?xf32>
  %1 = tensor.collapse_shape %0 [[0, 1], [2]]
      : tensor<?x?x?xf32> into tensor<?x?xf32>
  return %1 : tensor<?x?xf32>
}

// -----

func.func @compose_collapse_of_collapse_zero_dim(%arg0 : tensor<1x1x1xf32>)
    -> tensor<f32> {
  %0 = tensor.collapse_shape %arg0 [[0, 1, 2]]
      : tensor<1x1x1xf32> into tensor<1xf32>
  %1 = tensor.collapse_shape %0 [] : tensor<1xf32> into tensor<f32>
  return %1 : tensor<f32>
}

// -----

func.func @fold_collapse_of_expand_1D(%arg0 : tensor<4x512xf32>) -> tensor<2048xf32> {
  %0 = tensor.expand_shape %arg0 [[0, 1, 2], [3]] output_shape [1, 4, 1, 512]
    : tensor<4x512xf32> into tensor<1x4x1x512xf32>
  %1 = tensor.collapse_shape %0 [[0, 1, 2, 3]]
    : tensor<1x4x1x512xf32> into tensor<2048xf32>
  return %1 : tensor<2048xf32>
}

// -----

func.func @fold_collapse_of_expand_unit_dims(%arg0 : tensor<2048x1x1xf32>)
    -> tensor<4x512x1x1xf32> {
  %0 = tensor.expand_shape %arg0 [[0, 1, 2, 3], [4], [5]] output_shape [1, 4, 1, 512, 1, 1] : tensor<2048x1x1xf32> into tensor<1x4x1x512x1x1xf32>
  %1 = tensor.collapse_shape %0 [[0, 1, 2], [3], [4], [5]]
    : tensor<1x4x1x512x1x1xf32> into tensor<4x512x1x1xf32>
  return %1 : tensor<4x512x1x1xf32>
}

// -----

func.func @compose_collapse_of_expand_unit_dims(%arg0 : tensor<2048x1x2048xf32>)
    -> tensor<4x512x1x512x4xf32> {
  %0 = tensor.expand_shape %arg0 [[0, 1, 2, 3, 4], [5], [6, 7, 8]] output_shape [1, 4, 1, 512, 1, 1, 512, 1, 4] : tensor<2048x1x2048xf32> into tensor<1x4x1x512x1x1x512x1x4xf32>
  %1 = tensor.collapse_shape %0 [[0, 1, 2], [3, 4], [5], [6, 7], [8]]
    : tensor<1x4x1x512x1x1x512x1x4xf32> into tensor<4x512x1x512x4xf32>
  return %1 : tensor<4x512x1x512x4xf32>
}

// -----

func.func @compose_collapse_of_expand_trailing_unit_dims(%arg0: tensor<2xf32>)
    -> tensor<2x1xf32> {
  %0 = tensor.expand_shape %arg0 [[0, 1, 2]] output_shape [2, 1, 1]
      : tensor<2xf32> into tensor<2x1x1xf32>
  %1 = tensor.collapse_shape %0 [[0], [1, 2]]
      : tensor<2x1x1xf32> into tensor<2x1xf32>
  return %1 : tensor<2x1xf32>
}

// -----

func.func @compose_collapse_of_collapse_unit_dims_dynamic(
    %arg0 : tensor<?x1x?x1x1x?x?x1x1xf32>) -> tensor<?x?x?x?xf32> {
  %0 = tensor.collapse_shape %arg0 [[0], [1, 2], [3], [4], [5], [6, 7, 8]]
    : tensor<?x1x?x1x1x?x?x1x1xf32> into tensor<?x?x1x1x?x?xf32>
  %1 = tensor.collapse_shape %0 [[0], [1], [2, 3, 4], [5]]
    : tensor<?x?x1x1x?x?xf32> into tensor<?x?x?x?xf32>
  return %1 : tensor<?x?x?x?xf32>
}

// -----

func.func @fold_collapse_of_expand_trailing_unit_dims(%arg0: tensor<2xf32>)
    -> tensor<2x1xf32> {
  %0 = tensor.expand_shape %arg0 [[0, 1, 2]] output_shape [2, 1, 1] : tensor<2xf32> into tensor<2x1x1xf32>
  %1 = tensor.collapse_shape %0 [[0], [1, 2]]
      : tensor<2x1x1xf32> into tensor<2x1xf32>
  return %1 : tensor<2x1xf32>
}

// -----

func.func @fold_collapse_of_collapse_trailing_unit_dims_dynamic(
    %arg0: tensor<1x1x?x1x1x1xf32>) -> tensor<?xf32> {
  %0 = tensor.collapse_shape %arg0 [[0, 1, 2], [3], [4], [5]]
      : tensor<1x1x?x1x1x1xf32> into tensor<?x1x1x1xf32>
  %1 = tensor.collapse_shape %0 [[0, 1, 2, 3]]
      : tensor<?x1x1x1xf32> into tensor<?xf32>
  return %1 : tensor<?xf32>
}

// -----

func.func @fold_collapse_of_expand_trailing_unit_dims(%arg0: tensor<12x42x1x1xf32>)
    -> tensor<12x42xf32> {
  %0 = tensor.expand_shape %arg0 [[0], [1], [2], [3, 4]] output_shape [12, 42, 1, 1, 1] : tensor<12x42x1x1xf32> into tensor<12x42x1x1x1xf32>
  %1 = tensor.collapse_shape %0 [[0], [1, 2, 3, 4]]
      : tensor<12x42x1x1x1xf32> into tensor<12x42xf32>
  return %1 : tensor<12x42xf32>
}

// -----

func.func @fold_collapse_of_expand_unit_dims_in_middle(%arg0 : tensor<?x?x?xf32>, %sz0: index, %sz1: index, %sz2: index)
    -> tensor<?x?xf32> {
  %0 = tensor.expand_shape %arg0 [[0], [1], [2, 3]] output_shape [%sz0, %sz1, 1, %sz2]
      : tensor<?x?x?xf32> into tensor<?x?x1x?xf32>
  %1 = tensor.collapse_shape %0 [[0], [1, 2, 3]]
      : tensor<?x?x1x?xf32> into tensor<?x?xf32>
  return %1 : tensor<?x?xf32>
}

// -----

func.func @no_fold_collapse_of_expand_incompatible(%arg0 : tensor<4x6x8xf32>)
    -> tensor<2x6x16xf32> {
  %0 = tensor.expand_shape %arg0 [[0, 1], [2, 3], [4]] output_shape [2, 2, 3, 2, 8]
      : tensor<4x6x8xf32> into tensor<2x2x3x2x8xf32>
  %1 = tensor.collapse_shape %0 [[0], [1, 2], [3, 4]]
      : tensor<2x2x3x2x8xf32> into tensor<2x6x16xf32>
  return %1 : tensor<2x6x16xf32>
}

// -----

func.func @no_fold_collapse_of_expand_empty_expr(%arg0: tensor<3x2x2xf32>)
    -> tensor<12x1xf32> {
  %0 = tensor.expand_shape %arg0 [[0], [1], [2, 3]] output_shape [3, 2, 2, 1]
      : tensor<3x2x2xf32> into tensor<3x2x2x1xf32>
  %1 = tensor.collapse_shape %0 [[0, 1, 2], [3]]
      : tensor<3x2x2x1xf32> into tensor<12x1xf32>
  return %1 : tensor<12x1xf32>
}

// -----

func.func @reshape_splat_constant_int32() -> tensor<2x4x2xi32> {
  %c0 = arith.constant dense<42> : tensor<2x8xi32>
  %0 = tensor.expand_shape %c0 [[0], [1, 2]] output_shape [2, 4, 2]
      : tensor<2x8xi32> into tensor<2x4x2xi32>
  return %0 : tensor<2x4x2xi32>
}
// -----
func.func @expand_shape_splat(%arg : f32) -> tensor<2x2x2xf32> {
  %c0 = tensor.splat %arg : tensor<2x4xf32>
  %0 = tensor.expand_shape %c0 [[0], [1, 2]] output_shape [2, 2, 2]
      : tensor<2x4xf32> into tensor<2x2x2xf32>
  return %0 : tensor<2x2x2xf32>
}

// -----

func.func @expand_shape_splat_dynamic_no_fold(%arg: f32, %m: index, %sz0: index) -> tensor<2x2x?xf32> {
  %c0 = tensor.splat %arg[%m] : tensor<2x?xf32>
  %0 = tensor.expand_shape %c0 [[0], [1, 2]] output_shape [2, 2, %sz0] : tensor<2x?xf32> into tensor<2x2x?xf32>
  return %0 : tensor<2x2x?xf32>
}

// -----

func.func @collapse_shape_splat(%arg : f32) -> tensor<2x4xf32> {
  %c0 = tensor.splat %arg : tensor<2x2x2xf32>
  %0 = tensor.collapse_shape %c0 [[0], [1, 2]]
      : tensor<2x2x2xf32> into tensor<2x4xf32>
  return %0 : tensor<2x4xf32>
}

// -----

func.func @collapse_shape_splat_dynamic_no_fold(%f: f32, %m: index) -> tensor<2x?xf32> {
  %c0 = tensor.splat %f[%m] : tensor<2x2x?xf32>
  %0 = tensor.collapse_shape %c0 [[0], [1, 2]] : tensor<2x2x?xf32> into tensor<2x?xf32>
  return %0 : tensor<2x?xf32>
}

// -----

func.func @reshape_splat_constant_int16() -> tensor<2x4x2xi16> {
  %c0 = arith.constant dense<42> : tensor<2x8xi16>
  %0 = tensor.expand_shape %c0 [[0], [1, 2]] output_shape [2, 4, 2]
      : tensor<2x8xi16> into tensor<2x4x2xi16>
  return %0 : tensor<2x4x2xi16>
}

// -----

func.func @reshape_splat_constant_float32() -> tensor<2x4x2xf32> {
  %c0 = arith.constant dense<42.0> : tensor<2x8xf32>
  %0 = tensor.expand_shape %c0 [[0], [1, 2]] output_shape [2, 4, 2]
      : tensor<2x8xf32> into tensor<2x4x2xf32>
  return %0 : tensor<2x4x2xf32>
}

// -----

func.func @reshape_splat_constant_float64() -> tensor<2x4x2xf64> {
  %c0 = arith.constant dense<42.0> : tensor<2x8xf64>
  %0 = tensor.expand_shape %c0 [[0], [1, 2]] output_shape [2, 4, 2]
      : tensor<2x8xf64> into tensor<2x4x2xf64>
  return %0 : tensor<2x4x2xf64>
}

// -----

// Regression test for https://github.com/llvm/llvm-project/issues/177845:
// tensor.expand_shape of a constant to a dynamic shape must not crash.
// FoldReshapeWithConstant must not call DenseElementsAttr::getFromRawBuffer
// when the result type is dynamic (getFromRawBuffer requires static shape).

func.func @expand_shape_splat_constant_dynamic_result(%n: index) -> tensor<?xi32> {
  %cst = arith.constant dense<1> : tensor<i32>
  %result = tensor.expand_shape %cst [] output_shape [%n] : tensor<i32> into tensor<?xi32>
  return %result : tensor<?xi32>
}

// -----

func.func @fold_rank() -> (index) {
  %const_0 = arith.constant dense<[[[1, -2, 1, 36]], [[0, 2, -1, 64]]]>
    : tensor<2x1x4xi32>

  // Fold a ank into a constant
  %rank_0 = tensor.rank %const_0 : tensor<2x1x4xi32>

  return %rank_0 : index
}

// -----

func.func @pad_same_static_shape(%arg0: tensor<5x6xf32>, %a: index)
    -> tensor<5x6xf32> {
  %cst = arith.constant 0.000000e+00 : f32
  %0 = tensor.pad %arg0 low[%a, 0] high[0, %a] {
        ^bb0(%arg1: index, %arg2: index):
          tensor.yield %cst : f32
  } : tensor<5x6xf32> to tensor<5x6xf32>
  return %0 : tensor<5x6xf32>
}

// -----

func.func @pad_fold_static(%arg0: tensor<?x64x?x?xf32>) -> tensor<?x?x?x?xf32> {
  %c0 = arith.constant 0 : index
  %cst = arith.constant 0.000000e+00 : f32
  %padding = arith.constant 4 : index
  %padded = tensor.pad %arg0 low[0, %padding, 1, 1] high[0, %padding, 1, 1]  {
    ^bb0(%arg1: index, %arg2: index, %arg3: index, %arg4: index):
    tensor.yield %cst: f32
  } : tensor<?x64x?x?xf32> to tensor<?x?x?x?xf32>
  return %padded : tensor<?x?x?x?xf32>
}

// -----

func.func @pad_nofold_same_static_shape(%arg0: tensor<5x6xf32>, %a: index)
    -> tensor<5x6xf32> {
  %cst = arith.constant 0.000000e+00 : f32
  %0 = tensor.pad %arg0 nofold low[%a, 0] high[0, %a] {
        ^bb0(%arg1: index, %arg2: index):
          tensor.yield %cst : f32
  } : tensor<5x6xf32> to tensor<5x6xf32>
  return %0 : tensor<5x6xf32>
}

// -----

func.func @pad_after_cast_different_shape(%arg0: tensor<?x64x?x?xf32>)
    -> tensor<?x?x?x?xf32> {
  %cst = arith.constant 0.000000e+00 : f32
  %dynamic = tensor.cast %arg0 : tensor<?x64x?x?xf32> to tensor<?x?x?x?xf32>
  %padded = tensor.pad %dynamic low[0, 0, 1, 1] high[0, 0, 1, 1]  {
    ^bb0(%arg1: index, %arg2: index, %arg3: index, %arg4: index):
    tensor.yield %cst: f32
  } : tensor<?x?x?x?xf32> to tensor<?x?x?x?xf32>
  return %padded: tensor<?x?x?x?xf32>
}

// -----

func.func @pad_after_cast_same_shape(%arg0: tensor<?x64x?x?xf32>, %padding : index)
    -> tensor<?x?x?x?xf32> {
  %cst = arith.constant 0.000000e+00 : f32
  %dynamic = tensor.cast %arg0 : tensor<?x64x?x?xf32> to tensor<?x?x?x?xf32>
  %padded = tensor.pad %dynamic low[0, %padding, 1, 1] high[0, %padding, 1, 1]  {
    ^bb0(%arg1: index, %arg2: index, %arg3: index, %arg4: index):
    tensor.yield %cst: f32
  } : tensor<?x?x?x?xf32> to tensor<?x?x?x?xf32>
  return %padded: tensor<?x?x?x?xf32>
}

// -----

func.func @pad_of_cast(%t: tensor<8x?xf32>, %s: index) -> tensor<8x32xf32> {
  %c0 = arith.constant 0 : index
  %cst = arith.constant 0.000000e+00 : f32
  %0 = tensor.cast %t : tensor<8x?xf32> to tensor<?x?xf32>
  %1 = tensor.pad %0 low[%c0, %c0] high[%c0, %s]  {
  ^bb0(%arg9: index, %arg10: index):
    tensor.yield %cst : f32
  } : tensor<?x?xf32> to tensor<8x32xf32>
  return %1 : tensor<8x32xf32>
}

// -----

func.func @cast_of_pad_more_static(%arg0: tensor<?x?xf32>, %padding: index) -> tensor<32x32xf32> {
  %cst = arith.constant 0.000000e+00 : f32
  %padded = tensor.pad %arg0 low[%padding, %padding] high[0, 0] {
  ^bb0(%arg1: index, %arg2: index):
    tensor.yield %cst : f32
  } : tensor<?x?xf32> to tensor<?x?xf32>
  %casted = tensor.cast %padded : tensor<?x?xf32> to tensor<32x32xf32>
  return %casted : tensor<32x32xf32>
}

// -----

func.func @cast_of_pad_less_static(%arg0: tensor<32x?x?xf32>, %padding: index) -> tensor<?x32x32xf32> {
  %cst = arith.constant 0.000000e+00 : f32
  %padded = tensor.pad %arg0 low[%padding, %padding, %padding] high[0, 0, 0] {
  ^bb0(%arg1: index, %arg2: index, %arg3: index):
    tensor.yield %cst : f32
  } : tensor<32x?x?xf32> to tensor<32x?x?xf32>
  %casted = tensor.cast %padded : tensor<32x?x?xf32> to tensor<?x32x32xf32>
  return %casted : tensor<?x32x32xf32>
}

// -----

func.func @pad_cast_fold(%arg0: tensor<4x4xf32>) -> tensor<4x4xf32> {
  %c0 = arith.constant 0 : index
  %cst = arith.constant 0.0 : f32
  %0 = tensor.cast %arg0 : tensor<4x4xf32> to tensor<?x?xf32>
  %1 = tensor.pad %0 low[%c0, %c0] high[%c0, %c0]  {
    ^bb0(%arg1: index, %arg2: index):
      tensor.yield %cst : f32
  } : tensor<?x?xf32> to tensor<4x4xf32>
  return %1 : tensor<4x4xf32>
}

// -----

func.func @fold_pad_source_cast(%arg0: tensor<4x?xf32>) -> tensor<4x4xf32> {
  %cst = arith.constant 0.0 : f32
  %0 = tensor.cast %arg0 : tensor<4x?xf32> to tensor<?x?xf32>
  %1 = tensor.pad %0 low[0, 0] high[0, 1]  {
    ^bb0(%arg1: index, %arg2: index):
      tensor.yield %cst : f32
  } : tensor<?x?xf32> to tensor<4x4xf32>
  return %1 : tensor<4x4xf32>
}

// -----

func.func @pad_static_zero_cast(%arg0: tensor<?x?x?xf32>, %pad_value: f32) -> tensor<2x3x4xf32> {
  %c0 = arith.constant 0 : index
  %0 = tensor.pad %arg0 low[0, %c0, 0] high[0, 0, %c0] {
    ^bb0(%arg1: index, %arg2: index, %arg3: index):
      tensor.yield %pad_value : f32
    } : tensor<?x?x?xf32> to tensor<2x3x4xf32>

  return %0 : tensor<2x3x4xf32>
}

// -----

func.func @pad_nofold_static_zero(%arg0: tensor<?x?x?xf32>, %pad_value: f32) -> tensor<2x3x4xf32> {
  %c0 = arith.constant 0 : index
  %0 = tensor.pad %arg0 nofold low[0, %c0, 0] high[0, 0, %c0] {
    ^bb0(%arg1: index, %arg2: index, %arg3: index):
      tensor.yield %pad_value : f32
    } : tensor<?x?x?xf32> to tensor<2x3x4xf32>

  return %0 : tensor<2x3x4xf32>
}

// -----

func.func @fold_orthogonal_pad_chains(%arg0: tensor<64x64xf32>,
                                      %sz0 : index, %sz1 : index,
                                      %pw0 : index, %pw1 : index) -> tensor<8x4xf32> {
  %pad_value = arith.constant 0.0 : f32
  %0 = tensor.extract_slice %arg0[16, 0] [%sz0, 64] [1, 1] : tensor<64x64xf32> to tensor<?x64xf32>
  %1 = tensor.pad %0 low[0, 0] high[%pw0, 0] {
    ^bb0(%arg1: index, %arg2: index):
      tensor.yield %pad_value : f32
    } : tensor<?x64xf32> to tensor<8x64xf32>
  %2 = tensor.extract_slice %1[0, 4] [8, %sz1] [1, 1] : tensor<8x64xf32> to tensor<8x?xf32>
  %3 = tensor.pad %2 nofold low[0, 0] high[0, %pw1] {
    ^bb0(%arg1: index, %arg2: index):
      tensor.yield %pad_value : f32
    } : tensor<8x?xf32> to tensor<8x4xf32>
  func.return %3 : tensor<8x4xf32>
}

// -----

func.func @dont_fold_pad_chains(%arg0: tensor<64x64xf32>,
                                %sz0 : index, %sz1 : index,
                                %pw0 : index, %pw1 : index) -> (tensor<8x4xf32>, tensor<4x64xf32>, tensor<8x4xf32>, tensor<6x4xf32>) {
  %pad_value = arith.constant 0.0 : f32
  %0 = tensor.extract_slice %arg0[16, 0] [%sz0, 64] [1, 1] : tensor<64x64xf32> to tensor<?x64xf32>
  %1 = tensor.pad %0 low[0, 0] high[%pw0, 0] {
    ^bb0(%arg1: index, %arg2: index):
      tensor.yield %pad_value : f32
    } : tensor<?x64xf32> to tensor<8x64xf32>

  // Don't fold if the padding values are different.
  %different_value = arith.constant 1.0 : f32
  %2 = tensor.extract_slice %1[0, 4] [8, %sz1] [1, 1] : tensor<8x64xf32> to tensor<8x?xf32>
  %3 = tensor.pad %2 nofold low[0, 0] high[0, %pw1] {
    ^bb0(%arg1: index, %arg2: index):
      tensor.yield %different_value : f32
    } : tensor<8x?xf32> to tensor<8x4xf32>

  // Don't fold if the pad ops have common padding dimensions.
  %4 = tensor.extract_slice %1[4, 0] [%sz1, 64] [1, 1] : tensor<8x64xf32> to tensor<?x64xf32>
  %5 = tensor.pad %4 nofold low[0, 0] high[%pw1, 0] {
    ^bb0(%arg1: index, %arg2: index):
      tensor.yield %pad_value : f32
    } : tensor<?x64xf32> to tensor<4x64xf32>

  // Don't fold if padded source tensor dimension is accessed at an offset.
  %6 = tensor.extract_slice %1[%sz0, 4] [8, %sz1] [1, 1] : tensor<8x64xf32> to tensor<8x?xf32>
  %7 = tensor.pad %6 nofold low[0, 0] high[0, %pw1] {
    ^bb0(%arg1: index, %arg2: index):
      tensor.yield %pad_value : f32
    } : tensor<8x?xf32> to tensor<8x4xf32>

  // Don't fold if a padded source tensor dimension is sliced.
  %8 = tensor.extract_slice %1[0, 4] [6, %sz1] [1, 1] : tensor<8x64xf32> to tensor<6x?xf32>
  %9 = tensor.pad %8 nofold low[0, 0] high[0, %pw1] {
    ^bb0(%arg1: index, %arg2: index):
      tensor.yield %pad_value : f32
    } : tensor<6x?xf32> to tensor<6x4xf32>

  func.return %3, %5, %7, %9 : tensor<8x4xf32>, tensor<4x64xf32>, tensor<8x4xf32>, tensor<6x4xf32>
}

// -----

func.func @merge_constant_padding(%arg0: tensor<2x3xf32>, %pad_value: f32) -> tensor<7x8xf32> {
  %pad0 = tensor.pad %arg0 low[1, 1] high[1, 0] {
    ^bb0(%b0: index, %b1 : index):
      tensor.yield %pad_value : f32
    } : tensor<2x3xf32> to tensor<4x4xf32>
  %pad1 = tensor.pad %pad0 low[0, 2] high[3, 2] {
    ^bb0(%b2: index, %b3 : index):
      tensor.yield %pad_value : f32
    } : tensor<4x4xf32> to tensor<7x8xf32>
  return %pad1 : tensor<7x8xf32>
}

// -----

func.func @merge_constant_padding_dynamic(%arg0: tensor<?x?xf32>, %idx: index, %pad_value: f32) -> tensor<?x?xf32> {
  %pad0 = tensor.pad %arg0 low[%idx, 1] high[1, 0] {
    ^bb0(%b0: index, %b1 : index):
      tensor.yield %pad_value : f32
    } : tensor<?x?xf32> to tensor<?x?xf32>
  %pad1 = tensor.pad %pad0 low[0, 2] high[%idx, 2] {
    ^bb0(%b2: index, %b3 : index):
      tensor.yield %pad_value : f32
    } : tensor<?x?xf32> to tensor<?x?xf32>
  return %pad1 : tensor<?x?xf32>
}

// -----

// Verify that folding does not happen if it would drop a nofold attribute
func.func @dont_merge_constant_padding_nofold(%arg0: tensor<2x3xf32>, %pad_value: f32) -> tensor<7x8xf32> {
  %pad0 = tensor.pad %arg0 nofold low[1, 1] high[1, 0] {
    ^bb0(%b0: index, %b1 : index):
      tensor.yield %pad_value : f32
    } : tensor<2x3xf32> to tensor<4x4xf32>
  %pad1 = tensor.pad %pad0 low[0, 2] high[3, 2] {
    ^bb0(%b2: index, %b3 : index):
      tensor.yield %pad_value : f32
    } : tensor<4x4xf32> to tensor<7x8xf32>
  return %pad1 : tensor<7x8xf32>
}

// -----

// Verify that folding does not happen if it would drop a nofold attribute
func.func @dont_merge_constant_padding_different_vals(
    %arg0: tensor<2x3xf32>,
    %pad_value0: f32,
    %pad_value1: f32) -> tensor<7x8xf32> {
  %pad0 = tensor.pad %arg0 low[1, 1] high[1, 0] {
    ^bb0(%b0: index, %b1 : index):
      tensor.yield %pad_value0 : f32
    } : tensor<2x3xf32> to tensor<4x4xf32>
  %pad1 = tensor.pad %pad0 low[0, 2] high[3, 2] {
    ^bb0(%b2: index, %b3 : index):
      tensor.yield %pad_value1 : f32
    } : tensor<4x4xf32> to tensor<7x8xf32>
  return %pad1 : tensor<7x8xf32>
}

// -----

func.func @fold_collapse_shape_from_elements(%arg0: i32) -> tensor<i32> {
  %0 = tensor.from_elements %arg0 : tensor<1xi32>
  %1 = tensor.collapse_shape %0 [] : tensor<1xi32> into tensor<i32>
  return %1 : tensor<i32>
}

// -----

func.func @fold_expand_shape_from_elements(%arg0: i32) -> tensor<1xi32> {
  %0 = tensor.from_elements %arg0 : tensor<i32>
  %1 = tensor.expand_shape %0 [] output_shape [1] : tensor<i32> into tensor<1xi32>
  return %1 : tensor<1xi32>
}

// -----

func.func @propagate_index_cast(%arg0: tensor<1xi32>) -> index {
  %c0 = arith.constant 0 : index
  %0 = arith.index_cast %arg0 : tensor<1xi32> to tensor<1xindex>
  %1 = tensor.extract %0[%c0] : tensor<1xindex>
  return %1 : index
}

// -----

func.func @splat_fold() -> tensor<4xf32> {
  %c = arith.constant 1.0 : f32
  %t = tensor.splat %c : tensor<4xf32>
  return %t : tensor<4xf32>

}

// -----

func.func @splat_dynamic_no_fold(%m: index) -> tensor<4x?xf32> {
  %f = arith.constant 1.0 : f32

  %t = tensor.splat %f[%m] : tensor<4x?xf32>
  return %t : tensor<4x?xf32>
}

// -----

func.func @cast_extract_slice(%arg0 : tensor<128x512xf32>, %s : index, %o : index)
    -> tensor<16x512xf32> {
  %0 = tensor.extract_slice %arg0[%o, 0] [%s, 512] [1, 1] : tensor<128x512xf32> to tensor<?x512xf32>
  %1 = tensor.cast %0 : tensor<?x512xf32> to tensor<16x512xf32>
  return %1 : tensor<16x512xf32>
}

// -----

func.func @cast_extract_slice_rank_reduce(%arg0 : tensor<128x512xf32>, %s : index, %o : index)
    -> tensor<16xf32> {
  %0 = tensor.extract_slice %arg0[%o, 0] [%s, 1] [1, 1] : tensor<128x512xf32> to tensor<?xf32>
  %1 = tensor.cast %0 : tensor<?xf32> to tensor<16xf32>
  return %1 : tensor<16xf32>
}

// -----

func.func @canonicalize_parallel_insert_slice_indices(
    %arg0 : tensor<1x5xf32>, %arg1: tensor<?x?xf32>,
    %num_threads : index) -> tensor<?x?xf32>
{
  %cst = arith.constant 4.200000e+01 : f32
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index

  %2 = scf.forall (%tidx) in (%num_threads) shared_outs(%o = %arg1) -> (tensor<?x?xf32>) {
    %3 = tensor.cast %arg0 : tensor<1x5xf32> to tensor<?x5xf32>
    scf.forall.in_parallel {
      tensor.parallel_insert_slice %3 into %o[%tidx, %c0] [%c1, 5] [%c1, %c1] : tensor<?x5xf32> into tensor<?x?xf32>
    }
  }
  return %2 : tensor<?x?xf32>
}

// -----

func.func @fold_insert_slice_after_extract_slice(%input: tensor<1x2x2x4xf32>) -> tensor<1x2x2x4xf32> {
  %c0 = arith.constant 0 : index
  %0 = tensor.extract_slice %input[0, 0, 0, 0] [1, 1, 2, 4] [1, 1, 1, 1] : tensor<1x2x2x4xf32> to tensor<1x2x4xf32>
  %1 = tensor.insert_slice %0 into %input[%c0, 0, %c0, 0] [1, 1, 2, 4] [1, 1, 1, 1] : tensor<1x2x4xf32> into tensor<1x2x2x4xf32>
  return %1: tensor<1x2x2x4xf32>
}

// -----

func.func @dont_fold_mismatched_source_dst(%input0: tensor<1x2x2x4xf32>, %input1: tensor<1x2x2x4xf32>) -> tensor<1x2x2x4xf32> {
  %c0 = arith.constant 0 : index
  %0 = tensor.extract_slice %input0[0, 0, 0, 0] [1, 1, 2, 4] [1, 1, 1, 1] : tensor<1x2x2x4xf32> to tensor<1x2x4xf32>
  %1 = tensor.insert_slice %0 into %input1[%c0, 0, %c0, 0] [1, 1, 2, 4] [1, 1, 1, 1] : tensor<1x2x4xf32> into tensor<1x2x2x4xf32>
  return %1: tensor<1x2x2x4xf32>
}

// -----

func.func @dont_fold_mismatched_parameters(%input: tensor<1x2x2x4xf32>) -> tensor<1x2x2x4xf32> {
  %c0 = arith.constant 0 : index
  %0 = tensor.extract_slice %input[0, 0, 0, 0] [1, 1, 2, 4] [1, 1, 1, 1] : tensor<1x2x2x4xf32> to tensor<1x2x4xf32>
  %1 = tensor.insert_slice %0 into %input[%c0, 1, %c0, 0] [1, 1, 2, 4] [1, 1, 1, 1] : tensor<1x2x4xf32> into tensor<1x2x2x4xf32>
  return %1: tensor<1x2x2x4xf32>
}

// -----

func.func @empty_canonicalize() -> (tensor<4x5x?xf32>) {
  %c6 = arith.constant 6 : index
  %0 = tensor.empty(%c6) : tensor<4x5x?xf32>
  return %0 : tensor<4x5x?xf32>
}

// -----

func.func @fold_empty_tensor_with_cast(%arg0 : index) -> tensor<1x12xf32> {
  %0 = tensor.empty(%arg0) : tensor<?x12xf32>
  %1 = tensor.cast %0 : tensor<?x12xf32> to tensor<1x12xf32>
  return %1 : tensor<1x12xf32>
}

// -----

func.func @fold_empty_tensor_with_cast_encoding(%arg0 : index)
    -> tensor<1x12xf32, "foo"> {
  %0 = tensor.empty(%arg0) : tensor<?x12xf32, "foo">
  %1 = tensor.cast %0 : tensor<?x12xf32, "foo"> to tensor<1x12xf32, "foo">
  return %1 : tensor<1x12xf32, "foo">
}

// -----

func.func private @some_use(%i : index, %j : index)

func.func @empty_tensor_canonicalize(%i : index) {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index

  %0 = tensor.empty(%i) : tensor<?x42xf32>

  %1 = tensor.dim %0, %c0: tensor<?x42xf32>
  %2 = tensor.dim %0, %c1: tensor<?x42xf32>

  call @some_use(%1, %2) : (index, index) -> ()

  return
}

// -----

func.func @dim_of_expand_shape(%t: tensor<?x?xf32>, %sz0: index, %sz1: index) -> index {
  %c2 = arith.constant 2 : index
  %0 = tensor.expand_shape %t [[0], [1, 2, 3, 4, 5]] output_shape [%sz0, 1, %sz1, 5, 1, 8]
      : tensor<?x?xf32> into tensor<?x1x?x5x1x8xf32>
  %1 = tensor.dim %0, %c2 : tensor<?x1x?x5x1x8xf32>
  return %1 : index
}

// -----

func.func @dim_of_collapse_shape(%t: tensor<?x?x?x7x?xf32>) -> index {
  %c1 = arith.constant 1 : index
  %0 = tensor.collapse_shape %t [[0], [1, 2, 3, 4]]
      : tensor<?x?x?x7x?xf32> into tensor<?x?xf32>
  %1 = tensor.dim %0, %c1 : tensor<?x?xf32>
  return %1 : index
}

// -----

// Can't fold when dim is out of bound.
func.func @out_of_bound_dim_of_collapse_shape(%t: tensor<?x?x?x7x?xf32>) -> index {
  %c5 = arith.constant 5 : index
  %0 = tensor.collapse_shape %t [[0], [1, 2, 3, 4]]
      : tensor<?x?x?x7x?xf32> into tensor<?x?xf32>
  %1 = tensor.dim %0, %c5 : tensor<?x?xf32>
  return %1 : index
}

// -----

func.func @collapse_expand_fold_to_cast(%t: tensor<?xf32>, %sz0: index) -> (tensor<?xf32>)
{
  %0 = tensor.expand_shape %t [[0, 1]] output_shape [1, %sz0] : tensor<?xf32> into tensor<1x?xf32>
  %1 = tensor.collapse_shape %0 [[0, 1]] : tensor<1x?xf32> into tensor<?xf32>
  return %1 : tensor<?xf32>
}

// -----

func.func @invalid_empty_negative_size() -> (tensor<4x5x?xf32>) {
  %c1 = arith.constant 1 : index
  %cn2 = arith.constant 2 : index
  %0 = index.sub %c1, %cn2
  %1 = tensor.empty(%0) : tensor<4x5x?xf32>
  return %1 : tensor<4x5x?xf32>
}

// -----

// The IR in this test case in invalid. This test tests that the canonicalizer
// does not crash.

func.func @invalid_slice_ops(%t: tensor<?xf32>, %t2: tensor<?xf32>) -> tensor<?xf32> {
  %c = arith.constant -5 : index
  %0 = tensor.extract_slice %t[0][%c][1] : tensor<?xf32> to tensor<?xf32>
  %1 = tensor.insert_slice %0 into %t2[2][%c][1] : tensor<?xf32> into tensor<?xf32>
  return %1 : tensor<?xf32>
}

// -----

func.func @generate_negative_size_verifies() -> tensor<?x8xi32> {
  %cst = arith.constant 0 : i32
  %c0 = arith.constant 0 : index
  %size = affine.max affine_map<(d0) -> (d0 mod 64 - 8)>(%c0)
  %tensor = tensor.generate %size {
  ^bb0(%arg0: index, %arg1: index):
    tensor.yield %cst : i32
  } : tensor<?x8xi32>
  return %tensor : tensor<?x8xi32>
}


// -----

// Test case: Folding of tensor.dim(tensor.reshape %v %shp, %idx) -> tensor.extract %shp[%idx]
func.func @dim_of_reshape(%arg0: tensor<*xf32>, %arg1: tensor<?xindex>)
    -> index {
  %c3 = arith.constant 3 : index
  %0 = tensor.reshape %arg0(%arg1)
      : (tensor<*xf32>, tensor<?xindex>) -> tensor<*xf32>
  // Update the shape to test that the load ends up in the right place.
  tensor.insert %c3 into %arg1[%c3] : tensor<?xindex>
  %1 = tensor.dim %0, %c3 : tensor<*xf32>
  return %1 : index
}

// -----

// Test case: Folding of tensor.dim(tensor.reshape %v %shp, %idx) -> tensor.extract %shp[%idx]
func.func @dim_of_reshape_i32(%arg0: tensor<*xf32>, %arg1: tensor<?xi32>)
    -> index {
    %c3 = arith.constant 3 : index
    %0 = tensor.reshape %arg0(%arg1)
        : (tensor<*xf32>, tensor<?xi32>) -> tensor<*xf32>
    %1 = tensor.dim %0, %c3 : tensor<*xf32>
    return %1 : index
}

// -----

// Test case: tensor.dim(tensor.reshape %v %shp, %idx) is folded into tensor.extract %shp[%idx]
func.func @dim_of_reshape_for( %arg0: tensor<*xf32>, %arg1: tensor<?xindex>) -> index {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index

    %0 = tensor.reshape %arg0(%arg1) : (tensor<*xf32>, tensor<?xindex>) -> tensor<*xf32>

    %1 = scf.for %arg2 = %c0 to %c4 step %c1 iter_args(%arg3 = %c1) -> (index) {
      %2 = tensor.dim %0, %arg2 : tensor<*xf32>
      %3 = arith.muli %arg3, %2 : index
      scf.yield %3 : index
    }
    return %1 : index
}

// -----

// Test case: tensor.dim(tensor.reshape %v %shp, %idx) is folded into tensor.extract %shp[%idx]
func.func @dim_of_reshape_undominated(%arg0: tensor<*xf32>, %arg1: tensor<?xindex>, %arg2: index) -> index {
    %c4 = arith.constant 4 : index
    %reshape = tensor.reshape %arg0(%arg1) : (tensor<*xf32>, tensor<?xindex>) -> tensor<*xf32>
    %0 = arith.muli %arg2, %c4 : index
    %dim = tensor.dim %reshape, %0 : tensor<*xf32>
    return %dim : index
  }

// -----

func.func @reshape_fold_2d(%arg0 : tensor<?x?xi32>) -> tensor<?x?xi32> {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %d0 = tensor.dim %arg0, %c0 : tensor<?x?xi32>
  %d1 = tensor.dim %arg0, %c1 : tensor<?x?xi32>
  %ds = tensor.from_elements %d0, %d1 : tensor<2xindex>
  %reshape = tensor.reshape %arg0(%ds) : (tensor<?x?xi32>, tensor<2xindex>) -> tensor<?x?xi32>
  return %reshape : tensor<?x?xi32>
}

// -----

func.func @reshape_nofold_2d(%arg0 : tensor<?x?xi32>) -> tensor<?x?xi32> {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %d0 = tensor.dim %arg0, %c0 : tensor<?x?xi32>
  %d1 = tensor.dim %arg0, %c1 : tensor<?x?xi32>
  %ds = tensor.from_elements %d1, %d0 : tensor<2xindex>
  %reshape = tensor.reshape %arg0(%ds) : (tensor<?x?xi32>, tensor<2xindex>) -> tensor<?x?xi32>
  return %reshape : tensor<?x?xi32>
}

// -----

func.func @reshape_nofold_2d_ins(%arg0 : tensor<?x?xi32>, %arg1: index, %arg2: index) -> tensor<?x?xi32> {
  %ds = tensor.from_elements %arg1, %arg2 : tensor<2xindex>
  %reshape = tensor.reshape %arg0(%ds) : (tensor<?x?xi32>, tensor<2xindex>) -> tensor<?x?xi32>
  return %reshape : tensor<?x?xi32>
}

// -----

func.func @reshape_fold_3d_cst(%arg0 : tensor<5x?x?xi32>) -> tensor<5x?x?xi32> {
  %c1 = arith.constant 1 : index
  %c2 = arith.constant 2 : index
  %d0 = arith.constant 5 : index
  %d1 = tensor.dim %arg0, %c1 : tensor<5x?x?xi32>
  %d2 = tensor.dim %arg0, %c2 : tensor<5x?x?xi32>
  %ds = tensor.from_elements %d0, %d1, %d2 : tensor<3xindex>
  %reshape = tensor.reshape %arg0(%ds) : (tensor<5x?x?xi32>, tensor<3xindex>) -> tensor<5x?x?xi32>
  return %reshape : tensor<5x?x?xi32>
}

// -----

// Test case: This test fails to fold because the index of tensor.dim is out_of_bounds
func.func @dim_out_of_bounds() -> vector<7xi32> {
    %c1 = arith.constant 1 : index
    %idx28 = index.constant 28
    %c29 = arith.constant 29 : index
    %3 = bufferization.alloc_tensor(%c29) : tensor<?xi16>
    %dim = tensor.dim %3, %idx28 : tensor<?xi16>
    %alloc_21 = memref.alloc(%c29) : memref<?x26x2xi32>
    %16 = affine.vector_load %alloc_21[%c1, %c1, %dim] : memref<?x26x2xi32>, vector<7xi32>
    return %16 : vector<7xi32>
}

// -----

func.func @fold_cast_multiple_results(%arg0: tensor<2x2xf32>, %arg1: tensor<2x2xf32>) -> index {
  %cast = tensor.cast %arg0 : tensor<2x2xf32> to tensor<?x2xf32>
  %cast_0 = tensor.cast %arg1 : tensor<2x2xf32> to tensor<?x2xf32>
  %0:2 = test.destination_style_op ins(%cast : tensor<?x2xf32>) outs(%cast_0 : tensor<?x2xf32>) -> tensor<?x2xf32>, index
  return %0#1 : index
}


// -----

func.func @fold_expand_of_cast(%arg0 : tensor<10x10xf32>)
    -> tensor<10x1x10xf32> {
  %c1 = arith.constant 1 : index 
  %c10 = arith.constant 10 : index 
  %0 = tensor.cast %arg0 : tensor<10x10xf32> to tensor<?x?xf32>
  %1 = tensor.expand_shape %0 [[0, 1], [2]] output_shape [%c10, %c1, %c10]
      : tensor<?x?xf32> into tensor<?x?x?xf32>
  %2 = tensor.cast %1 : tensor<?x?x?xf32> to tensor<10x1x10xf32>
  return %2 : tensor<10x1x10xf32>
}

// -----

func.func @sink_expand_of_cast(%arg0 : tensor<?x10xf32>)
    -> tensor<?x?x?xf32> {
  %c1 = arith.constant 1 : index
  %c10 = arith.constant 10 : index
  %0 = tensor.cast %arg0 : tensor<?x10xf32> to tensor<?x?xf32>
  %1 = tensor.expand_shape %0 [[0, 1], [2]] output_shape [%c10, %c1, %c10]
      : tensor<?x?xf32> into tensor<?x?x?xf32>
  return %1 : tensor<?x?x?xf32>
}

// -----

func.func @partial_sink_expand_of_cast(%arg0 : tensor<10x10xf32>, %arg1 : index, %arg2 : index)
    -> tensor<?x?x?xf32> {
  %c10 = arith.constant 10 : index
  %0 = tensor.cast %arg0 : tensor<10x10xf32> to tensor<?x?xf32>
  %1 = tensor.expand_shape %0 [[0, 1], [2]] output_shape [%arg1, %arg2, %c10]
      : tensor<?x?xf32> into tensor<?x?x?xf32>
  return %1 : tensor<?x?x?xf32>
}
