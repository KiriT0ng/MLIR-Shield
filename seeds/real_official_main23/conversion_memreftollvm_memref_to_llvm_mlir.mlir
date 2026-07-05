// Same below, but using the `ConvertToLLVMPatternInterface` entry point
// and the generic `convert-to-llvm` pass. This produces slightly different IR
// because the conversion target is set up differently.

// Use a common prefix instead (e.g. ALL).

func.func @view(%arg0 : index, %arg1 : index, %arg2 : index) {
  %0 = memref.alloc() : memref<2048xi8>

  // Test two dynamic sizes.
  %1 = memref.view %0[%arg2][%arg0, %arg1] : memref<2048xi8> to memref<?x?xf32>

  // Test one dynamic size.
  %3 = memref.view %0[%arg2][%arg1] : memref<2048xi8> to memref<4x?xf32>

  // Test static sizes.
  %5 = memref.view %0[%arg2][] : memref<2048xi8> to memref<64x4xf32>

  // Test view memory space.
  %6 = memref.alloc() : memref<2048xi8, 4>

  %7 = memref.view %6[%arg2][] : memref<2048xi8, 4> to memref<64x4xf32, 4>

  return
}

// -----


func.func @view_empty_memref(%offset: index, %mem: memref<0xi8>) {


  %0 = memref.view %mem[%offset][] : memref<0xi8> to memref<0x4xf32>

  return
}

// -----

func.func @view_memref_as_rank0(%offset: index, %mem: memref<2xi8>) {

  %memref_view_bf16 = memref.view %mem[%offset][] : memref<2xi8> to memref<bf16>

  return
}

// -----

// Subviews needs to be expanded outside of the memref-to-llvm pass.
func.func @subview(%0 : memref<64x4xf32, strided<[4, 1], offset: 0>>, %arg0 : index, %arg1 : index, %arg2 : index) {
  %1 = memref.subview %0[%arg0, %arg1][%arg0, %arg1][%arg0, %arg1] :
    memref<64x4xf32, strided<[4, 1], offset: 0>>
  to memref<?x?xf32, strided<[?, ?], offset: ?>>
  return
}

// -----

func.func @assume_alignment(%0 : memref<4x4xf16>) {
  %1 = memref.assume_alignment %0, 16 : memref<4x4xf16>
  return
}

// -----

func.func @distinct_objects(%arg0: memref<?xf16>, %arg1: memref<?xf32>, %arg2: memref<?xf64>) -> (memref<?xf16>, memref<?xf32>, memref<?xf64>) {
  %1, %2, %3 = memref.distinct_objects %arg0, %arg1, %arg2 : memref<?xf16>, memref<?xf32>, memref<?xf64>
  return %1, %2, %3 : memref<?xf16>, memref<?xf32>, memref<?xf64>
}

// -----

func.func @distinct_objects_noop(%arg0: memref<?xf16>) -> memref<?xf16> {
// 1-operand version is noop
  %1 = memref.distinct_objects %arg0 : memref<?xf16>
  return %1 : memref<?xf16>
}

// -----

func.func @assume_alignment_w_offset(%0 : memref<4x4xf16, strided<[?, ?], offset: ?>>) {
  %1 = memref.assume_alignment %0, 16 : memref<4x4xf16, strided<[?, ?], offset: ?>>
  return
}
// -----

func.func @dim_of_unranked(%unranked: memref<*xi32>) -> index {
  %c0 = arith.constant 0 : index
  %dim = memref.dim %unranked, %c0 : memref<*xi32>
  return %dim : index
}








// -----

func.func @address_space(%arg0 : memref<32xf32, affine_map<(d0) -> (d0)>, 7>) {
  %0 = memref.alloc() : memref<32xf32, affine_map<(d0) -> (d0)>, 5>
  %1 = arith.constant 7 : index
  %2 = memref.load %0[%1] : memref<32xf32, affine_map<(d0) -> (d0)>, 5>
  func.return
}

// -----

func.func @transpose(%arg0: memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>>) {
  %0 = memref.transpose %arg0 (i, j, k) -> (k, i, j) : memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>> to memref<?x?x?xf32, strided<[1, ?, ?], offset: ?>>
  return
}

// -----

memref.global @gv0 : memref<2xf32> = uninitialized

memref.global "private" @gv1 : memref<2xf32>

memref.global @gv2 : memref<2x3xf32> = dense<[[0.0, 1.0, 2.0], [3.0, 4.0, 5.0]]>

// Test 1D memref.
func.func @get_gv0_memref() {
  %0 = memref.get_global @gv0 : memref<2xf32>
  return
}

// Test 2D memref.
func.func @get_gv2_memref() {

  %0 = memref.get_global @gv2 : memref<2x3xf32>
  return
}

// Test scalar memref.
memref.global @gv3 : memref<f32> = dense<1.0>

