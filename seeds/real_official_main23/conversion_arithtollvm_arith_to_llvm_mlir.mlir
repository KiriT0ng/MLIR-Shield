// Same below, but using the `ConvertToLLVMPatternInterface` entry point
// and the generic `convert-to-llvm` pass.

func.func @vector_ops(%arg0: vector<4xf32>, %arg1: vector<4xi1>, %arg2: vector<4xi64>, %arg3: vector<4xi64>) -> vector<4xf32> {
  %0 = arith.constant dense<42.> : vector<4xf32>
  %1 = arith.addf %arg0, %0 : vector<4xf32>
  %3 = arith.divsi %arg2, %arg2 : vector<4xi64>
  %4 = arith.divui %arg2, %arg2 : vector<4xi64>
  %5 = arith.remsi %arg2, %arg2 : vector<4xi64>
  %6 = arith.remui %arg2, %arg2 : vector<4xi64>
  %7 = arith.divf %arg0, %0 : vector<4xf32>
  %8 = arith.remf %arg0, %0 : vector<4xf32>
  %9 = arith.andi %arg2, %arg3 : vector<4xi64>
  %10 = arith.ori %arg2, %arg3 : vector<4xi64>
  %11 = arith.xori %arg2, %arg3 : vector<4xi64>
  %12 = arith.shli %arg2, %arg2 : vector<4xi64>
  %13 = arith.shrsi %arg2, %arg2 : vector<4xi64>
  %14 = arith.shrui %arg2, %arg2 : vector<4xi64>
  return %1 : vector<4xf32>
}

// -----

func.func @ops(f32, f32, i32, i32, f64) -> (f32, i32) {
^bb0(%arg0: f32, %arg1: f32, %arg2: i32, %arg3: i32, %arg4: f64):
  %0 = arith.subf %arg0, %arg1: f32
  %1 = arith.subi %arg2, %arg3: i32
  %2 = arith.cmpi slt, %arg2, %1 : i32
  %3 = arith.cmpi sle, %arg2, %1 : i32
  %4 = arith.cmpi sgt, %arg2, %1 : i32
  %5 = arith.cmpi ult, %arg2, %1 : i32
  %6 = arith.cmpi ule, %arg2, %1 : i32
  %7 = arith.cmpi ugt, %arg2, %1 : i32
  %8 = arith.cmpi eq, %arg2, %1 : i32
  %9 = arith.divsi %arg2, %arg3 : i32
  %10 = arith.divui %arg2, %arg3 : i32
  %11 = arith.remsi %arg2, %arg3 : i32
  %12 = arith.remui %arg2, %arg3 : i32
  %13 = arith.divf %arg0, %arg1 : f32
  %14 = arith.remf %arg0, %arg1 : f32
  %15 = arith.andi %arg2, %arg3 : i32
  %16 = arith.ori %arg2, %arg3 : i32
  %17 = arith.xori %arg2, %arg3 : i32
  %18 = arith.constant 7.9e-01 : f64
  %19 = arith.shli %arg2, %arg3 : i32
  %20 = arith.shrsi %arg2, %arg3 : i32
  %21 = arith.shrui %arg2, %arg3 : i32
  // There is no type conversion rule for tf32.
  %22 = arith.constant 2.0 : tf32
  return %0, %10 : f32, i32
}

// -----

// Checking conversion of index types to integers using i1, assuming no target
// system would have a 1-bit address space.  Otherwise, we would have had to
// make this test dependent on the pointer size on the target system.
func.func @index_cast(%arg0: index, %arg1: i1) {
  %0 = arith.index_cast %arg0: index to i1
  %1 = arith.index_cast %arg1: i1 to index
  return
}

// -----

func.func @vector_index_cast(%arg0: vector<2xindex>, %arg1: vector<2xi1>) {
  %0 = arith.index_cast %arg0: vector<2xindex> to vector<2xi1>
  %1 = arith.index_cast %arg1: vector<2xi1> to vector<2xindex>
  return
}

// -----

func.func @index_castui(%arg0: index, %arg1: i1) {
  %0 = arith.index_castui %arg0: index to i1
  %1 = arith.index_castui %arg1: i1 to index
  return
}

// -----

func.func @vector_index_castui(%arg0: vector<2xindex>, %arg1: vector<2xi1>) {
  %0 = arith.index_castui %arg0: vector<2xindex> to vector<2xi1>
  %1 = arith.index_castui %arg1: vector<2xi1> to vector<2xindex>
  return
}

// -----

func.func @index_castui_nneg(%arg0: i1) {
  %0 = arith.index_castui %arg0 nneg : i1 to index
  return
}

// -----

func.func @index_castui_nneg_not_set(%arg0: i1) {
  %0 = arith.index_castui %arg0 : i1 to index
  return
}

// -----

// Memref index_cast is a no-op at the LLVM level since LLVM uses opaque
// pointers and all memrefs with integer or index element types convert to the
// same struct type. Verify that no sext/zext/trunc is generated.

func.func @memref_index_cast(%arg0: memref<3xi32>) -> memref<3xindex> {
  %0 = arith.index_cast %arg0 : memref<3xi32> to memref<3xindex>
  return %0 : memref<3xindex>
}

// -----

func.func @memref_index_castui(%arg0: memref<3xi32>) -> memref<3xindex> {
  %0 = arith.index_castui %arg0 : memref<3xi32> to memref<3xindex>
  return %0 : memref<3xindex>
}

// -----

// Checking conversion of signed integer types to floating point.
func.func @sitofp(%arg0 : i32, %arg1 : i64) {
  %0 = arith.sitofp %arg0: i32 to f32
  %1 = arith.sitofp %arg0: i32 to f64
  %2 = arith.sitofp %arg1: i64 to f32
  %3 = arith.sitofp %arg1: i64 to f64
  return
}

// -----

// Checking conversion of integer vectors to floating point vector types.
func.func @sitofp_vector(%arg0 : vector<2xi16>, %arg1 : vector<2xi32>, %arg2 : vector<2xi64>) {
  %0 = arith.sitofp %arg0: vector<2xi16> to vector<2xf32>
  %1 = arith.sitofp %arg0: vector<2xi16> to vector<2xf64>
  %2 = arith.sitofp %arg1: vector<2xi32> to vector<2xf32>
  %3 = arith.sitofp %arg1: vector<2xi32> to vector<2xf64>
  %4 = arith.sitofp %arg2: vector<2xi64> to vector<2xf32>
  %5 = arith.sitofp %arg2: vector<2xi64> to vector<2xf64>
  return
}

// -----

// Checking conversion of unsigned integer types to floating point.
func.func @uitofp(%arg0 : i32, %arg1 : i64) {
  %0 = arith.uitofp %arg0: i32 to f32
  %1 = arith.uitofp %arg0: i32 to f64
  %2 = arith.uitofp %arg1: i64 to f32
  %3 = arith.uitofp %arg1: i64 to f64
  return
}

// -----

// Checking conversion of integer types to floating point.
func.func @fpext(%arg0 : f16, %arg1 : f32) {
  %0 = arith.extf %arg0: f16 to f32
  %1 = arith.extf %arg0: f16 to f64
  %2 = arith.extf %arg1: f32 to f64
  return
}

// -----

// Checking conversion of integer types to floating point.
func.func @fpext_vector(%arg0 : vector<2xf16>, %arg1 : vector<2xf32>) {
  %0 = arith.extf %arg0: vector<2xf16> to vector<2xf32>
  %1 = arith.extf %arg0: vector<2xf16> to vector<2xf64>
  %2 = arith.extf %arg1: vector<2xf32> to vector<2xf64>
  return
}

// -----

// Checking conversion of floating point to integer types.
func.func @fptosi(%arg0 : f32, %arg1 : f64) {
  %0 = arith.fptosi %arg0: f32 to i32
  %1 = arith.fptosi %arg0: f32 to i64
  %2 = arith.fptosi %arg1: f64 to i32
  %3 = arith.fptosi %arg1: f64 to i64
  return
}

// -----