func.func @get_gv3_memref() {
  %0 = memref.get_global @gv3 : memref<f32>
  return
}

// Test scalar memref with an alignment.
memref.global "private" @gv4 : memref<f32> = dense<1.0> {alignment = 64}

// -----

// Expand shapes need to be expanded outside of the memref-to-llvm pass.
func.func @expand_shape_static(%arg0: memref<3x4x5xf32>) -> memref<1x3x4x1x5xf32> {
  // Reshapes that expand a contiguous tensor with some 1's.
  %0 = memref.expand_shape %arg0 [[0, 1], [2], [3, 4]] output_shape [1, 3, 4, 1, 5]
      : memref<3x4x5xf32> into memref<1x3x4x1x5xf32>
  return %0 : memref<1x3x4x1x5xf32>
}

// -----

// Collapse shapes need to be expanded outside of the memref-to-llvm pass.
func.func @collapse_shape_static(%arg0: memref<1x3x4x1x5xf32>) -> memref<3x4x5xf32> {
  %0 = memref.collapse_shape %arg0 [[0, 1], [2], [3, 4]] :
    memref<1x3x4x1x5xf32> into memref<3x4x5xf32>
  return %0 : memref<3x4x5xf32>
}

// -----

func.func @rank_of_unranked(%unranked: memref<*xi32>) {
  %rank = memref.rank %unranked : memref<*xi32>
  return
}

// -----

func.func @rank_of_ranked(%ranked: memref<?xi32>) {
  %rank = memref.rank %ranked : memref<?xi32>
  return
}

// -----

func.func @atomic_rmw(%I : memref<10xi32>, %ival : i32, %F : memref<10xf32>, %fval : f32, %i : index) {
  memref.atomic_rmw assign %fval, %F[%i] : (f32, memref<10xf32>) -> f32
  memref.atomic_rmw addi %ival, %I[%i] : (i32, memref<10xi32>) -> i32
  memref.atomic_rmw maxs %ival, %I[%i] : (i32, memref<10xi32>) -> i32
  memref.atomic_rmw mins %ival, %I[%i] : (i32, memref<10xi32>) -> i32
  memref.atomic_rmw maxu %ival, %I[%i] : (i32, memref<10xi32>) -> i32
  memref.atomic_rmw minu %ival, %I[%i] : (i32, memref<10xi32>) -> i32
  memref.atomic_rmw addf %fval, %F[%i] : (f32, memref<10xf32>) -> f32
  memref.atomic_rmw maximumf %fval, %F[%i] : (f32, memref<10xf32>) -> f32
  memref.atomic_rmw maxnumf %fval, %F[%i] : (f32, memref<10xf32>) -> f32
  memref.atomic_rmw minimumf %fval, %F[%i] : (f32, memref<10xf32>) -> f32
  memref.atomic_rmw minnumf %fval, %F[%i] : (f32, memref<10xf32>) -> f32
  memref.atomic_rmw ori %ival, %I[%i] : (i32, memref<10xi32>) -> i32
  memref.atomic_rmw andi %ival, %I[%i] : (i32, memref<10xi32>) -> i32
  memref.atomic_rmw xori %ival, %I[%i] : (i32, memref<10xi32>) -> i32
  return
}

// -----

func.func @atomic_rmw_with_offset(%I : memref<10xi32, strided<[1], offset: 5>>, %ival : i32, %i : index) {
  memref.atomic_rmw andi %ival, %I[%i] : (i32, memref<10xi32, strided<[1], offset: 5>>) -> i32
  return
}


// -----

llvm.func @generic_atomic_rmw() {
  %I = "test.foo"() : () -> (memref<10xi32>)
  %i = "test.foo"() : () -> (index)
  %x = memref.generic_atomic_rmw %I[%i] : memref<10xi32> {
    ^bb0(%old_value : i32):
      memref.atomic_yield %old_value : i32
  }
  llvm.return
}


// -----

llvm.func @generic_atomic_rmw_f16() {
  %I = "test.foo"() : () -> (memref<10xf16>)
  %i = "test.foo"() : () -> (index)
  %x = memref.generic_atomic_rmw %I[%i] : memref<10xf16> {
    ^bb0(%old_value : f16):
      memref.atomic_yield %old_value : f16
  }
  llvm.return
}
// `llvm.cmpxchg` only accepts integer/pointer operands, so floating-point
// values are bitcast to a same-width integer for the CAS and bitcast back.


// -----

llvm.func @generic_atomic_rmw_in_alloca_scope() {
  %c1 = arith.constant 1 : index
  %alloc = memref.alloc() : memref<2x3xi32>
  memref.alloca_scope  {
    %0 = memref.generic_atomic_rmw %alloc[%c1, %c1] : memref<2x3xi32> {
    ^bb0(%arg0: i32):
      memref.atomic_yield %arg0 : i32
    }
  }
  llvm.return
}


// -----