// Checking conversion of floating point vectors to integer vector types.
func.func @fptosi_vector(%arg0 : vector<2xf16>, %arg1 : vector<2xf32>, %arg2 : vector<2xf64>) {
  %0 = arith.fptosi %arg0: vector<2xf16> to vector<2xi32>
  %1 = arith.fptosi %arg0: vector<2xf16> to vector<2xi64>
  %2 = arith.fptosi %arg1: vector<2xf32> to vector<2xi32>
  %3 = arith.fptosi %arg1: vector<2xf32> to vector<2xi64>
  %4 = arith.fptosi %arg2: vector<2xf64> to vector<2xi32>
  %5 = arith.fptosi %arg2: vector<2xf64> to vector<2xi64>
  return
}

// -----

// Checking conversion of floating point to integer types.
func.func @fptoui(%arg0 : f32, %arg1 : f64) {
  %0 = arith.fptoui %arg0: f32 to i32
  %1 = arith.fptoui %arg0: f32 to i64
  %2 = arith.fptoui %arg1: f64 to i32
  %3 = arith.fptoui %arg1: f64 to i64
  return
}

// -----

// Checking conversion of floating point vectors to integer vector types.
func.func @fptoui_vector(%arg0 : vector<2xf16>, %arg1 : vector<2xf32>, %arg2 : vector<2xf64>) {
  %0 = arith.fptoui %arg0: vector<2xf16> to vector<2xi32>
  %1 = arith.fptoui %arg0: vector<2xf16> to vector<2xi64>
  %2 = arith.fptoui %arg1: vector<2xf32> to vector<2xi32>
  %3 = arith.fptoui %arg1: vector<2xf32> to vector<2xi64>
  %4 = arith.fptoui %arg2: vector<2xf64> to vector<2xi32>
  %5 = arith.fptoui %arg2: vector<2xf64> to vector<2xi64>
  return
}

// -----

// Checking conversion of integer vectors to floating point vector types.
func.func @uitofp_vector(%arg0 : vector<2xi16>, %arg1 : vector<2xi32>, %arg2 : vector<2xi64>) {
  %0 = arith.uitofp %arg0: vector<2xi16> to vector<2xf32>
  %1 = arith.uitofp %arg0: vector<2xi16> to vector<2xf64>
  %2 = arith.uitofp %arg1: vector<2xi32> to vector<2xf32>
  %3 = arith.uitofp %arg1: vector<2xi32> to vector<2xf64>
  %4 = arith.uitofp %arg2: vector<2xi64> to vector<2xf32>
  %5 = arith.uitofp %arg2: vector<2xi64> to vector<2xf64>
  return
}

// -----

// Checking conversion of integer types to floating point.
func.func @fptrunc(%arg0 : f32, %arg1 : f64) {
  %0 = arith.truncf %arg0: f32 to f16
  %1 = arith.truncf %arg1: f64 to f16
  %2 = arith.truncf %arg1: f64 to f32
  return
}

// -----

// Checking conversion of integer types to floating point.
func.func @fptrunc_vector(%arg0 : vector<2xf32>, %arg1 : vector<2xf64>) {
  %0 = arith.truncf %arg0: vector<2xf32> to vector<2xf16>
  %1 = arith.truncf %arg1: vector<2xf64> to vector<2xf16>
  %2 = arith.truncf %arg1: vector<2xf64> to vector<2xf32>
  return
}

// -----

func.func @experimental_constrained_fptrunc(%arg0 : f64) {
  %0 = arith.truncf %arg0 to_nearest_even : f64 to f32
  %1 = arith.truncf %arg0 downward : f64 to f32
  %2 = arith.truncf %arg0 upward : f64 to f32
  %3 = arith.truncf %arg0 toward_zero : f64 to f32
  %4 = arith.truncf %arg0 to_nearest_away : f64 to f32
  return
}

// -----

func.func @experimental_constrained_addf(%arg0 : f64, %arg1 : f64) {
  %0 = arith.addf %arg0, %arg1 to_nearest_even : f64
  %1 = arith.addf %arg0, %arg1 downward : f64
  %2 = arith.addf %arg0, %arg1 upward : f64
  %3 = arith.addf %arg0, %arg1 toward_zero : f64
  %4 = arith.addf %arg0, %arg1 to_nearest_away : f64
  return
}

// -----

func.func @experimental_constrained_subf(%arg0 : f64, %arg1 : f64) {
  %0 = arith.subf %arg0, %arg1 to_nearest_even : f64
  %1 = arith.subf %arg0, %arg1 downward : f64
  return
}

// -----

func.func @experimental_constrained_mulf(%arg0 : f64, %arg1 : f64) {
  %0 = arith.mulf %arg0, %arg1 upward : f64
  %1 = arith.mulf %arg0, %arg1 toward_zero : f64
  return
}

// -----

func.func @experimental_constrained_divf(%arg0 : f64, %arg1 : f64) {
  %0 = arith.divf %arg0, %arg1 to_nearest_even : f64
  %1 = arith.divf %arg0, %arg1 to_nearest_away : f64
  return
}

// -----

// Verify that fastmath flags are stripped when lowering to constrained
// intrinsics (constrained FP and fastmath are contradictory).
func.func @constrained_addf_with_fastmath(%arg0 : f64, %arg1 : f64) {
  %0 = arith.addf %arg0, %arg1 to_nearest_even fastmath<fast> : f64
  return
}

// -----

func.func @convertf_f16_to_bf16(%arg0 : f16) -> bf16 {
  %0 = arith.convertf %arg0 : f16 to bf16
  return %0 : bf16
}

// -----

func.func @convertf_bf16_to_f16(%arg0 : bf16) -> f16 {
  %0 = arith.convertf %arg0 : bf16 to f16
  return %0 : f16
}

// -----

func.func @convertf_vector(%arg0 : vector<2xf16>) -> vector<2xbf16> {
  %0 = arith.convertf %arg0 : vector<2xf16> to vector<2xbf16>
  return %0 : vector<2xbf16>
}

// -----

// Check sign and zero extension and truncation of integers.
func.func @integer_extension_and_truncation(%arg0 : i3) {
  %0 = arith.extsi %arg0 : i3 to i6
  %1 = arith.extui %arg0 : i3 to i6
   %2 = arith.trunci %arg0 : i3 to i2
  return
}

// -----

func.func @integer_cast_0d_vector(%arg0 : vector<i3>) {
  %0 = arith.extsi %arg0 : vector<i3> to vector<i6>
  %1 = arith.extui %arg0 : vector<i3> to vector<i6>
  %2 = arith.trunci %arg0 : vector<i3> to vector<i2>
  return
}

// -----