func.func @memref_copy_ranked() {
  %0 = memref.alloc() : memref<2xf32>
  %1 = memref.cast %0 : memref<2xf32> to memref<?xf32>
  %2 = memref.alloc() : memref<2xf32>
  %3 = memref.cast %2 : memref<2xf32> to memref<?xf32>
  memref.copy %1, %3 : memref<?xf32> to memref<?xf32>
  return
}


// -----

func.func @memref_copy_contiguous(%in: memref<16x4xi32>, %offset: index) {
  %buf = memref.alloc() : memref<1x2xi32>
  %sub = memref.subview %in[%offset, 0] [1, 2] [1, 1] : memref<16x4xi32> to memref<1x2xi32, strided<[4, 1], offset: ?>>
  memref.copy %sub, %buf : memref<1x2xi32, strided<[4, 1], offset: ?>> to memref<1x2xi32>
  // Skip the memref descriptor of the alloc.
  // Get the memref for the subview.
  return
}

// -----

func.func @memref_copy_0d_offset(%in: memref<2xi32>) {
  %buf = memref.alloc() : memref<i32>
  %sub = memref.subview %in[1] [1] [1] : memref<2xi32> to memref<1xi32, strided<[1], offset: 1>>
  %scalar = memref.collapse_shape %sub [] : memref<1xi32, strided<[1], offset: 1>> into memref<i32, strided<[], offset: 1>>
  memref.copy %scalar, %buf : memref<i32, strided<[], offset: 1>> to memref<i32>
  return
}

// -----

func.func @memref_copy_noncontiguous(%in: memref<16x2xi32>, %offset: index) {
  %buf = memref.alloc() : memref<2x1xi32>
  %sub = memref.subview %in[%offset, 0] [2, 1] [1, 1] : memref<16x2xi32> to memref<2x1xi32, strided<[2, 1], offset: ?>>
  memref.copy %sub, %buf : memref<2x1xi32, strided<[2, 1], offset: ?>> to memref<2x1xi32>
  return
}

// -----

func.func @memref_copy_unranked() {
  %0 = memref.alloc() : memref<2xi1>
  %1 = memref.cast %0 : memref<2xi1> to memref<*xi1>
  %2 = memref.alloc() : memref<2xi1>
  %3 = memref.cast %2 : memref<2xi1> to memref<*xi1>
  memref.copy %1, %3 : memref<*xi1> to memref<*xi1>
  return
}

// -----

func.func @extract_aligned_pointer_as_index(%m: memref<?xf32>) -> index {
  %0 = memref.extract_aligned_pointer_as_index %m: memref<?xf32> -> index

  return %0: index
}

// -----

func.func @extract_aligned_pointer_as_index_unranked(%m: memref<*xf32>) -> index {
  %0 = memref.extract_aligned_pointer_as_index %m: memref<*xf32> -> index

  return %0: index
}

// -----



func.func @extract_strided_metadata(
    %ref: memref<?x?xf32, strided<[?,?], offset: ?>>) {

  %base, %offset, %sizes:2, %strides:2 =
    memref.extract_strided_metadata %ref : memref<?x?xf32, strided<[?,?], offset: ?>>
    -> memref<f32>, index,
       index, index,
       index, index

  return
}

// -----

func.func @load_non_temporal(%arg0 : memref<32xf32, affine_map<(d0) -> (d0)>>) {
  %1 = arith.constant 7 : index
  %2 = memref.load %arg0[%1] {nontemporal = true} : memref<32xf32, affine_map<(d0) -> (d0)>>
  func.return
}

// -----

func.func @load_with_alignment(%arg0 : memref<32xf32>, %arg1 : index) {
  %1 = memref.load %arg0[%arg1] {alignment = 32} : memref<32xf32>
  func.return
}

// -----

func.func @store_non_temporal(%input : memref<32xf32, affine_map<(d0) -> (d0)>>, %output : memref<32xf32, affine_map<(d0) -> (d0)>>) {
  %1 = arith.constant 7 : index
  %2 = memref.load %input[%1] {nontemporal = true} : memref<32xf32, affine_map<(d0) -> (d0)>>
  memref.store %2, %output[%1] {nontemporal = true} : memref<32xf32, affine_map<(d0) -> (d0)>>
  func.return
}

// -----

func.func @store_with_alignment(%arg0 : memref<32xf32>, %arg1 : f32, %arg2 : index) {
  memref.store %arg1, %arg0[%arg2] {alignment = 32} : memref<32xf32>
  func.return
}

// -----

// Ensure unconvertable memory space not cause a crash

func.func @alloca_unconvertable_memory_space() {
  %alloca = memref.alloca() : memref<1x32x33xi32, #spirv.storage_class<StorageBuffer>>
  func.return
}

// -----

func.func @alloca_huge(%arg0 : index) {
  %1 = memref.alloca() : memref<9223372036854775807x3xi32>

  func.return
}