func.func @fcmp(f32, f32) -> () {
^bb0(%arg0: f32, %arg1: f32):
  %1 = arith.cmpf oeq, %arg0, %arg1 : f32
  %2 = arith.cmpf ogt, %arg0, %arg1 : f32
  %3 = arith.cmpf oge, %arg0, %arg1 : f32
  %4 = arith.cmpf olt, %arg0, %arg1 : f32
  %5 = arith.cmpf ole, %arg0, %arg1 : f32
  %6 = arith.cmpf one, %arg0, %arg1 : f32
  %7 = arith.cmpf ord, %arg0, %arg1 : f32
  %8 = arith.cmpf ueq, %arg0, %arg1 : f32
  %9 = arith.cmpf ugt, %arg0, %arg1 : f32
  %10 = arith.cmpf uge, %arg0, %arg1 : f32
  %11 = arith.cmpf ult, %arg0, %arg1 : f32
  %12 = arith.cmpf ule, %arg0, %arg1 : f32
  %13 = arith.cmpf une, %arg0, %arg1 : f32
  %14 = arith.cmpf uno, %arg0, %arg1 : f32

  %15 = arith.cmpf oeq, %arg0, %arg1 {fastmath = #arith.fastmath<fast>} : f32

  return
}

// -----

func.func @index_vector(%arg0: vector<4xindex>) {
  %0 = arith.constant dense<[0, 1, 2, 3]> : vector<4xindex>
  %1 = arith.addi %arg0, %0 : vector<4xindex>
  func.return
}

// -----

func.func @bitcast_1d(%arg0: vector<2xf32>) {
  arith.bitcast %arg0 : vector<2xf32> to vector<2xi32>
  return
}

// -----

func.func @addui_extended_scalar(%arg0: i32, %arg1: i32) -> (i32, i1) {
  %sum, %carry = arith.addui_extended %arg0, %arg1 : i32, i1
  return %sum, %carry : i32, i1
}

func.func @addui_extended_vector1d(%arg0: vector<3xi16>, %arg1: vector<3xi16>) -> (vector<3xi16>, vector<3xi1>) {
  %sum, %carry = arith.addui_extended %arg0, %arg1 : vector<3xi16>, vector<3xi1>
  return %sum, %carry : vector<3xi16>, vector<3xi1>
}

// -----

func.func @mulsi_extended_scalar(%arg0: i32, %arg1: i32) -> (i32, i32) {
  %low, %high = arith.mulsi_extended %arg0, %arg1 : i32
  return %low, %high : i32, i32
}

func.func @mulsi_extended_vector1d(%arg0: vector<3xi64>, %arg1: vector<3xi64>) -> (vector<3xi64>, vector<3xi64>) {
  %low, %high = arith.mulsi_extended %arg0, %arg1 : vector<3xi64>
  return %low, %high : vector<3xi64>, vector<3xi64>
}

// -----

func.func @mului_extended_scalar(%arg0: i32, %arg1: i32) -> (i32, i32) {
  %low, %high = arith.mului_extended %arg0, %arg1 : i32
  return %low, %high : i32, i32
}

func.func @mului_extended_vector1d(%arg0: vector<3xi64>, %arg1: vector<3xi64>) -> (vector<3xi64>, vector<3xi64>) {
  %low, %high = arith.mului_extended %arg0, %arg1 : vector<3xi64>
  return %low, %high : vector<3xi64>, vector<3xi64>
}

// -----

func.func @cmpf_2dvector(%arg0 : vector<4x3xf32>, %arg1 : vector<4x3xf32>) {
  %0 = arith.cmpf olt, %arg0, %arg1 : vector<4x3xf32>
  func.return
}

// -----

func.func @cmpi_0dvector(%arg0 : vector<i32>, %arg1 : vector<i32>) {
  %0 = arith.cmpi ult, %arg0, %arg1 : vector<i32>
  func.return
}

// -----

func.func @cmpi_2dvector(%arg0 : vector<4x3xi32>, %arg1 : vector<4x3xi32>) {
  %0 = arith.cmpi ult, %arg0, %arg1 : vector<4x3xi32>
  func.return
}

// -----

func.func @select(%arg0 : i1, %arg1 : i32, %arg2 : i32) -> i32 {
  %0 = arith.select %arg0, %arg1, %arg2 : i32
  return %0 : i32
}

func.func @select_complex(%arg0 : i1, %arg1 : complex<f32>, %arg2 : complex<f32>) -> complex<f32> {
  %0 = arith.select %arg0, %arg1, %arg2 : complex<f32>
  return %0 : complex<f32>
}

// -----

func.func @ceildivsi(%arg0 : i64, %arg1 : i64) -> i64 {
  %0 = arith.ceildivsi %arg0, %arg1 : i64
  return %0: i64
}

func.func @ceildivui(%arg0 : i32) -> i32 {
  %0 = arith.ceildivui %arg0, %arg0 : i32
  return %0: i32
}

// -----

func.func @floordivsi(%arg0 : i32, %arg1 : i32) -> i32 {
  %0 = arith.floordivsi %arg0, %arg1 : i32
  return %0 : i32
}

// -----

func.func @minmaxi(%arg0 : i32, %arg1 : i32) -> i32 {
  %0 = arith.minsi %arg0, %arg1 : i32
  %1 = arith.maxsi %arg0, %arg1 : i32
  %2 = arith.minui %arg0, %arg1 : i32
  %3 = arith.maxui %arg0, %arg1 : i32
  return %0 : i32
}

func.func @minmaxf(%arg0 : f32, %arg1 : f32) -> f32 {
  %0 = arith.minimumf %arg0, %arg1 : f32
  %1 = arith.maximumf %arg0, %arg1 : f32
  %2 = arith.minnumf %arg0, %arg1 : f32
  %3 = arith.maxnumf %arg0, %arg1 : f32
  return %0 : f32
}

// -----

func.func @fastmath(%arg0: f32, %arg1: f32, %arg2: i32) {
  %0 = arith.addf %arg0, %arg1 fastmath<fast> : f32
  %1 = arith.mulf %arg0, %arg1 fastmath<fast> : f32
  %2 = arith.negf %arg0 fastmath<fast> : f32
  %3 = arith.addf %arg0, %arg1 fastmath<none> : f32
  %4 = arith.addf %arg0, %arg1 fastmath<nnan,ninf> : f32
  return
}

// -----

func.func @ops_supporting_fastmath(%arg0: f32, %arg1: f32, %arg2: i32) {
  %0 = arith.addf %arg0, %arg1 fastmath<fast> : f32
  %1 = arith.divf %arg0, %arg1 fastmath<fast> : f32
  %2 = arith.maximumf %arg0, %arg1 fastmath<fast> : f32
  %3 = arith.minimumf %arg0, %arg1 fastmath<fast> : f32
  %4 = arith.mulf %arg0, %arg1 fastmath<fast> : f32
  %5 = arith.negf %arg0 fastmath<fast> : f32
  %6 = arith.remf %arg0, %arg1 fastmath<fast> : f32
  %7 = arith.subf %arg0, %arg1 fastmath<fast> : f32
  return
}

// -----

func.func @ops_supporting_overflow(%arg0: i64, %arg1: i64) {
  %0 = arith.addi %arg0, %arg1 overflow<nsw> : i64
  %1 = arith.subi %arg0, %arg1 overflow<nuw> : i64
  %2 = arith.muli %arg0, %arg1 overflow<nsw, nuw> : i64
  %3 = arith.shli %arg0, %arg1 overflow<nsw, nuw> : i64
  %4 = arith.trunci %arg0 overflow<nsw, nuw> : i64 to i32
  return
}

// -----

func.func @ops_supporting_exact(i32, i32) {
^bb0(%arg0: i32, %arg1: i32):
  %0 = arith.shrsi %arg0, %arg1 exact : i32
  %1 = arith.shrui %arg0, %arg1 exact : i32
  %2 = arith.divsi %arg0, %arg1 exact : i32
  %3 = arith.divui %arg0, %arg1 exact : i32
  return
}

// -----

func.func @ops_supporting_nneg(%arg0: i32) {
  %0 = arith.extui %arg0 nneg : i32 to i64
  %1 = arith.uitofp %arg0 nneg : i32 to f32
  return
}

// -----

func.func @ops_nneg_not_set(%arg0: i32) {
  %0 = arith.extui %arg0 : i32 to i64
  %1 = arith.uitofp %arg0 : i32 to f32
  return
}

// -----

func.func @memref_bitcast(%1: memref<?xi16>) -> memref<?xbf16> {
  %2 = arith.bitcast %1 : memref<?xi16> to memref<?xbf16>
  func.return %2 : memref<?xbf16>
}

// -----

func.func @unsupported_fp_type(%arg0: f4E2M1FN, %arg1: vector<4xf4E2M1FN>, %arg2: vector<8x4xf4E2M1FN>, %arg3: f4E2M1FN, %arg4: i1) {
  %0 = arith.addf %arg0, %arg0 : f4E2M1FN
  %1 = arith.addf %arg1, %arg1 : vector<4xf4E2M1FN>
  %2 = arith.addf %arg2, %arg2 : vector<8x4xf4E2M1FN>
  %3 = arith.cmpf oeq, %arg0, %arg3 : f4E2M1FN
  %4 = arith.select %arg4, %arg0, %arg3 : f4E2M1FN
  return
}

// -----

func.func @supported_fp_type(%arg0: f32, %arg1: vector<4xf32>, %arg2: vector<4x8xf32>, %arg3: f32) {
  %0 = arith.addf %arg0, %arg0 : f32
  %1 = arith.addf %arg1, %arg1 : vector<4xf32>
  %2 = arith.addf %arg2, %arg2 : vector<4x8xf32>
  %3 = arith.cmpf oeq, %arg0, %arg3 : f32
  return
}
