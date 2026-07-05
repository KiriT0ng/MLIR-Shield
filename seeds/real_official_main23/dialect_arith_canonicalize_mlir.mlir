func.func @select_same_val(%arg0: i1, %arg1: i64) -> i64 {
  %0 = arith.select %arg0, %arg1, %arg1 : i64
  return %0 : i64
}

func.func @select_cmp_eq_select(%arg0: i64, %arg1: i64) -> i64 {
  %0 = arith.cmpi eq, %arg0, %arg1 : i64
  %1 = arith.select %0, %arg0, %arg1 : i64
  return %1 : i64
}

func.func @select_cmp_ne_select(%arg0: i64, %arg1: i64) -> i64 {
  %0 = arith.cmpi ne, %arg0, %arg1 : i64
  %1 = arith.select %0, %arg0, %arg1 : i64
  return %1 : i64
}

func.func @select_extui(%arg0: i1) -> i64 {
  %c0_i64 = arith.constant 0 : i64
  %c1_i64 = arith.constant 1 : i64
  %res = arith.select %arg0, %c1_i64, %c0_i64 : i64
  return %res : i64
}

func.func @select_extui2(%arg0: i1) -> i64 {
  %c0_i64 = arith.constant 0 : i64
  %c1_i64 = arith.constant 1 : i64
  %res = arith.select %arg0, %c0_i64, %c1_i64 : i64
  return %res : i64
}

func.func @select_extui_i1(%arg0: i1) -> i1 {
  %c0_i1 = arith.constant false
  %c1_i1 = arith.constant true
  %res = arith.select %arg0, %c1_i1, %c0_i1 : i1
  return %res : i1
}

func.func @select_no_fold_ui1(%arg0: i1) -> ui1 {
  %c0_i1 = "test.constant"() {value = 0 : i32} : () -> ui1
  %c1_i1 = "test.constant"() {value = 1 : i32} : () -> ui1
  %res = arith.select %arg0, %c1_i1, %c0_i1 : ui1
  return %res : ui1
}

func.func @select_cst_false_scalar(%arg0: i32, %arg1: i32) -> i32 {
  %false = arith.constant false
  %res = arith.select %false, %arg0, %arg1 : i32
  return %res : i32
}

func.func @select_cst_true_scalar(%arg0: i32, %arg1: i32) -> i32 {
  %true = arith.constant true
  %res = arith.select %true, %arg0, %arg1 : i32
  return %res : i32
}

func.func @select_cst_true_splat() -> vector<3xi32> {
  %cond = arith.constant dense<true> : vector<3xi1>
  %a = arith.constant dense<[1, 2, 3]> : vector<3xi32>
  %b = arith.constant dense<[4, 5, 6]> : vector<3xi32>
  %res = arith.select %cond, %a, %b : vector<3xi1>, vector<3xi32>
  return %res : vector<3xi32>
}

func.func @select_cst_vector_i32() -> vector<3xi32> {
  %cond = arith.constant dense<[true, false, true]> : vector<3xi1>
  %a = arith.constant dense<[1, 2, 3]> : vector<3xi32>
  %b = arith.constant dense<[4, 5, 6]> : vector<3xi32>
  %res = arith.select %cond, %a, %b : vector<3xi1>, vector<3xi32>
  return %res : vector<3xi32>
}

func.func @select_cst_vector_f32() -> vector<3xf32> {
  %cond = arith.constant dense<[false, true, false]> : vector<3xi1>
  %a = arith.constant dense<[1.0, 2.0, 3.0]> : vector<3xf32>
  %b = arith.constant dense<[4.0, 5.0, 6.0]> : vector<3xf32>
  %res = arith.select %cond, %a, %b : vector<3xi1>, vector<3xf32>
  return %res : vector<3xf32>
}

func.func @selToNot(%arg0: i1) -> i1 {
  %true = arith.constant true
  %false = arith.constant false
  %res = arith.select %arg0, %false, %true : i1
  return %res : i1
}

func.func @redundantSelectTrue(%arg0: i1, %arg1 : i32, %arg2 : i32, %arg3 : i32) -> i32 {
  %0 = arith.select %arg0, %arg1, %arg2 : i32
  %res = arith.select %arg0, %0, %arg3 : i32
  return %res : i32
}

func.func @redundantSelectFalse(%arg0: i1, %arg1 : i32, %arg2 : i32, %arg3 : i32) -> i32 {
  %0 = arith.select %arg0, %arg1, %arg2 : i32
  %res = arith.select %arg0, %arg3, %0 : i32
  return %res : i32
}

func.func @selNotCond(%arg0: i1, %arg1 : i32, %arg2 : i32, %arg3 : i32, %arg4 : i32) -> (i32, i32) {
  %one = arith.constant 1 : i1
  %cond1 = arith.xori %arg0, %one : i1
  %cond2 = arith.xori %one, %arg0 : i1

  %res1 = arith.select %cond1, %arg1, %arg2 : i32
  %res2 = arith.select %cond2, %arg3, %arg4 : i32
  return %res1, %res2 : i32, i32
}

func.func @cmpiI1eq(%arg0: i1) -> i1 {
  %one = arith.constant 1 : i1
  %res = arith.cmpi eq, %arg0, %one : i1
  return %res : i1
}

func.func @cmpiI1eqVec(%arg0: vector<4xi1>) -> vector<4xi1> {
  %one = arith.constant dense<1> : vector<4xi1>
  %res = arith.cmpi eq, %arg0, %one : vector<4xi1>
  return %res : vector<4xi1>
}

func.func @cmpiI1ne(%arg0: i1) -> i1 {
  %zero = arith.constant 0 : i1
  %res = arith.cmpi ne, %arg0, %zero : i1
  return %res : i1
}

func.func @cmpiI1neVec(%arg0: vector<4xi1>) -> vector<4xi1> {
  %zero = arith.constant dense<0> : vector<4xi1>
  %res = arith.cmpi ne, %arg0, %zero : vector<4xi1>
  return %res : vector<4xi1>
}

func.func @cmpiI1eqLhs(%arg0: i1) -> i1 {
  %one = arith.constant 1 : i1
  %res = arith.cmpi eq, %one, %arg0  : i1
  return %res : i1
}

func.func @cmpiI1eqVecLhs(%arg0: vector<4xi1>) -> vector<4xi1> {
  %one = arith.constant dense<1> : vector<4xi1>
  %res = arith.cmpi eq, %one, %arg0 : vector<4xi1>
  return %res : vector<4xi1>
}

func.func @cmpiI1neLhs(%arg0: i1) -> i1 {
  %zero = arith.constant 0 : i1
  %res = arith.cmpi ne, %zero, %arg0 : i1
  return %res : i1
}

func.func @cmpiI1neVecLhs(%arg0: vector<4xi1>) -> vector<4xi1> {
  %zero = arith.constant dense<0> : vector<4xi1>
  %res = arith.cmpi ne, %zero, %arg0 : vector<4xi1>
  return %res : vector<4xi1>
}

// Test case: Folding of comparisons with equal operands.
func.func @cmpi_equal_operands(%arg0: i64)
    -> (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) {
  %0 = arith.cmpi eq, %arg0, %arg0 : i64
  %1 = arith.cmpi sle, %arg0, %arg0 : i64
  %2 = arith.cmpi sge, %arg0, %arg0 : i64
  %3 = arith.cmpi ule, %arg0, %arg0 : i64
  %4 = arith.cmpi uge, %arg0, %arg0 : i64
  %5 = arith.cmpi ne, %arg0, %arg0 : i64
  %6 = arith.cmpi slt, %arg0, %arg0 : i64
  %7 = arith.cmpi sgt, %arg0, %arg0 : i64
  %8 = arith.cmpi ult, %arg0, %arg0 : i64
  %9 = arith.cmpi ugt, %arg0, %arg0 : i64
  return %0, %1, %2, %3, %4, %5, %6, %7, %8, %9
      : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
}

// Test case: Folding of comparisons with equal vector operands.
func.func @cmpi_equal_vector_operands(%arg0: vector<1x8xi64>)
    -> (vector<1x8xi1>, vector<1x8xi1>, vector<1x8xi1>, vector<1x8xi1>,
        vector<1x8xi1>, vector<1x8xi1>, vector<1x8xi1>, vector<1x8xi1>,
	vector<1x8xi1>, vector<1x8xi1>) {
  %0 = arith.cmpi eq, %arg0, %arg0 : vector<1x8xi64>
  %1 = arith.cmpi sle, %arg0, %arg0 : vector<1x8xi64>
  %2 = arith.cmpi sge, %arg0, %arg0 : vector<1x8xi64>
  %3 = arith.cmpi ule, %arg0, %arg0 : vector<1x8xi64>
  %4 = arith.cmpi uge, %arg0, %arg0 : vector<1x8xi64>
  %5 = arith.cmpi ne, %arg0, %arg0 : vector<1x8xi64>
  %6 = arith.cmpi slt, %arg0, %arg0 : vector<1x8xi64>
  %7 = arith.cmpi sgt, %arg0, %arg0 : vector<1x8xi64>
  %8 = arith.cmpi ult, %arg0, %arg0 : vector<1x8xi64>
  %9 = arith.cmpi ugt, %arg0, %arg0 : vector<1x8xi64>
  return %0, %1, %2, %3, %4, %5, %6, %7, %8, %9
      : vector<1x8xi1>, vector<1x8xi1>, vector<1x8xi1>, vector<1x8xi1>,
        vector<1x8xi1>, vector<1x8xi1>, vector<1x8xi1>, vector<1x8xi1>,
	vector<1x8xi1>, vector<1x8xi1>
}

// -----

// Test case: Move constant to the right side.
func.func @cmpi_const_right(%arg0: i64)
    -> (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) {
  %c1 = arith.constant 1 : i64
  %0 = arith.cmpi eq, %c1, %arg0 : i64
  %1 = arith.cmpi sle, %c1, %arg0 : i64
  %2 = arith.cmpi sge, %c1, %arg0 : i64
  %3 = arith.cmpi ule, %c1, %arg0 : i64
  %4 = arith.cmpi uge, %c1, %arg0 : i64
  %5 = arith.cmpi ne, %c1, %arg0 : i64
  %6 = arith.cmpi slt, %c1, %arg0 : i64
  %7 = arith.cmpi sgt, %c1, %arg0 : i64
  %8 = arith.cmpi ult, %c1, %arg0 : i64
  %9 = arith.cmpi ugt, %c1, %arg0 : i64
  return %0, %1, %2, %3, %4, %5, %6, %7, %8, %9
      : i1, i1, i1, i1, i1, i1, i1, i1, i1, i1
}

// -----

func.func @cmpOfExtSI(%arg0: i1) -> i1 {
  %ext = arith.extsi %arg0 : i1 to i64
  %c0 = arith.constant 0 : i64
  %res = arith.cmpi ne, %ext, %c0 : i64
  return %res : i1
}

func.func @cmpOfExtUI(%arg0: i1) -> i1 {
  %ext = arith.extui %arg0 : i1 to i64
  %c0 = arith.constant 0 : i64
  %res = arith.cmpi ne, %ext, %c0 : i64
  return %res : i1
}

// -----

func.func @cmpOfExtSIVector(%arg0: vector<4xi1>) -> vector<4xi1> {
  %ext = arith.extsi %arg0 : vector<4xi1> to vector<4xi64>
  %c0 = arith.constant dense<0> : vector<4xi64>
  %res = arith.cmpi ne, %ext, %c0 : vector<4xi64>
  return %res : vector<4xi1>
}

func.func @cmpOfExtUIVector(%arg0: vector<4xi1>) -> vector<4xi1> {
  %ext = arith.extui %arg0 : vector<4xi1> to vector<4xi64>
  %c0 = arith.constant dense<0> : vector<4xi64>
  %res = arith.cmpi ne, %ext, %c0 : vector<4xi64>
  return %res : vector<4xi1>
}

// -----

func.func @extSIOfExtUI(%arg0: i1) -> i64 {
  %ext1 = arith.extui %arg0 : i1 to i8
  %ext2 = arith.extsi %ext1 : i8 to i64
  return %ext2 : i64
}

func.func @extSIOfExtUI_nneg(%arg0: i1) -> i64 {
  %ext1 = arith.extui %arg0 nneg : i1 to i8
  %ext2 = arith.extsi %ext1 : i8 to i64
  return %ext2 : i64
}

func.func @extUIOfExtUI(%arg0: i1) -> i64 {
  %ext1 = arith.extui %arg0 : i1 to i8
  %ext2 = arith.extui %ext1 : i8 to i64
  return %ext2 : i64
}

func.func @extSIOfExtSI(%arg0: i1) -> i64 {
  %ext1 = arith.extsi %arg0 : i1 to i8
  %ext2 = arith.extsi %ext1 : i8 to i64
  return %ext2 : i64
}

// -----

func.func @cmpIExtSINE(%arg0: i8, %arg1: i8) -> i1 {
  %ext0 = arith.extsi %arg0 : i8 to i64
  %ext1 = arith.extsi %arg1 : i8 to i64
  %res = arith.cmpi ne, %ext0, %ext1 : i64
  return %res : i1
}

func.func @cmpIExtSIEQ(%arg0: i8, %arg1: i8) -> i1 {
  %ext0 = arith.extsi %arg0 : i8 to i64
  %ext1 = arith.extsi %arg1 : i8 to i64
  %res = arith.cmpi eq, %ext0, %ext1 : i64
  return %res : i1
}

func.func @cmpIExtUINE(%arg0: i8, %arg1: i8) -> i1 {
  %ext0 = arith.extui %arg0 : i8 to i64
  %ext1 = arith.extui %arg1 : i8 to i64
  %res = arith.cmpi ne, %ext0, %ext1 : i64
  return %res : i1
}

func.func @cmpIExtUIEQ(%arg0: i8, %arg1: i8) -> i1 {
  %ext0 = arith.extui %arg0 : i8 to i64
  %ext1 = arith.extui %arg1 : i8 to i64
  %res = arith.cmpi eq, %ext0, %ext1 : i64
  return %res : i1
}

func.func @cmpIFoldEQ() -> vector<3xi1> {
  %lhs = arith.constant dense<[1, 2, 3]> : vector<3xi32>
  %rhs = arith.constant dense<[1, 2, 4]> : vector<3xi32>
  %res = arith.cmpi eq, %lhs, %rhs : vector<3xi32>
  return %res : vector<3xi1>
}

func.func @cmpIFoldNE() -> vector<3xi1> {
  %lhs = arith.constant dense<[1, 2, 3]> : vector<3xi32>
  %rhs = arith.constant dense<[1, 2, 4]> : vector<3xi32>
  %res = arith.cmpi ne, %lhs, %rhs : vector<3xi32>
  return %res : vector<3xi1>
}

func.func @cmpIFoldSGE() -> vector<3xi1> {
  %lhs = arith.constant dense<2> : vector<3xi32>
  %rhs = arith.constant dense<[1, 2, 4]> : vector<3xi32>
  %res = arith.cmpi sge, %lhs, %rhs : vector<3xi32>
  return %res : vector<3xi1>
}

func.func @cmpIFoldULT() -> vector<3xi1> {
  %lhs = arith.constant dense<2> : vector<3xi32>
  %rhs = arith.constant dense<1> : vector<3xi32>
  %res = arith.cmpi ult, %lhs, %rhs : vector<3xi32>
  return %res : vector<3xi1>
}

// -----

func.func @andOfExtSI(%arg0: i8, %arg1: i8) -> i64 {
  %ext0 = arith.extsi %arg0 : i8 to i64
  %ext1 = arith.extsi %arg1 : i8 to i64
  %res = arith.andi %ext0, %ext1 : i64
  return %res : i64
}

func.func @andOfExtUI(%arg0: i8, %arg1: i8) -> i64 {
  %ext0 = arith.extui %arg0 : i8 to i64
  %ext1 = arith.extui %arg1 : i8 to i64
  %res = arith.andi %ext0, %ext1 : i64
  return %res : i64
}

func.func @andOfExtUI_nneg_lhs(%arg0: i8, %arg1: i8) -> i64 {
  %ext0 = arith.extui %arg0 nneg : i8 to i64
  %ext1 = arith.extui %arg1 : i8 to i64
  %res = arith.andi %ext0, %ext1 : i64
  return %res : i64
}

func.func @andOfExtUI_nneg_rhs(%arg0: i8, %arg1: i8) -> i64 {
  %ext0 = arith.extui %arg0 : i8 to i64
  %ext1 = arith.extui %arg1 nneg : i8 to i64
  %res = arith.andi %ext0, %ext1 : i64
  return %res : i64
}

func.func @andOfExtUI_nneg_both(%arg0: i8, %arg1: i8) -> i64 {
  %ext0 = arith.extui %arg0 nneg : i8 to i64
  %ext1 = arith.extui %arg1 nneg : i8 to i64
  %res = arith.andi %ext0, %ext1 : i64
  return %res : i64
}

func.func @orOfExtSI(%arg0: i8, %arg1: i8) -> i64 {
  %ext0 = arith.extsi %arg0 : i8 to i64
  %ext1 = arith.extsi %arg1 : i8 to i64
  %res = arith.ori %ext0, %ext1 : i64
  return %res : i64
}

func.func @orOfExtUI(%arg0: i8, %arg1: i8) -> i64 {
  %ext0 = arith.extui %arg0 : i8 to i64
  %ext1 = arith.extui %arg1 : i8 to i64
  %res = arith.ori %ext0, %ext1 : i64
  return %res : i64
}

func.func @orOfExtUI_nneg_both(%arg0: i8, %arg1: i8) -> i64 {
  %ext0 = arith.extui %arg0 nneg : i8 to i64
  %ext1 = arith.extui %arg1 nneg : i8 to i64
  %res = arith.ori %ext0, %ext1 : i64
  return %res : i64
}

func.func @orOfExtUI_nneg_mixed(%arg0: i8, %arg1: i8) -> i64 {
  %ext0 = arith.extui %arg0 nneg : i8 to i64
  %ext1 = arith.extui %arg1 : i8 to i64
  %res = arith.ori %ext0, %ext1 : i64
  return %res : i64
}

// -----

func.func @andOfAndConstant(%arg0: i32) -> i32 {
  %c12 = arith.constant 12 : i32
  %c10 = arith.constant 10 : i32
  %a1 = arith.andi %arg0, %c12 : i32
  %a2 = arith.andi %a1, %c10 : i32
  return %a2 : i32
}

// -----

func.func @andOfAndConstantIndex(%arg0: index) -> index {
  %c12 = arith.constant 12 : index
  %c10 = arith.constant 10 : index
  %a1 = arith.andi %arg0, %c12 : index
  %a2 = arith.andi %a1, %c10 : index
  return %a2 : index
}

// -----

func.func @andOfAndConstantMultiUse(%arg0: i32) -> (i32, i32) {
  %c12 = arith.constant 12 : i32
  %c10 = arith.constant 10 : i32
  %a1 = arith.andi %arg0, %c12 : i32
  %a2 = arith.andi %a1, %c10 : i32
  return %a1, %a2 : i32, i32
}

// -----

func.func @andOfAndConstantChain(%arg0: i32) -> (i32, i32, i32) {
  %c14 = arith.constant 14 : i32
  %c13 = arith.constant 13 : i32
  %c11 = arith.constant 11 : i32
  %a1 = arith.andi %arg0, %c14 : i32
  %a2 = arith.andi %a1, %c13 : i32
  %a3 = arith.andi %a2, %c11 : i32
  return %a1, %a2, %a3 : i32, i32, i32
}

// -----

func.func @orOfOrConstant(%arg0: i32) -> i32 {
  %c12 = arith.constant 12 : i32
  %c10 = arith.constant 10 : i32
  %o1 = arith.ori %arg0, %c12 : i32
  %o2 = arith.ori %o1, %c10 : i32
  return %o2 : i32
}

// -----

func.func @orOfOrConstantIndex(%arg0: index) -> index {
  %c12 = arith.constant 12 : index
  %c10 = arith.constant 10 : index
  %o1 = arith.ori %arg0, %c12 : index
  %o2 = arith.ori %o1, %c10 : index
  return %o2 : index
}

// -----

func.func @orOfOrConstantMultiUse(%arg0: i32) -> (i32, i32) {
  %c12 = arith.constant 12 : i32
  %c10 = arith.constant 10 : i32
  %o1 = arith.ori %arg0, %c12 : i32
  %o2 = arith.ori %o1, %c10 : i32
  return %o1, %o2 : i32, i32
}

// -----

// Negative test case to ensure no further folding is performed when there's a type mismatch between the values and the result.
func.func @nested_andi() -> (i32) {
  %0 = "test.constant"() {value = 0x7fffffff} : () -> i32
  %1 = "test.constant"() {value = -2147483648} : () -> i32
  %2 = "test.constant"() {value = 0x80000000} : () -> i32
  %4 = arith.andi %0, %1 : i32
  %5 = arith.andi %4, %2 : i32
  return %5 : i32
}

// -----

// Negative test case to ensure no further folding is performed when there's a type mismatch between the values and the result.
func.func @nested_ori() -> (i32) {
  %0 = "test.constant"() {value = 0x7fffffff} : () -> i32
  %1 = "test.constant"() {value = -2147483648} : () -> i32
  %2 = "test.constant"() {value = 0x80000000} : () -> i32
  %4 = arith.ori %0, %1 : i32
  %5 = arith.ori %4, %2 : i32
  return %5 : i32
}

// -----

func.func @indexCastOfSignExtend(%arg0: i8) -> index {
  %ext = arith.extsi %arg0 : i8 to i16
  %idx = arith.index_cast %ext : i16 to index
  return %idx : index
}

func.func @indexCastUIOfUnsignedExtend(%arg0: i8) -> index {
  %ext = arith.extui %arg0 : i8 to i16
  %idx = arith.index_castui %ext : i16 to index
  return %idx : index
}

func.func @indexCastUIOfUnsignedExtend_nneg_on_extui(%arg0: i8) -> index {
  %ext = arith.extui %arg0 nneg : i8 to i16
  %idx = arith.index_castui %ext : i16 to index
  return %idx : index
}

func.func @indexCastUIOfUnsignedExtend_nneg_on_castui(%arg0: i8) -> index {
  %ext = arith.extui %arg0 : i8 to i16
  %idx = arith.index_castui %ext nneg : i16 to index
  return %idx : index
}

func.func @indexCastFold() -> index {
  %c-2 = arith.constant -2 : i8
  %idx = arith.index_cast %c-2 : i8 to index
  return %idx : index
}

func.func @indexCastFoldIndexToInt() -> i32 {
  %c1 = arith.constant 1 : index
  %int = arith.index_cast %c1 : index to i32
  return %int : i32
}

func.func @indexCastFoldSplatVector() -> vector<3xindex> {
  %cst = arith.constant dense<42> : vector<3xi32>
  %int = arith.index_cast %cst : vector<3xi32> to vector<3xindex>
  return %int : vector<3xindex>
}

func.func @indexCastFoldVector() -> vector<3xindex> {
  %cst = arith.constant dense<[1, 2, 3]> : vector<3xi32>
  %int = arith.index_cast %cst : vector<3xi32> to vector<3xindex>
  return %int : vector<3xindex>
}

func.func @indexCastFoldSplatVectorIndexToInt() -> vector<3xi32> {
  %cst = arith.constant dense<42> : vector<3xindex>
  %int = arith.index_cast %cst : vector<3xindex> to vector<3xi32>
  return %int : vector<3xi32>
}

func.func @indexCastFoldVectorIndexToInt() -> vector<3xi32> {
  %cst = arith.constant dense<[1, 2, 3]> : vector<3xindex>
  %int = arith.index_cast %cst : vector<3xindex> to vector<3xi32>
  return %int : vector<3xi32>
}

func.func @indexCastUIFold() -> index {
  %c-2 = arith.constant -2 : i8
  %idx = arith.index_castui %c-2 : i8 to index
  return %idx : index
}

func.func @indexCastUIFoldSplatVector() -> vector<3xindex> {
  %cst = arith.constant dense<42> : vector<3xi32>
  %int = arith.index_castui %cst : vector<3xi32> to vector<3xindex>
  return %int : vector<3xindex>
}

func.func @indexCastUIFoldVector() -> vector<3xindex> {
  %cst = arith.constant dense<[1, 2, 3]> : vector<3xi32>
  %int = arith.index_castui %cst : vector<3xi32> to vector<3xindex>
  return %int : vector<3xindex>
}

func.func @indexCastUIFoldIndexToInt() -> i32 {
  %c1 = arith.constant 1 : index
  %int = arith.index_castui %c1 : index to i32
  return %int : i32
}

func.func @indexCastUIFoldSplatVectorIndexToInt() -> vector<3xi32> {
  %cst = arith.constant dense<42> : vector<3xindex>
  %int = arith.index_castui %cst : vector<3xindex> to vector<3xi32>
  return %int : vector<3xi32>
}

func.func @indexCastUIFoldVectorIndexToInt() -> vector<3xi32> {
  %cst = arith.constant dense<[1, 2, 3]> : vector<3xindex>
  %int = arith.index_castui %cst : vector<3xindex> to vector<3xi32>
  return %int : vector<3xi32>
}

// The intermediate index type (64 bits) is at least as wide as i64 (64 bits),
// so the round-trip is lossless and the chain folds away.
func.func @indexCastOfIndexCast_lossless(%arg0: i64) -> i64 {
  %0 = arith.index_cast %arg0 : i64 to index
  %1 = arith.index_cast %0 : index to i64
  return %1 : i64
}

// -----

// The intermediate i8 type (8 bits) is narrower than index (64 bits), so
// folding would drop the truncation — must be preserved.
func.func @indexCastOfIndexCast_lossy(%arg0: index) -> index {
  %0 = arith.index_cast %arg0 : index to i8
  %1 = arith.index_cast %0 : i8 to index
  return %1 : index
}

// -----

// The intermediate index type is at least as wide as i64, so the chain folds.
func.func @indexCastUIOfIndexCastUI_lossless(%arg0: i64) -> i64 {
  %0 = arith.index_castui %arg0 : i64 to index
  %1 = arith.index_castui %0 : index to i64
  return %1 : i64
}

// -----

// The intermediate i8 is narrower than index, so the truncation must be kept.
func.func @indexCastUIOfIndexCastUI_lossy(%arg0: index) -> index {
  %0 = arith.index_castui %arg0 : index to i8
  %1 = arith.index_castui %0 : i8 to index
  return %1 : index
}

// -----

// Regression test for the original bug: a 3-element chain where the outermost
// cast pair would be incorrectly folded away, dropping the i8 truncation.
func.func @indexCastUIOfIndexCastUI_3way_lossy(%arg0: i64) -> index {
  %0 = arith.index_castui %arg0 : i64 to index
  %1 = arith.index_castui %0 : index to i8
  %2 = arith.index_castui %1 : i8 to index
  return %2 : index
}

// -----

// Signed 3-way chain where the outermost pair folds (i64->index is lossless
// since 64 >= 64) but the inner i8 truncation is preserved.  The net result
// is that %2 becomes %0 directly, collapsing the last two casts.
func.func @indexCastOfIndexCast_3way_lossy(%arg0: i8) -> index {
  %0 = arith.index_cast %arg0 : i8 to index
  %1 = arith.index_cast %0 : index to i64
  %2 = arith.index_cast %1 : i64 to index
  return %2 : index
}

// -----

// i8 -> index -> i8: the intermediate index is at least as wide as i8 (64 >= 8),
// so the round-trip is lossless and the chain folds away.
func.func @indexCastOfIndexCast_i8_roundtrip(%arg0: i8) -> i8 {
  %0 = arith.index_cast %arg0 : i8 to index
  %1 = arith.index_cast %0 : index to i8
  return %1 : i8
}

// -----

// vector<3xi128> -> vector<3xindex> -> vector<3xi128>: i128 (128 bits) is wider
// than the 64-bit index, so the cast is lossy and must NOT fold.
func.func @indexCastOfIndexCast_vector_lossy(%arg0: vector<3xi128>) -> vector<3xi128> {
  %0 = arith.index_cast %arg0 : vector<3xi128> to vector<3xindex>
  %1 = arith.index_cast %0 : vector<3xindex> to vector<3xi128>
  return %1 : vector<3xi128>
}

// -----

func.func @signExtendConstant() -> i16 {
  %c-2 = arith.constant -2 : i8
  %ext = arith.extsi %c-2 : i8 to i16
  return %ext : i16
}

func.func @signExtendConstantSplat() -> vector<4xi16> {
  %c-2 = arith.constant -2 : i8
  %splat = vector.broadcast %c-2 : i8 to vector<4xi8>
  %ext = arith.extsi %splat : vector<4xi8> to vector<4xi16>
  return %ext : vector<4xi16>
}

func.func @signExtendConstantVector() -> vector<4xi16> {
  %vector = arith.constant dense<[1, 3, 5, 7]> : vector<4xi8>
  %ext = arith.extsi %vector : vector<4xi8> to vector<4xi16>
  return %ext : vector<4xi16>
}

func.func @unsignedExtendConstant() -> i16 {
  %c2 = arith.constant 2 : i8
  %ext = arith.extui %c2 : i8 to i16
  return %ext : i16
}

func.func @unsignedExtendConstantSplat() -> vector<4xi16> {
  %c2 = arith.constant 2 : i8
  %splat = vector.broadcast %c2 : i8 to vector<4xi8>
  %ext = arith.extui %splat : vector<4xi8> to vector<4xi16>
  return %ext : vector<4xi16>
}

func.func @unsignedExtendConstantVector() -> vector<4xi16> {
  %vector = arith.constant dense<[1, 3, 5, 7]> : vector<4xi8>
  %ext = arith.extui %vector : vector<4xi8> to vector<4xi16>
  return %ext : vector<4xi16>
}

func.func @extFPConstant() -> f64 {
  %cst = arith.constant 1.000000e+00 : f32
  %0 = arith.extf %cst : f32 to f64
  return %0 : f64
}

func.func @extFPVectorConstant() -> vector<2xf128> {
  %cst = arith.constant dense<[0.000000e+00, 1.000000e+00]> : vector<2xf80>
  %0 = arith.extf %cst : vector<2xf80> to vector<2xf128>
  return %0 : vector<2xf128>
}

func.func @truncExtf(%arg0: f32) -> f32 {
  %extf = arith.extf %arg0 : f32 to f64
  %trunc = arith.truncf %extf : f64 to f32
  return %trunc : f32
}

func.func @truncExtf1(%arg0: bf16) -> bf16 {
  %extf = arith.extf %arg0 : bf16 to f32
  %trunc = arith.truncf %extf : f32 to bf16
  return %trunc : bf16
}

func.func @truncExtf2(%arg0: bf16) -> f16 {
  %extf = arith.extf %arg0 : bf16 to f32
  %trunc = arith.truncf %extf : f32 to f16
  return %trunc : f16
}

func.func @truncExtf3(%arg0: f32) -> f16 {
  %extf = arith.extf %arg0 : f32 to f64
  %truncf = arith.truncf %extf : f64 to f16
  return %truncf : f16
}

func.func @truncSitofp(%arg0: i32) -> f32 {
  %sitofp = arith.sitofp %arg0 : i32 to f64
  %trunc = arith.truncf %sitofp : f64 to f32
  return %trunc : f32
}

func.func @truncSitofpConstrained(%arg0: i32) -> f32 {
  %sitofp = arith.sitofp %arg0 : i32 to f64
  %trunc = arith.truncf %sitofp to_nearest_even : f64 to f32
  return %trunc : f32
}

func.func @truncUitofp(%arg0: i32) -> f32 {
  %uitofp = arith.uitofp %arg0 : i32 to f64
  %trunc = arith.truncf %uitofp : f64 to f32
  return %trunc : f32
}

func.func @truncUitofp_nneg(%arg0: i32) -> f32 {
  %uitofp = arith.uitofp %arg0 nneg : i32 to f64
  %trunc = arith.truncf %uitofp : f64 to f32
  return %trunc : f32
}

func.func @sitofpExtsi(%arg0: i8) -> bf16 {
  %extsi = arith.extsi %arg0 : i8 to i32
  %sitofp = arith.sitofp %extsi : i32 to bf16
  return %sitofp : bf16
}

func.func @sitofpExtui(%arg0: i4) -> bf16 {
  %extui = arith.extui %arg0 : i4 to i8
  %sitofp = arith.sitofp %extui : i8 to bf16
  return %sitofp : bf16
}

func.func @uitofpExtui(%arg0: i8) -> bf16 {
  %extui = arith.extui %arg0 : i8 to i32
  %uitofp = arith.uitofp %extui : i32 to bf16
  return %uitofp : bf16
}

func.func @sitofpExtui_nneg(%arg0: i4) -> bf16 {
  %extui = arith.extui %arg0 nneg : i4 to i8
  %sitofp = arith.sitofp %extui : i8 to bf16
  return %sitofp : bf16
}
// This may happen when extending f8E5M2FNUZ to f16.

func.func @truncConstant(%arg0: i8) -> i16 {
  %c-2 = arith.constant -2 : i32
  %tr = arith.trunci %c-2 : i32 to i16
  return %tr : i16
}

func.func @truncExtui(%arg0: i32) -> i32 {
  %extui = arith.extui %arg0 : i32 to i64
  %trunci = arith.trunci %extui : i64 to i32
  return %trunci : i32
}

func.func @truncExtui2(%arg0: i32) -> i16 {
  %extui = arith.extui %arg0 : i32 to i64
  %trunci = arith.trunci %extui : i64 to i16
  return %trunci : i16
}

func.func @truncExtui3(%arg0: i8) -> i16 {
  %extui = arith.extui %arg0 : i8 to i32
  %trunci = arith.trunci %extui : i32 to i16
  return %trunci : i16
}

func.func @truncExtui3_nneg(%arg0: i8) -> i16 {
  %extui = arith.extui %arg0 nneg : i8 to i32
  %trunci = arith.trunci %extui : i32 to i16
  return %trunci : i16
}

func.func @truncExtuiVector(%arg0: vector<2xi32>) -> vector<2xi16> {
  %extsi = arith.extui %arg0 : vector<2xi32> to vector<2xi64>
  %trunci = arith.trunci %extsi : vector<2xi64> to vector<2xi16>
  return %trunci : vector<2xi16>
}

func.func @truncExtsi(%arg0: i32) -> i32 {
  %extsi = arith.extsi %arg0 : i32 to i64
  %trunci = arith.trunci %extsi : i64 to i32
  return %trunci : i32
}

func.func @truncExtsi2(%arg0: i32) -> i16 {
  %extsi = arith.extsi %arg0 : i32 to i64
  %trunci = arith.trunci %extsi : i64 to i16
  return %trunci : i16
}

func.func @truncExtsi3(%arg0: i8) -> i16 {
  %extsi = arith.extsi %arg0 : i8 to i32
  %trunci = arith.trunci %extsi : i32 to i16
  return %trunci : i16
}

func.func @truncExtsiVector(%arg0: vector<2xi32>) -> vector<2xi16> {
  %extsi = arith.extsi %arg0 : vector<2xi32> to vector<2xi64>
  %trunci = arith.trunci %extsi : vector<2xi64> to vector<2xi16>
  return %trunci : vector<2xi16>
}

func.func @truncConstantSplat() -> vector<4xi8> {
  %c-2 = arith.constant -2 : i16
  %splat = vector.broadcast %c-2 : i16 to vector<4xi16>
  %trunc = arith.trunci %splat : vector<4xi16> to vector<4xi8>
  return %trunc : vector<4xi8>
}

func.func @truncConstantVector() -> vector<4xi8> {
  %vector = arith.constant dense<[1, 3, 5, 7]> : vector<4xi16>
  %trunc = arith.trunci %vector : vector<4xi16> to vector<4xi8>
  return %trunc : vector<4xi8>
}

func.func @truncTrunc(%arg0: i64) -> i8 {
  %tr1 = arith.trunci %arg0 : i64 to i32
  %tr2 = arith.trunci %tr1 : i32 to i8
  return %tr2 : i8
}

func.func @truncFPConstant() -> bf16 {
  %cst = arith.constant 1.000000e+00 : f32
  %0 = arith.truncf %cst : f32 to bf16
  return %0 : bf16
}

func.func @truncFPToNearestEvenConstant() -> bf16 {
  %cst = arith.constant 1.000000e+00 : f32
  %0 = arith.truncf %cst to_nearest_even : f32 to bf16
  return %0 : bf16
}

func.func @truncFPDownwardConstant() -> bf16 {
  %cst = arith.constant 1.000000e+00 : f32
  %0 = arith.truncf %cst downward : f32 to bf16
  return %0 : bf16
}

func.func @truncFPUpwardConstant() -> bf16 {
  %cst = arith.constant 1.000000e+00 : f32
  %0 = arith.truncf %cst upward : f32 to bf16
  return %0 : bf16
}

func.func @truncFPTowardZeroConstant() -> bf16 {
  %cst = arith.constant 1.000000e+00 : f32
  %0 = arith.truncf %cst toward_zero : f32 to bf16
  return %0 : bf16
}

func.func @truncFPToNearestAwayConstant() -> bf16 {
  %cst = arith.constant 1.000000e+00 : f32
  %0 = arith.truncf %cst to_nearest_away : f32 to bf16
  return %0 : bf16
}

func.func @truncFPVectorConstant() -> vector<2xbf16> {
  %cst = arith.constant dense<[0.000000e+00, 1.000000e+00]> : vector<2xf32>
  %0 = arith.truncf %cst : vector<2xf32> to vector<2xbf16>
  return %0 : vector<2xbf16>
}

// Test that cases with rounding are NOT propagated
func.func @truncFPConstantRounding() -> bf16 {
  %cst = arith.constant 1.444000e+25 : f32
  %0 = arith.truncf %cst : f32 to bf16
  return %0 : bf16
}

func.func @tripleAddAdd(%arg0: index) -> index {
  %c17 = arith.constant 17 : index
  %c42 = arith.constant 42 : index
  %add1 = arith.addi %c17, %arg0 : index
  %add2 = arith.addi %c42, %add1 : index
  return %add2 : index
}

func.func @tripleAddAddOvf1(%arg0: index) -> index {
  %c17 = arith.constant 17 : index
  %c42 = arith.constant 42 : index
  %add1 = arith.addi %c17, %arg0 overflow<nsw, nuw> : index
  %add2 = arith.addi %c42, %add1 overflow<nsw, nuw> : index
  return %add2 : index
}

func.func @tripleAddAddOvf2(%arg0: index) -> index {
  %c17 = arith.constant 17 : index
  %c42 = arith.constant 42 : index
  %add1 = arith.addi %c17, %arg0 overflow<nsw> : index
  %add2 = arith.addi %c42, %add1 overflow<nuw> : index
  return %add2 : index
}


func.func @foldSubXX_tensor(%static : tensor<10xi32>, %dyn : tensor<?x?xi32>) -> (tensor<10xi32>, tensor<?x?xi32>) {
  %static_sub = arith.subi %static, %static : tensor<10xi32>
  %dyn_sub = arith.subi %dyn, %dyn : tensor<?x?xi32>
  return %static_sub, %dyn_sub : tensor<10xi32>, tensor<?x?xi32>
}

func.func @foldSubXX_vector(%static : vector<8xi32>, %dyn : vector<[4]xi32>) -> (vector<8xi32>, vector<[4]xi32>) {
  %static_sub = arith.subi %static, %static : vector<8xi32>
  %dyn_sub = arith.subi %dyn, %dyn : vector<[4]xi32>
  return %static_sub, %dyn_sub : vector<8xi32>, vector<[4]xi32>
}

func.func @tripleAddSub0(%arg0: index) -> index {
  %c17 = arith.constant 17 : index
  %c42 = arith.constant 42 : index
  %add1 = arith.subi %c17, %arg0 : index
  %add2 = arith.addi %c42, %add1 : index
  return %add2 : index
}

func.func @tripleAddSub0Ovf(%arg0: index) -> index {
  %c17 = arith.constant 17 : index
  %c42 = arith.constant 42 : index
  %add1 = arith.subi %c17, %arg0 overflow<nsw, nuw> : index
  %add2 = arith.addi %c42, %add1 overflow<nsw, nuw> : index
  return %add2 : index
}

func.func @tripleAddSub1(%arg0: index) -> index {
  %c17 = arith.constant 17 : index
  %c42 = arith.constant 42 : index
  %add1 = arith.subi %arg0, %c17 : index
  %add2 = arith.addi %c42, %add1 : index
  return %add2 : index
}

func.func @tripleAddSub1Ovf(%arg0: index) -> index {
  %c17 = arith.constant 17 : index
  %c42 = arith.constant 42 : index
  %add1 = arith.subi %arg0, %c17 overflow<nsw, nuw> : index
  %add2 = arith.addi %c42, %add1 overflow<nsw, nuw> : index
  return %add2 : index
}

func.func @tripleSubAdd0(%arg0: index) -> index {
  %c17 = arith.constant 17 : index
  %c42 = arith.constant 42 : index
  %add1 = arith.addi %c17, %arg0 : index
  %add2 = arith.subi %c42, %add1 : index
  return %add2 : index
}

func.func @tripleSubAdd0Ovf(%arg0: index) -> index {
  %c17 = arith.constant 17 : index
  %c42 = arith.constant 42 : index
  %add1 = arith.addi %c17, %arg0 overflow<nsw, nuw> : index
  %add2 = arith.subi %c42, %add1 overflow<nsw, nuw> : index
  return %add2 : index
}

func.func @tripleSubAdd1(%arg0: index) -> index {
  %c17 = arith.constant 17 : index
  %c42 = arith.constant 42 : index
  %add1 = arith.addi %c17, %arg0 : index
  %add2 = arith.subi %add1, %c42 : index
  return %add2 : index
}

func.func @subSub0(%arg0: index, %arg1: index) -> index {
  %sub1 = arith.subi %arg0, %arg1 : index
  %sub2 = arith.subi %sub1, %arg0 : index
  return %sub2 : index
}

func.func @subSub1(%arg0: index, %arg1: index) -> index {
  %sub1 = arith.subi %arg0, %arg1 : index
  %sub2 = arith.subi %arg0, %sub1 : index
  return %sub2 : index
}

func.func @subSub0Ovf(%arg0: index, %arg1: index) -> index {
  %sub1 = arith.subi %arg0, %arg1 overflow<nsw, nuw> : index
  %sub2 = arith.subi %sub1, %arg0 overflow<nsw, nuw> : index
  return %sub2 : index
}

func.func @tripleSubSub0(%arg0: index) -> index {
  %c17 = arith.constant 17 : index
  %c42 = arith.constant 42 : index
  %add1 = arith.subi %c17, %arg0 : index
  %add2 = arith.subi %c42, %add1 : index
  return %add2 : index
}

func.func @tripleSubSub0Ovf(%arg0: index) -> index {
  %c17 = arith.constant 17 : index
  %c42 = arith.constant 42 : index
  %add1 = arith.subi %c17, %arg0 overflow<nsw, nuw> : index
  %add2 = arith.subi %c42, %add1 overflow<nsw, nuw> : index
  return %add2 : index
}


func.func @tripleSubSub1(%arg0: index) -> index {
  %c17 = arith.constant 17 : index
  %c42 = arith.constant 42 : index
  %add1 = arith.subi %c17, %arg0 : index
  %add2 = arith.subi %add1, %c42 : index
  return %add2 : index
}

func.func @tripleSubSub1Ovf(%arg0: index) -> index {
  %c17 = arith.constant 17 : index
  %c42 = arith.constant 42 : index
  %add1 = arith.subi %c17, %arg0 overflow<nsw, nuw> : index
  %add2 = arith.subi %add1, %c42 overflow<nsw, nuw> : index
  return %add2 : index
}

func.func @tripleSubSub2(%arg0: index) -> index {
  %c17 = arith.constant 17 : index
  %c42 = arith.constant 42 : index
  %add1 = arith.subi %arg0, %c17 : index
  %add2 = arith.subi %c42, %add1 : index
  return %add2 : index
}

func.func @tripleSubSub2Ovf(%arg0: index) -> index {
  %c17 = arith.constant 17 : index
  %c42 = arith.constant 42 : index
  %add1 = arith.subi %arg0, %c17 overflow<nsw, nuw> : index
  %add2 = arith.subi %c42, %add1 overflow<nsw, nuw> : index
  return %add2 : index
}

func.func @tripleSubSub3(%arg0: index) -> index {
  %c17 = arith.constant 17 : index
  %c42 = arith.constant 42 : index
  %add1 = arith.subi %arg0, %c17 : index
  %add2 = arith.subi %add1, %c42 : index
  return %add2 : index
}

func.func @tripleSubSub3Ovf(%arg0: index) -> index {
  %c17 = arith.constant 17 : index
  %c42 = arith.constant 42 : index
  %add1 = arith.subi %arg0, %c17 overflow<nsw, nuw> : index
  %add2 = arith.subi %add1, %c42 overflow<nsw, nuw> : index
  return %add2 : index
}

func.func @subAdd1(%arg0: index, %arg1 : index) -> index {
  %add = arith.addi %arg0, %arg1 : index
  %sub = arith.subi %add, %arg1 : index
  return %sub : index
}

func.func @subAdd2(%arg0: index, %arg1 : index) -> index {
  %add = arith.addi %arg0, %arg1 : index
  %sub = arith.subi %add, %arg0 : index
  return %sub : index
}

func.func @doubleAddSub1(%arg0: index, %arg1 : index) -> index {
  %sub = arith.subi %arg0, %arg1 : index
  %add = arith.addi %sub, %arg1 : index
  return %add : index
}

func.func @doubleAddSub2(%arg0: index, %arg1 : index) -> index {
  %sub = arith.subi %arg0, %arg1 : index
  %add = arith.addi %arg1, %sub : index
  return %add : index
}

// Negative test case to ensure no further folding is performed when there's a type mismatch between the values and the result.
func.func @nested_muli() -> (i32) {
  %0 = "test.constant"() {value = 0x7fffffff} : () -> i32
  %1 = "test.constant"() {value = -2147483648} : () -> i32
  %2 = "test.constant"() {value = 0x80000000} : () -> i32
  %4 = arith.muli %0, %1 : i32
  %5 = arith.muli %4, %2 : i32
  return %5 : i32
}

func.func @tripleMulIMulIIndex(%arg0: index) -> index {
  %c3 = arith.constant 3 : index
  %c5 = arith.constant 5 : index
  %mul1 = arith.muli %arg0, %c3 : index
  %mul2 = arith.muli %mul1, %c5 : index
  return %mul2 : index
}

func.func @tripleMulIMulII32(%arg0: i32) -> i32 {
  %c_n3 = arith.constant -3 : i32
  %c7 = arith.constant 7 : i32
  %mul1 = arith.muli %arg0, %c_n3 : i32
  %mul2 = arith.muli %mul1, %c7 : i32
  return %mul2 : i32
}

func.func @tripleMulLargeInt(%arg0: i256) -> i256 {
  %0 = arith.constant 3618502788666131213697322783095070105623107215331596699973092056135872020481 : i256
  %1 = arith.constant 1 : i256
  %2 = arith.addi %arg0, %0 : i256
  %3 = arith.addi %2, %1 : i256
  return %3 : i256
}

func.func @addiMuliToSubiRhsI32(%arg0: i32, %arg1: i32) -> i32 {
  %c-1 = arith.constant -1 : i32
  %neg = arith.muli %arg1, %c-1 : i32
  %add = arith.addi %arg0, %neg : i32
  return %add : i32
}

func.func @addiMuliToSubiRhsIndex(%arg0: index, %arg1: index) -> index {
  %c-1 = arith.constant -1 : index
  %neg = arith.muli %arg1, %c-1 : index
  %add = arith.addi %arg0, %neg : index
  return %add : index
}

func.func @addiMuliToSubiRhsVector(%arg0: vector<3xi64>, %arg1: vector<3xi64>) -> vector<3xi64> {
  %c-1 = arith.constant dense<-1> : vector<3xi64>
  %neg = arith.muli %arg1, %c-1 : vector<3xi64>
  %add = arith.addi %arg0, %neg : vector<3xi64>
  return %add : vector<3xi64>
}

func.func @addiMuliToSubiLhsI32(%arg0: i32, %arg1: i32) -> i32 {
  %c-1 = arith.constant -1 : i32
  %neg = arith.muli %arg1, %c-1 : i32
  %add = arith.addi %neg, %arg0 : i32
  return %add : i32
}

func.func @addiMuliToSubiLhsIndex(%arg0: index, %arg1: index) -> index {
  %c-1 = arith.constant -1 : index
  %neg = arith.muli %arg1, %c-1 : index
  %add = arith.addi %neg, %arg0 : index
  return %add : index
}

func.func @addiMuliToSubiLhsVector(%arg0: vector<3xi64>, %arg1: vector<3xi64>) -> vector<3xi64> {
  %c-1 = arith.constant dense<-1> : vector<3xi64>
  %neg = arith.muli %arg1, %c-1 : vector<3xi64>
  %add = arith.addi %neg, %arg0 : vector<3xi64>
  return %add : vector<3xi64>
}

func.func @adduiExtendedZeroRhs(%arg0: i32) -> (i32, i1) {
  %zero = arith.constant 0 : i32
  %sum, %overflow = arith.addui_extended %arg0, %zero: i32, i1
  return %sum, %overflow : i32, i1
}

func.func @adduiExtendedZeroRhsSplat(%arg0: vector<4xi32>) -> (vector<4xi32>, vector<4xi1>) {
  %zero = arith.constant dense<0> : vector<4xi32>
  %sum, %overflow = arith.addui_extended %arg0, %zero: vector<4xi32>, vector<4xi1>
  return %sum, %overflow : vector<4xi32>, vector<4xi1>
}

func.func @adduiExtendedZeroLhs(%arg0: i32) -> (i32, i1) {
  %zero = arith.constant 0 : i32
  %sum, %overflow = arith.addui_extended %zero, %arg0: i32, i1
  return %sum, %overflow : i32, i1
}

func.func @adduiExtendedUnusedOverflowScalar(%arg0: i32, %arg1: i32) -> i32 {
  %sum, %overflow = arith.addui_extended %arg0, %arg1: i32, i1
  return %sum : i32
}

func.func @adduiExtendedUnusedOverflowVector(%arg0: vector<3xi32>, %arg1: vector<3xi32>) -> vector<3xi32> {
  %sum, %overflow = arith.addui_extended %arg0, %arg1: vector<3xi32>, vector<3xi1>
  return %sum : vector<3xi32>
}

func.func @adduiExtendedConstants() -> (i32, i1) {
  %c13 = arith.constant 13 : i32
  %c37 = arith.constant 37 : i32
  %sum, %overflow = arith.addui_extended %c13, %c37: i32, i1
  return %sum, %overflow : i32, i1
}

func.func @adduiExtendedConstantsOverflow1() -> (i32, i1) {
  %max = arith.constant 4294967295 : i32
  %c1 = arith.constant 1 : i32
  %sum, %overflow = arith.addui_extended %max, %c1: i32, i1
  return %sum, %overflow : i32, i1
}

func.func @adduiExtendedConstantsOverflow2() -> (i32, i1) {
  %max = arith.constant 4294967295 : i32
  %sum, %overflow = arith.addui_extended %max, %max: i32, i1
  return %sum, %overflow : i32, i1
}

func.func @adduiExtendedConstantsOverflowVector() -> (vector<4xi32>, vector<4xi1>) {
  %v1 = arith.constant dense<[1, 3, 3, 7]> : vector<4xi32>
  %v2 = arith.constant dense<[0, 3, 4294967295, 7]> : vector<4xi32>
  %sum, %overflow = arith.addui_extended %v1, %v2 : vector<4xi32>, vector<4xi1>
  return %sum, %overflow : vector<4xi32>, vector<4xi1>
}

func.func @adduiExtendedConstantsSplatVector() -> (vector<4xi32>, vector<4xi1>) {
  %v1 = arith.constant dense<1> : vector<4xi32>
  %v2 = arith.constant dense<2> : vector<4xi32>
  %sum, %overflow = arith.addui_extended %v1, %v2 : vector<4xi32>, vector<4xi1>
  return %sum, %overflow : vector<4xi32>, vector<4xi1>
}

func.func @adduiExtendedPoisonLhs() -> (i32, i1) {
  %poison = ub.poison : i32
  %c5 = arith.constant 5 : i32
  %sum, %overflow = arith.addui_extended %poison, %c5 : i32, i1
  return %sum, %overflow : i32, i1
}

func.func @adduiExtendedPoisonRhs() -> (i32, i1) {
  %c5 = arith.constant 5 : i32
  %poison = ub.poison : i32
  %sum, %overflow = arith.addui_extended %c5, %poison : i32, i1
  return %sum, %overflow : i32, i1
}

func.func @subuiExtendedZeroRhs(%arg0: i32) -> (i32, i1) {
  %zero = arith.constant 0 : i32
  %diff, %borrow = arith.subui_extended %arg0, %zero: i32, i1
  return %diff, %borrow : i32, i1
}

func.func @subuiExtendedZeroRhsSplat(%arg0: vector<4xi32>) -> (vector<4xi32>, vector<4xi1>) {
  %zero = arith.constant dense<0> : vector<4xi32>
  %diff, %borrow = arith.subui_extended %arg0, %zero: vector<4xi32>, vector<4xi1>
  return %diff, %borrow : vector<4xi32>, vector<4xi1>
}

func.func @subuiExtendedSameOperand(%arg0: i32) -> (i32, i1) {
  %diff, %borrow = arith.subui_extended %arg0, %arg0: i32, i1
  return %diff, %borrow : i32, i1
}

func.func @subuiExtendedSameOperandVector(%arg0: vector<4xi32>) -> (vector<4xi32>, vector<4xi1>) {
  %diff, %borrow = arith.subui_extended %arg0, %arg0: vector<4xi32>, vector<4xi1>
  return %diff, %borrow : vector<4xi32>, vector<4xi1>
}

func.func @subuiExtendedUnusedBorrowScalar(%arg0: i32, %arg1: i32) -> i32 {
  %diff, %borrow = arith.subui_extended %arg0, %arg1: i32, i1
  return %diff : i32
}

func.func @subuiExtendedUnusedBorrowVector(%arg0: vector<3xi32>, %arg1: vector<3xi32>) -> vector<3xi32> {
  %diff, %borrow = arith.subui_extended %arg0, %arg1: vector<3xi32>, vector<3xi1>
  return %diff : vector<3xi32>
}

func.func @subuiExtendedConstants() -> (i32, i1) {
  %c5 = arith.constant 5 : i32
  %c3 = arith.constant 3 : i32
  %diff, %borrow = arith.subui_extended %c5, %c3: i32, i1
  return %diff, %borrow : i32, i1
}

func.func @subuiExtendedConstantsBorrow() -> (i32, i1) {
  %c3 = arith.constant 3 : i32
  %c5 = arith.constant 5 : i32
  %diff, %borrow = arith.subui_extended %c3, %c5: i32, i1
  return %diff, %borrow : i32, i1
}

func.func @subuiExtendedConstantsBorrowVector() -> (vector<4xi32>, vector<4xi1>) {
  %v1 = arith.constant dense<[1, 3, 3, 7]> : vector<4xi32>
  %v2 = arith.constant dense<[0, 3, 4, 7]> : vector<4xi32>
  %diff, %borrow = arith.subui_extended %v1, %v2 : vector<4xi32>, vector<4xi1>
  return %diff, %borrow : vector<4xi32>, vector<4xi1>
}

func.func @subuiExtendedPoisonLhs() -> (i32, i1) {
  %poison = ub.poison : i32
  %c5 = arith.constant 5 : i32
  %diff, %borrow = arith.subui_extended %poison, %c5 : i32, i1
  return %diff, %borrow : i32, i1
}

func.func @subuiExtendedPoisonRhs() -> (i32, i1) {
  %c5 = arith.constant 5 : i32
  %poison = ub.poison : i32
  %diff, %borrow = arith.subui_extended %c5, %poison : i32, i1
  return %diff, %borrow : i32, i1
}

func.func @mulsiExtendedZeroRhs(%arg0: i32) -> (i32, i32) {
  %zero = arith.constant 0 : i32
  %low, %high = arith.mulsi_extended %arg0, %zero: i32
  return %low, %high : i32, i32
}

func.func @mulsiExtendedZeroRhsSplat(%arg0: vector<3xi32>) -> (vector<3xi32>, vector<3xi32>) {
  %zero = arith.constant dense<0> : vector<3xi32>
  %low, %high = arith.mulsi_extended %arg0, %zero: vector<3xi32>
  return %low, %high : vector<3xi32>, vector<3xi32>
}

func.func @mulsiExtendedZeroLhs(%arg0: i32) -> (i32, i32) {
  %zero = arith.constant 0 : i32
  %low, %high = arith.mulsi_extended %zero, %arg0: i32
  return %low, %high : i32, i32
}

func.func @mulsiExtendedOneRhs(%arg0: i32) -> (i32, i32) {
  %one = arith.constant 1 : i32
  %low, %high = arith.mulsi_extended %arg0, %one: i32
  return %low, %high : i32, i32
}

func.func @mulsiExtendedOneRhsSplat(%arg0: vector<3xi32>) -> (vector<3xi32>, vector<3xi32>) {
  %one = arith.constant dense<1> : vector<3xi32>
  %low, %high = arith.mulsi_extended %arg0, %one: vector<3xi32>
  return %low, %high : vector<3xi32>, vector<3xi32>
}

func.func @mulsiExtendedOneRhsI1(%arg0: i1) -> (i1, i1) {
  %one = arith.constant true
  %low, %high = arith.mulsi_extended %arg0, %one: i1
  return %low, %high : i1, i1
}

func.func @mulsiExtendedOneRhsSplatI1(%arg0: vector<3xi1>) -> (vector<3xi1>, vector<3xi1>) {
  %one = arith.constant dense<true> : vector<3xi1>
  %low, %high = arith.mulsi_extended %arg0, %one: vector<3xi1>
  return %low, %high : vector<3xi1>, vector<3xi1>
}

func.func @mulsiExtendedUnusedHigh(%arg0: i32) -> i32 {
  %low, %high = arith.mulsi_extended %arg0, %arg0: i32
  return %low : i32
}

func.func @mulsiExtendedScalarConstants() -> (i8, i8) {
  %c57 = arith.constant 57 : i8
  %c_n13 = arith.constant -13 : i8
  %low, %high = arith.mulsi_extended %c57, %c_n13: i8
  return %low, %high : i8, i8
}

func.func @mulsiExtendedVectorConstants() -> (vector<3xi8>, vector<3xi8>) {
  %cstA = arith.constant dense<[5, 37, -17]> : vector<3xi8>
  %cstB = arith.constant dense<[13, 99, -2]> : vector<3xi8>
  %low, %high = arith.mulsi_extended %cstA, %cstB: vector<3xi8>
  return %low, %high : vector<3xi8>, vector<3xi8>
}

func.func @muluiExtendedZeroRhs(%arg0: i32) -> (i32, i32) {
  %zero = arith.constant 0 : i32
  %low, %high = arith.mului_extended %arg0, %zero: i32
  return %low, %high : i32, i32
}

func.func @muluiExtendedZeroRhsSplat(%arg0: vector<3xi32>) -> (vector<3xi32>, vector<3xi32>) {
  %zero = arith.constant dense<0> : vector<3xi32>
  %low, %high = arith.mului_extended %arg0, %zero: vector<3xi32>
  return %low, %high : vector<3xi32>, vector<3xi32>
}

func.func @muluiExtendedZeroLhs(%arg0: i32) -> (i32, i32) {
  %zero = arith.constant 0 : i32
  %low, %high = arith.mului_extended %zero, %arg0: i32
  return %low, %high : i32, i32
}

func.func @muluiExtendedOneRhs(%arg0: i32) -> (i32, i32) {
  %zero = arith.constant 1 : i32
  %low, %high = arith.mului_extended %arg0, %zero: i32
  return %low, %high : i32, i32
}

func.func @muluiExtendedOneRhsSplat(%arg0: vector<3xi32>) -> (vector<3xi32>, vector<3xi32>) {
  %zero = arith.constant dense<1> : vector<3xi32>
  %low, %high = arith.mului_extended %arg0, %zero: vector<3xi32>
  return %low, %high : vector<3xi32>, vector<3xi32>
}

func.func @muluiExtendedOneLhs(%arg0: i32) -> (i32, i32) {
  %zero = arith.constant 1 : i32
  %low, %high = arith.mului_extended %zero, %arg0: i32
  return %low, %high : i32, i32
}

func.func @muluiExtendedUnusedHigh(%arg0: i32) -> i32 {
  %low, %high = arith.mului_extended %arg0, %arg0: i32
  return %low : i32
}

// This shouldn't be folded.
func.func @muluiExtendedUnusedLow(%arg0: i32) -> i32 {
  %low, %high = arith.mului_extended %arg0, %arg0: i32
  return %high : i32
}

func.func @muluiExtendedScalarConstants() -> (i8, i8) {
  %c57 = arith.constant 57 : i8
  %c133 = arith.constant 133 : i8
  %low, %high = arith.mului_extended %c57, %c133: i8 // = 7581
  return %low, %high : i8, i8
}

func.func @muluiExtendedVectorConstants() -> (vector<3xi8>, vector<3xi8>) {
  %cstA = arith.constant dense<[5, 37, 255]> : vector<3xi8>
  %cstB = arith.constant dense<[13, 99, 255]> : vector<3xi8>
  %low, %high = arith.mului_extended %cstA, %cstB: vector<3xi8>
  return %low, %high : vector<3xi8>, vector<3xi8>
}

func.func @notCmpEQ(%arg0: i8, %arg1: i8) -> i1 {
  %true = arith.constant true
  %cmp = arith.cmpi "eq", %arg0, %arg1 : i8
  %ncmp = arith.xori %cmp, %true : i1
  return %ncmp : i1
}

func.func @notCmpEQ2(%arg0: i8, %arg1: i8) -> i1 {
  %true = arith.constant true
  %cmp = arith.cmpi "eq", %arg0, %arg1 : i8
  %ncmp = arith.xori %true, %cmp : i1
  return %ncmp : i1
}

func.func @notCmpNE(%arg0: i8, %arg1: i8) -> i1 {
  %true = arith.constant true
  %cmp = arith.cmpi "ne", %arg0, %arg1 : i8
  %ncmp = arith.xori %cmp, %true : i1
  return %ncmp : i1
}

func.func @notCmpSLT(%arg0: i8, %arg1: i8) -> i1 {
  %true = arith.constant true
  %cmp = arith.cmpi "slt", %arg0, %arg1 : i8
  %ncmp = arith.xori %cmp, %true : i1
  return %ncmp : i1
}

func.func @notCmpSLE(%arg0: i8, %arg1: i8) -> i1 {
  %true = arith.constant true
  %cmp = arith.cmpi "sle", %arg0, %arg1 : i8
  %ncmp = arith.xori %cmp, %true : i1
  return %ncmp : i1
}

func.func @notCmpSGT(%arg0: i8, %arg1: i8) -> i1 {
  %true = arith.constant true
  %cmp = arith.cmpi "sgt", %arg0, %arg1 : i8
  %ncmp = arith.xori %cmp, %true : i1
  return %ncmp : i1
}

func.func @notCmpSGE(%arg0: i8, %arg1: i8) -> i1 {
  %true = arith.constant true
  %cmp = arith.cmpi "sge", %arg0, %arg1 : i8
  %ncmp = arith.xori %cmp, %true : i1
  return %ncmp : i1
}

func.func @notCmpULT(%arg0: i8, %arg1: i8) -> i1 {
  %true = arith.constant true
  %cmp = arith.cmpi "ult", %arg0, %arg1 : i8
  %ncmp = arith.xori %cmp, %true : i1
  return %ncmp : i1
}

func.func @notCmpULE(%arg0: i8, %arg1: i8) -> i1 {
  %true = arith.constant true
  %cmp = arith.cmpi "ule", %arg0, %arg1 : i8
  %ncmp = arith.xori %cmp, %true : i1
  return %ncmp : i1
}

func.func @notCmpUGT(%arg0: i8, %arg1: i8) -> i1 {
  %true = arith.constant true
  %cmp = arith.cmpi "ugt", %arg0, %arg1 : i8
  %ncmp = arith.xori %cmp, %true : i1
  return %ncmp : i1
}

func.func @notCmpUGE(%arg0: i8, %arg1: i8) -> i1 {
  %true = arith.constant true
  %cmp = arith.cmpi "uge", %arg0, %arg1 : i8
  %ncmp = arith.xori %cmp, %true : i1
  return %ncmp : i1
}

// -----

func.func @xorxor(%cmp : i1) -> i1 {
  %true = arith.constant true
  %ncmp = arith.xori %cmp, %true : i1
  %nncmp = arith.xori %ncmp, %true : i1
  return %nncmp : i1
}

func.func @xorOfExtSI(%arg0: i8, %arg1: i8) -> i64 {
  %ext0 = arith.extsi %arg0 : i8 to i64
  %ext1 = arith.extsi %arg1 : i8 to i64
  %res = arith.xori %ext0, %ext1 : i64
  return %res : i64
}

func.func @xorOfExtUI(%arg0: i8, %arg1: i8) -> i64 {
  %ext0 = arith.extui %arg0 : i8 to i64
  %ext1 = arith.extui %arg1 : i8 to i64
  %res = arith.xori %ext0, %ext1 : i64
  return %res : i64
}

func.func @xorOfExtUI_nneg_both(%arg0: i8, %arg1: i8) -> i64 {
  %ext0 = arith.extui %arg0 nneg : i8 to i64
  %ext1 = arith.extui %arg1 nneg : i8 to i64
  %res = arith.xori %ext0, %ext1 : i64
  return %res : i64
}

func.func @xorOfExtUI_nneg_mixed(%arg0: i8, %arg1: i8) -> i64 {
  %ext0 = arith.extui %arg0 nneg : i8 to i64
  %ext1 = arith.extui %arg1 : i8 to i64
  %res = arith.xori %ext0, %ext1 : i64
  return %res : i64
}

// -----

func.func @xorOfXorConstant(%arg0: i32) -> i32 {
  %c12 = arith.constant 12 : i32
  %c10 = arith.constant 10 : i32
  %x1 = arith.xori %arg0, %c12 : i32
  %x2 = arith.xori %x1, %c10 : i32
  return %x2 : i32
}

// -----

func.func @xorOfXorConstantIndex(%arg0: index) -> index {
  %c12 = arith.constant 12 : index
  %c10 = arith.constant 10 : index
  %x1 = arith.xori %arg0, %c12 : index
  %x2 = arith.xori %x1, %c10 : index
  return %x2 : index
}

// -----

func.func @xorOfXorConstantMultiUse(%arg0: i32) -> (i32, i32) {
  %c12 = arith.constant 12 : i32
  %c10 = arith.constant 10 : i32
  %x1 = arith.xori %arg0, %c12 : i32
  %x2 = arith.xori %x1, %c10 : i32
  return %x1, %x2 : i32, i32
}

// -----

// Negative test case to ensure no further folding is performed when there's a type mismatch between the values and the result.
func.func @nested_xori() -> (i32) {
  %0 = "test.constant"() {value = 0x7fffffff} : () -> i32
  %1 = "test.constant"() {value = -2147483648} : () -> i32
  %2 = "test.constant"() {value = 0x80000000} : () -> i32
  %4 = arith.xori %0, %1 : i32
  %5 = arith.xori %4, %2 : i32
  return %5 : i32
}

// -----

func.func @bitcastSameType(%arg : f32) -> f32 {
  %res = arith.bitcast %arg : f32 to f32
  return %res : f32
}

// -----

func.func @bitcastConstantFPtoI() -> i32 {
  %c0 = arith.constant 0.0 : f32
  %res = arith.bitcast %c0 : f32 to i32
  return %res : i32
}

// -----

func.func @bitcastConstantItoFP() -> f32 {
  %c0 = arith.constant 0 : i32
  %res = arith.bitcast %c0 : i32 to f32
  return %res : f32
}

// -----

func.func @bitcastConstantFPtoFP() -> f16 {
  %c0 = arith.constant 0.0 : bf16
  %res = arith.bitcast %c0 : bf16 to f16
  return %res : f16
}

// -----

func.func @bitcastConstantVecFPtoI() -> vector<3xf32> {
  %c0 = arith.constant dense<0> : vector<3xi32>
  %res = arith.bitcast %c0 : vector<3xi32> to vector<3xf32>
  return %res : vector<3xf32>
}

// -----

func.func @bitcastConstantVecItoFP() -> vector<3xi32> {
  %c0 = arith.constant dense<0.0> : vector<3xf32>
  %res = arith.bitcast %c0 : vector<3xf32> to vector<3xi32>
  return %res : vector<3xi32>
}

// -----

func.func @bitcastConstantVecFPtoFP() -> vector<3xbf16> {
  %c0 = arith.constant dense<0.0> : vector<3xf16>
  %res = arith.bitcast %c0 : vector<3xf16> to vector<3xbf16>
  return %res : vector<3xbf16>
}

// -----

func.func @bitcastBackAndForth(%arg : i32) -> i32 {
  %f = arith.bitcast %arg : i32 to f32
  %res = arith.bitcast %f : f32 to i32
  return %res : i32
}

// -----

func.func @bitcastOfBitcast(%arg : i16) -> i16 {
  %f = arith.bitcast %arg : i16 to f16
  %bf = arith.bitcast %f : f16 to bf16
  %res = arith.bitcast %bf : bf16 to i16
  return %res : i16
}

// -----

func.func @bitcastPoisonItoFP() -> f32 {
  %p = ub.poison : i32
  %res = arith.bitcast %p : i32 to f32
  return %res : f32
}

// -----

func.func @bitcastPoisonFPtoI() -> i32 {
  %p = ub.poison : f32
  %res = arith.bitcast %p : f32 to i32
  return %res : i32
}

// -----

func.func @bitcastChain(%arg: i16) -> f16 {
  %0 = arith.bitcast %arg : i16 to bf16
  %1 = arith.bitcast %0 : bf16 to f16
  return %1 : f16
}

// -----

func.func @test_maxsi(%arg0 : i8) -> (i8, i8, i8, i8) {
  %maxIntCst = arith.constant 127 : i8
  %minIntCst = arith.constant -128 : i8
  %c0 = arith.constant 42 : i8
  %0 = arith.maxsi %arg0, %arg0 : i8
  %1 = arith.maxsi %arg0, %maxIntCst : i8
  %2 = arith.maxsi %arg0, %minIntCst : i8
  %3 = arith.maxsi %arg0, %c0 : i8
  return %0, %1, %2, %3: i8, i8, i8, i8
}

func.func @test_maxsi2(%arg0 : i8) -> (i8, i8, i8, i8) {
  %maxIntCst = arith.constant 127 : i8
  %minIntCst = arith.constant -128 : i8
  %c0 = arith.constant 42 : i8
  %0 = arith.maxsi %arg0, %arg0 : i8
  %1 = arith.maxsi %maxIntCst, %arg0: i8
  %2 = arith.maxsi %minIntCst, %arg0: i8
  %3 = arith.maxsi %c0, %arg0 : i8
  return %0, %1, %2, %3: i8, i8, i8, i8
}

// -----

func.func @test_maxui(%arg0 : i8) -> (i8, i8, i8, i8) {
  %maxIntCst = arith.constant 255 : i8
  %minIntCst = arith.constant 0 : i8
  %c0 = arith.constant 42 : i8
  %0 = arith.maxui %arg0, %arg0 : i8
  %1 = arith.maxui %arg0, %maxIntCst : i8
  %2 = arith.maxui %arg0, %minIntCst : i8
  %3 = arith.maxui %arg0, %c0 : i8
  return %0, %1, %2, %3: i8, i8, i8, i8
}

func.func @test_maxui2(%arg0 : i8) -> (i8, i8, i8, i8) {
  %maxIntCst = arith.constant 255 : i8
  %minIntCst = arith.constant 0 : i8
  %c0 = arith.constant 42 : i8
  %0 = arith.maxui %arg0, %arg0 : i8
  %1 = arith.maxui %maxIntCst, %arg0 : i8
  %2 = arith.maxui %minIntCst, %arg0 : i8
  %3 = arith.maxui %c0, %arg0 : i8
  return %0, %1, %2, %3: i8, i8, i8, i8
}

// -----

func.func @test_minsi(%arg0 : i8) -> (i8, i8, i8, i8) {
  %maxIntCst = arith.constant 127 : i8
  %minIntCst = arith.constant -128 : i8
  %c0 = arith.constant 42 : i8
  %0 = arith.minsi %arg0, %arg0 : i8
  %1 = arith.minsi %arg0, %maxIntCst : i8
  %2 = arith.minsi %arg0, %minIntCst : i8
  %3 = arith.minsi %arg0, %c0 : i8
  return %0, %1, %2, %3: i8, i8, i8, i8
}

func.func @test_minsi2(%arg0 : i8) -> (i8, i8, i8, i8) {
  %maxIntCst = arith.constant 127 : i8
  %minIntCst = arith.constant -128 : i8
  %c0 = arith.constant 42 : i8
  %0 = arith.minsi %arg0, %arg0 : i8
  %1 = arith.minsi %maxIntCst, %arg0 : i8
  %2 = arith.minsi %minIntCst, %arg0 : i8
  %3 = arith.minsi %c0, %arg0 : i8
  return %0, %1, %2, %3: i8, i8, i8, i8
}

// -----

func.func @test_minui(%arg0 : i8) -> (i8, i8, i8, i8) {
  %maxIntCst = arith.constant 255 : i8
  %minIntCst = arith.constant 0 : i8
  %c0 = arith.constant 42 : i8
  %0 = arith.minui %arg0, %arg0 : i8
  %1 = arith.minui %arg0, %maxIntCst : i8
  %2 = arith.minui %arg0, %minIntCst : i8
  %3 = arith.minui %arg0, %c0 : i8
  return %0, %1, %2, %3: i8, i8, i8, i8
}

func.func @test_minui2(%arg0 : i8) -> (i8, i8, i8, i8) {
  %maxIntCst = arith.constant 255 : i8
  %minIntCst = arith.constant 0 : i8
  %c0 = arith.constant 42 : i8
  %0 = arith.minui %arg0, %arg0 : i8
  %1 = arith.minui %maxIntCst, %arg0 : i8
  %2 = arith.minui %minIntCst, %arg0 : i8
  %3 = arith.minui %c0, %arg0 : i8
  return %0, %1, %2, %3: i8, i8, i8, i8
}

// -----

func.func @test_minimumf(%arg0 : f32) -> (f32, f32, f32) {
  %c0 = arith.constant 0.0 : f32
  %inf = arith.constant 0x7F800000 : f32
  %0 = arith.minimumf %c0, %arg0 : f32
  %1 = arith.minimumf %arg0, %arg0 : f32
  %2 = arith.minimumf %inf, %arg0 : f32
  return %0, %1, %2 : f32, f32, f32
}

// -----

func.func @test_maximumf(%arg0 : f32) -> (f32, f32, f32) {
  %c0 = arith.constant 0.0 : f32
  %-inf = arith.constant 0xFF800000 : f32
  %0 = arith.maximumf %c0, %arg0 : f32
  %1 = arith.maximumf %arg0, %arg0 : f32
  %2 = arith.maximumf %-inf, %arg0 : f32
  return %0, %1, %2 : f32, f32, f32
}

// -----

func.func @test_minnumf(%arg0 : f32) -> (f32, f32, f32, f32) {
  %c0 = arith.constant 0.0 : f32
  %inf = arith.constant 0x7F800000 : f32
  %nan = arith.constant 0x7FC00000 : f32
  %0 = arith.minnumf %c0, %arg0 : f32
  %1 = arith.minnumf %arg0, %arg0 : f32
  %2 = arith.minnumf %inf, %arg0 : f32
  %3 = arith.minnumf %nan, %arg0 : f32
  return %0, %1, %2, %3 : f32, f32, f32, f32
}

// -----

func.func @test_maxnumf(%arg0 : f32) -> (f32, f32, f32, f32) {
  %c0 = arith.constant 0.0 : f32
  %-inf = arith.constant 0xFF800000 : f32
  %nan = arith.constant 0x7FC00000 : f32
  %0 = arith.maxnumf %c0, %arg0 : f32
  %1 = arith.maxnumf %arg0, %arg0 : f32
  %2 = arith.maxnumf %-inf, %arg0 : f32
  %3 = arith.maxnumf %nan, %arg0 : f32
  return %0, %1, %2, %3 : f32, f32, f32, f32
}

// -----

func.func @test_addf(%arg0 : f32) -> (f32, f32, f32, f32) {
  %c0 = arith.constant 0.0 : f32
  %c-0 = arith.constant -0.0 : f32
  %c1 = arith.constant 1.0 : f32
  %0 = arith.addf %c0, %arg0 : f32
  %1 = arith.addf %arg0, %c-0 : f32
  %2 = arith.addf %c-0, %arg0 : f32
  %3 = arith.addf %c1, %c1 : f32
  return %0, %1, %2, %3 : f32, f32, f32, f32
}

// -----

func.func @test_subf(%arg0 : f16) -> (f16, f16, f16) {
  %c0 = arith.constant 0.0 : f16
  %c-0 = arith.constant -0.0 : f16
  %c1 = arith.constant 1.0 : f16
  %0 = arith.subf %arg0, %c0 : f16
  %1 = arith.subf %arg0, %c-0 : f16
  %2 = arith.subf %c0, %c1 : f16
  return %0, %1, %2 : f16, f16, f16
}

func.func @test_subf_negzero(%arg0 : f16) -> f16 {
  %c-0 = arith.constant -0.0 : f16
  %0 = arith.subf %c-0, %arg0 : f16
  return %0 : f16
}

// subf(+0, x) must NOT fold to negf(x)
func.func @test_subf_poszero_no_negf(%arg0 : f16) -> f16 {
  %c0 = arith.constant 0.0 : f16
  %0 = arith.subf %c0, %arg0 : f16
  return %0 : f16
}

func.func @test_subf_negzero_splat(%arg0 : vector<4xf32>) -> vector<4xf32> {
  %c-0 = arith.constant dense<-0.0> : vector<4xf32>
  %0 = arith.subf %c-0, %arg0 : vector<4xf32>
  return %0 : vector<4xf32>
}

// -----

func.func @test_mulf(%arg0 : f32) -> (f32, f32, f32, f32) {
  %c1 = arith.constant 1.0 : f32
  %c2 = arith.constant 2.0 : f32
  %0 = arith.mulf %c2, %arg0 : f32
  %1 = arith.mulf %arg0, %c1 : f32
  %2 = arith.mulf %c1, %arg0 : f32
  %3 = arith.mulf %c2, %c2 : f32
  return %0, %1, %2, %3 : f32, f32, f32, f32
}

func.func @test_mulf1(%arg0 : f32, %arg1 : f32) -> (f32) {
  %0 = arith.negf %arg0 : f32
  %1 = arith.negf %arg1 : f32
  %2 = arith.mulf %0, %1 : f32
  return %2 : f32
}

func.func @test_mulf2(%arg0 : f32) -> (f32, f32) {
  %c0 = arith.constant 0.0 : f32
  %c0n = arith.constant -0.0 : f32
  %0 = arith.mulf %c0, %arg0 fastmath<nnan,nsz> : f32
  %1 = arith.mulf %c0n, %arg0 fastmath<nnan,nsz> : f32
  return %0, %1 : f32, f32
}

// -----

func.func @test_divf(%arg0 : f64) -> (f64, f64) {
  %c1 = arith.constant 1.0 : f64
  %c2 = arith.constant 2.0 : f64
  %0 = arith.divf %arg0, %c1 : f64
  %1 = arith.divf %c1, %c2 : f64
  return %0, %1 : f64, f64
}

func.func @test_divf1(%arg0 : f32, %arg1 : f32) -> (f32) {
  %0 = arith.negf %arg0 : f32
  %1 = arith.negf %arg1 : f32
  %2 = arith.divf %0, %1 : f32
  return %2 : f32
}

// -----

// Verify that constant folding respects rounding modes. 1.0000001 + 1.0 is not
// exactly representable in f32. With upward rounding, the result is rounded up,
// and with downward rounding it is rounded down.
func.func @test_addf_rounding_mode(%arg0 : f32) -> (f32, f32, f32) {
  %a = arith.constant 1.0000001 : f32
  %b = arith.constant 1.0 : f32
  // addf(x, -0) folds even with a rounding mode.
  %c_neg0 = arith.constant -0.0 : f32
  %0 = arith.addf %arg0, %c_neg0 to_nearest_even : f32
  %1 = arith.addf %a, %b upward : f32
  %2 = arith.addf %a, %b downward : f32
  return %0, %1, %2 : f32, f32, f32
}

// -----

func.func @test_subf_rounding_mode(%arg0 : f32) -> (f32, f32, f32, f32) {
  %a = arith.constant 1.0000001 : f32
  %b = arith.constant -1.0 : f32
  // subf(x, +0) folds even with a rounding mode.
  %c0 = arith.constant 0.0 : f32
  %0 = arith.subf %arg0, %c0 downward : f32
  %1 = arith.subf %a, %b upward : f32
  %2 = arith.subf %a, %b downward : f32
  // subf(-0, x) must NOT fold to negf when a custom rounding mode is set.
  %c-0 = arith.constant -0.0 : f32
  %3 = arith.subf %c-0, %arg0 downward : f32
  return %0, %1, %2, %3 : f32, f32, f32, f32
}

// -----

func.func @test_mulf_rounding_mode(%arg0 : f32) -> (f32, f32, f32) {
  %a = arith.constant 1.0000001 : f32
  %b = arith.constant 3.0 : f32
  // mulf(x, 1) folds even with a rounding mode.
  %c1 = arith.constant 1.0 : f32
  %0 = arith.mulf %arg0, %c1 upward : f32
  %1 = arith.mulf %a, %b upward : f32
  %2 = arith.mulf %a, %b downward : f32
  return %0, %1, %2 : f32, f32, f32
}

// -----

func.func @test_divf_rounding_mode(%arg0 : f32) -> (f32, f32, f32) {
  %a = arith.constant 1.0 : f32
  %b = arith.constant 3.0 : f32
  // divf(x, 1) folds even with a rounding mode.
  %c1 = arith.constant 1.0 : f32
  %0 = arith.divf %arg0, %c1 toward_zero : f32
  %1 = arith.divf %a, %b upward : f32
  %2 = arith.divf %a, %b downward : f32
  return %0, %1, %2 : f32, f32, f32
}

// -----

func.func @fold_divui_of_muli_0(%arg0 : index, %arg1 : index) -> index {
  %0 = arith.muli %arg0, %arg1 overflow<nuw> : index
  %1 = arith.divui %0, %arg0 : index
  return %1 : index
}

func.func @fold_divui_of_muli_1(%arg0 : index, %arg1 : index) -> index {
  %0 = arith.muli %arg0, %arg1 overflow<nuw> : index
  %1 = arith.divui %0, %arg1 : index
  return %1 : index
}

func.func @fold_divsi_of_muli_0(%arg0 : index, %arg1 : index) -> index {
  %0 = arith.muli %arg0, %arg1 overflow<nsw> : index
  %1 = arith.divsi %0, %arg0 : index
  return %1 : index
}

func.func @fold_divsi_of_muli_1(%arg0 : index, %arg1 : index) -> index {
  %0 = arith.muli %arg0, %arg1 overflow<nsw> : index
  %1 = arith.divsi %0, %arg1 : index
  return %1 : index
}

// Do not fold divui(mul(a, v), v) -> a with nuw attribute.
func.func @no_fold_divui_of_muli(%arg0 : index, %arg1 : index) -> index {
  %0 = arith.muli %arg0, %arg1 : index
  %1 = arith.divui %0, %arg0 : index
  return %1 : index
}

// Do not fold divsi(mul(a, v), v) -> a with nuw attribute.
func.func @no_fold_divsi_of_muli(%arg0 : index, %arg1 : index) -> index {
  %0 = arith.muli %arg0, %arg1 : index
  %1 = arith.divsi %0, %arg0 : index
  return %1 : index
}

// -----

func.func @test_cmpf(%arg0 : f32) -> (i1, i1, i1, i1) {
  %nan = arith.constant 0x7fffffff : f32
  %0 = arith.cmpf olt, %nan, %arg0 : f32
  %1 = arith.cmpf olt, %arg0, %nan : f32
  %2 = arith.cmpf ugt, %nan, %arg0 : f32
  %3 = arith.cmpf ugt, %arg0, %nan : f32
  return %0, %1, %2, %3 : i1, i1, i1, i1
}

// -----

func.func @constant_FPtoUI() -> i32 {
  %c0 = arith.constant 2.0 : f32
  %res = arith.fptoui %c0 : f32 to i32
  return %res : i32
}

func.func @constant_FPtoUI_splat() -> vector<4xi32> {
  %c0 = arith.constant 2.0 : f32
  %splat = vector.broadcast %c0 : f32 to vector<4xf32>
  %res = arith.fptoui %splat : vector<4xf32> to vector<4xi32>
  return %res : vector<4xi32>
}

func.func @constant_FPtoUI_vector() -> vector<4xi32> {
  %vector = arith.constant dense<[1.0, 3.0, 5.0, 7.0]> : vector<4xf32>
  %res = arith.fptoui %vector : vector<4xf32> to vector<4xi32>
  return %res : vector<4xi32>
}

// -----
func.func @invalid_constant_FPtoUI() -> i32 {
  %c0 = arith.constant -2.0 : f32
  %res = arith.fptoui %c0 : f32 to i32
  return %res : i32
}

// -----
func.func @constant_FPtoSI() -> i32 {
  %c0 = arith.constant -2.0 : f32
  %res = arith.fptosi %c0 : f32 to i32
  return %res : i32
}

func.func @constant_FPtoSI_splat() -> vector<4xi32> {
  %c0 = arith.constant -2.0 : f32
  %splat = vector.broadcast %c0 : f32 to vector<4xf32>
  %res = arith.fptosi %splat : vector<4xf32> to vector<4xi32>
  return %res : vector<4xi32>
}

func.func @constant_FPtoSI_vector() -> vector<4xi32> {
  %vector = arith.constant dense<[-1.0, -3.0, -5.0, -7.0]> : vector<4xf32>
  %res = arith.fptosi %vector : vector<4xf32> to vector<4xi32>
  return %res : vector<4xi32>
}

// -----
func.func @invalid_constant_FPtoSI() -> i8 {
  %c0 = arith.constant 2.0e10 : f32
  %res = arith.fptosi %c0 : f32 to i8
  return %res : i8
}

func.func @constant_SItoFP() -> f32 {
  %c0 = arith.constant -2 : i32
  %res = arith.sitofp %c0 : i32 to f32
  return %res : f32
}

func.func @constant_SItoFP_splat() -> vector<4xf32> {
  %c0 = arith.constant 2 : i32
  %splat = vector.broadcast %c0 : i32 to vector<4xi32>
  %res = arith.sitofp %splat : vector<4xi32> to vector<4xf32>
  return %res : vector<4xf32>
}

func.func @constant_SItoFP_vector() -> vector<4xf32> {
  %vector = arith.constant dense<[1, 3, 5, 7]> : vector<4xi32>
  %res = arith.sitofp %vector : vector<4xi32> to vector<4xf32>
  return %res : vector<4xf32>
}

// -----
func.func @constant_UItoFP() -> f32 {
  %c0 = arith.constant 2 : i32
  %res = arith.uitofp %c0 : i32 to f32
  return %res : f32
}

func.func @constant_UItoFP_splat() -> vector<4xf32> {
  %c0 = arith.constant 2 : i32
  %splat = vector.broadcast %c0 : i32 to vector<4xi32>
  %res = arith.uitofp %splat : vector<4xi32> to vector<4xf32>
  return %res : vector<4xf32>
}

func.func @constant_UItoFP_vector() -> vector<4xf32> {
  %vector = arith.constant dense<[1, 3, 5, 7]> : vector<4xi32>
  %res = arith.uitofp %vector : vector<4xi32> to vector<4xf32>
  return %res : vector<4xf32>
}

// -----

// Tests rewritten from https://github.com/llvm/llvm-project/blob/main/llvm/test/Transforms/InstCombine/2008-11-08-FCmp.ll
// When inst combining an FCMP with the LHS coming from a arith.uitofp instruction, we
// can lower it to signed ICMP instructions.

func.func @test1(%arg0: i32) -> i1 {
  %cst = arith.constant 0.000000e+00 : f64
  %1 = arith.uitofp %arg0: i32 to f64
  %2 = arith.cmpf ole, %1, %cst : f64
  return %2 : i1
}

func.func @test2(%arg0: i32) -> i1 {
  %cst = arith.constant 0.000000e+00 : f64
  %1 = arith.uitofp %arg0: i32 to f64
  %2 = arith.cmpf olt, %1, %cst : f64
  return %2 : i1
}

func.func @test3(%arg0: i32) -> i1 {
  %cst = arith.constant 0.000000e+00 : f64
  %1 = arith.uitofp %arg0: i32 to f64
  %2 = arith.cmpf oge, %1, %cst : f64
  return %2 : i1
}

func.func @test4(%arg0: i32) -> i1 {
  %cst = arith.constant 0.000000e+00 : f64
  %1 = arith.uitofp %arg0: i32 to f64
  %2 = arith.cmpf ogt, %1, %cst : f64
  return %2 : i1
}

func.func @test5(%arg0: i32) -> i1 {
  %cst = arith.constant -4.400000e+00 : f64
  %1 = arith.uitofp %arg0: i32 to f64
  %2 = arith.cmpf ogt, %1, %cst : f64
  return %2 : i1
}

func.func @test6(%arg0: i32) -> i1 {
  %cst = arith.constant -4.400000e+00 : f64
  %1 = arith.uitofp %arg0: i32 to f64
  %2 = arith.cmpf olt, %1, %cst : f64
  return %2 : i1
}

// Check that optimizing unsigned >= comparisons correctly distinguishes
// positive and negative constants.
func.func @test7(%arg0: i32) -> i1 {
  %cst = arith.constant 3.200000e+00 : f64
  %1 = arith.uitofp %arg0: i32 to f64
  %2 = arith.cmpf oge, %1, %cst : f64
  return %2 : i1
}

// -----

func.func @foldShl() -> i64 {
  %c1 = arith.constant 1 : i64
  %c32 = arith.constant 32 : i64
  %r = arith.shli %c1, %c32 : i64
  return %r : i64
}

func.func @nofoldShl() -> i64 {
  %c1 = arith.constant 1 : i64
  %c132 = arith.constant 132 : i64
  %r = arith.shli %c1, %c132 : i64
  return %r : i64
}

func.func @nofoldShl2() -> i64 {
  %c1 = arith.constant 1 : i64
  %cm32 = arith.constant -32 : i64
  %r = arith.shli %c1, %cm32 : i64
  return %r : i64
}

func.func @nofoldShl3() -> i64 {
  %c1 = arith.constant 1 : i64
  %c64 = arith.constant 64 : i64
  // Note that this should return Poison in the future.
  %r = arith.shli %c1, %c64 : i64
  return %r : i64
}

func.func @foldShru() -> i64 {
  %c1 = arith.constant 8 : i64
  %c32 = arith.constant 2 : i64
  %r = arith.shrui %c1, %c32 : i64
  return %r : i64
}

func.func @foldShru2() -> i64 {
  %c1 = arith.constant -2 : i64
  %c32 = arith.constant 1 : i64
  %r = arith.shrui %c1, %c32 : i64
  return %r : i64
}

func.func @nofoldShru() -> i64 {
  %c1 = arith.constant 8 : i64
  %c132 = arith.constant 132 : i64
  %r = arith.shrui %c1, %c132 : i64
  return %r : i64
}

func.func @nofoldShru2() -> i64 {
  %c1 = arith.constant 8 : i64
  %cm32 = arith.constant -32 : i64
  %r = arith.shrui %c1, %cm32 : i64
  return %r : i64
}

func.func @nofoldShru3() -> i64 {
  %c1 = arith.constant 8 : i64
  %c64 = arith.constant 64 : i64
  // Note that this should return Poison in the future.
  %r = arith.shrui %c1, %c64 : i64
  return %r : i64
}

func.func @foldShrs() -> i64 {
  %c1 = arith.constant 8 : i64
  %c32 = arith.constant 2 : i64
  %r = arith.shrsi %c1, %c32 : i64
  return %r : i64
}

func.func @foldShrs2() -> i64 {
  %c1 = arith.constant -2 : i64
  %c32 = arith.constant 1 : i64
  %r = arith.shrsi %c1, %c32 : i64
  return %r : i64
}

func.func @nofoldShrs() -> i64 {
  %c1 = arith.constant 8 : i64
  %c132 = arith.constant 132 : i64
  %r = arith.shrsi %c1, %c132 : i64
  return %r : i64
}

func.func @nofoldShrs2() -> i64 {
  %c1 = arith.constant 8 : i64
  %cm32 = arith.constant -32 : i64
  %r = arith.shrsi %c1, %cm32 : i64
  return %r : i64
}

func.func @nofoldShrs3() -> i64 {
  %c1 = arith.constant 8 : i64
  %c64 = arith.constant 64 : i64
  // Note that this should return Poison in the future.
  %r = arith.shrsi %c1, %c64 : i64
  return %r : i64
}

// -----

func.func @test_negf() -> (f32) {
  %c = arith.constant 2.0 : f32
  %0 = arith.negf %c : f32
  return %0: f32
}

func.func @test_negf1(%f : f32) -> (f32) {
  %0 = arith.negf %f : f32
  %1 = arith.negf %0 : f32
  return %1: f32
}

// -----

func.func @test_flush_denormals_const() -> (f32) {
  %c = arith.constant 1.0e-40 : f32
  %0 = arith.flush_denormals %c : f32
  return %0 : f32
}

// -----

func.func @test_flush_denormals_idempotent(%f : f32) -> (f32) {
  %0 = arith.flush_denormals %f : f32
  %1 = arith.flush_denormals %0 : f32
  return %1 : f32
}

// -----

func.func @test_remui() -> (vector<4xi32>) {
  %v1 = arith.constant dense<[9, 9, 9, 9]> : vector<4xi32>
  %v2 = arith.constant dense<[1, 3, 5, 7]> : vector<4xi32>
  %0 = arith.remui %v1, %v2 : vector<4xi32>
  return %0 : vector<4xi32>
}

// // -----

func.func @test_remui_1(%arg : vector<4xi32>) -> (vector<4xi32>) {
  %v = arith.constant dense<[1, 1, 1, 1]> : vector<4xi32>
  %0 = arith.remui %arg, %v : vector<4xi32>
  return %0 : vector<4xi32>
}

// -----

func.func @test_remsi() -> (vector<4xi32>) {
  %v1 = arith.constant dense<[9, 9, 9, 9]> : vector<4xi32>
  %v2 = arith.constant dense<[1, 3, 5, 7]> : vector<4xi32>
  %0 = arith.remsi %v1, %v2 : vector<4xi32>
  return %0 : vector<4xi32>
}

// // -----

func.func @test_remsi_1(%arg : vector<4xi32>) -> (vector<4xi32>) {
  %v = arith.constant dense<[1, 1, 1, 1]> : vector<4xi32>
  %0 = arith.remsi %arg, %v : vector<4xi32>
  return %0 : vector<4xi32>
}

// -----

func.func @test_remf() -> (f32) {
  %v1 = arith.constant 3.0 : f32
  %v2 = arith.constant 2.0 : f32
  %0 = arith.remf %v1, %v2 : f32
  return %0 : f32
}

func.func @test_remf2() -> (f32, f32) {
  %v1 = arith.constant 3.0 : f32
  %v2 = arith.constant -2.0 : f32
  %v3 = arith.constant -3.0 : f32
  %0 = arith.remf %v1, %v2 : f32
  %1 = arith.remf %v3, %v2 : f32
  return %0, %1 : f32, f32
}

func.func @test_remf_vec() -> (vector<4xf32>) {
  %v1 = arith.constant dense<[1.0, 2.0, -3.0, 4.0]> : vector<4xf32>
  %v2 = arith.constant dense<[2.0, 2.0, 2.0, 2.0]> : vector<4xf32>
  %0 = arith.remf %v1, %v2 : vector<4xf32>
  return %0 : vector<4xf32>
}

// -----


func.func @test_andi_not_fold_rhs(%arg0 : index) -> index {
    %0 = arith.constant -1 : index
    %1 = arith.xori %arg0, %0 : index
    %2 = arith.andi %arg0, %1 : index
    return %2 : index
}



func.func @test_andi_not_fold_lhs(%arg0 : index) -> index {
    %0 = arith.constant -1 : index
    %1 = arith.xori %arg0, %0 : index
    %2 = arith.andi %1, %arg0 : index
    return %2 : index
}

// -----


func.func @test_andi_not_fold_rhs_vec(%arg0 : vector<2xi32>) -> vector<2xi32> {
    %0 = arith.constant dense<[-1, -1]> : vector<2xi32>
    %1 = arith.xori %arg0, %0 : vector<2xi32>
    %2 = arith.andi %arg0, %1 : vector<2xi32>
    return %2 : vector<2xi32>
}



func.func @test_andi_not_fold_lhs_vec(%arg0 : vector<2xi32>) -> vector<2xi32> {
    %0 = arith.constant dense<[-1, -1]> : vector<2xi32>
    %1 = arith.xori %arg0, %0 : vector<2xi32>
    %2 = arith.andi %1, %arg0 : vector<2xi32>
    return %2 : vector<2xi32>
}

// -----
/// xor(xor(x, a), a) -> x

func.func @xorxor0(%a : i32, %b : i32) -> i32 {
  %c = arith.xori %a, %b : i32
  %res = arith.xori %c, %b : i32
  return %res : i32
}

// -----
/// xor(xor(a, x), a) -> x

func.func @xorxor1(%a : i32, %b : i32) -> i32 {
  %c = arith.xori %b, %a : i32
  %res = arith.xori %c, %b : i32
  return %res : i32
}

// -----
/// xor(a, xor(x, a)) -> x

func.func @xorxor2(%a : i32, %b : i32) -> i32 {
  %c = arith.xori %a, %b : i32
  %res = arith.xori %b, %c : i32
  return %res : i32
}

// -----
/// xor(a, xor(a, x)) -> x

func.func @xorxor3(%a : i32, %b : i32) -> i32 {
  %c = arith.xori %b, %a : i32
  %res = arith.xori %b, %c : i32
  return %res : i32
}

// -----

/// and(a, and(a, b)) -> and(a, b)

func.func @andand0(%a : i32, %b : i32) -> i32 {
  %c = arith.andi %a, %b : i32
  %res = arith.andi %a, %c : i32
  return %res : i32
}

func.func @andand1(%a : i32, %b : i32) -> i32 {
  %c = arith.andi %a, %b : i32
  %res = arith.andi %c, %a : i32
  return %res : i32
}

func.func @andand2(%a : i32, %b : i32) -> i32 {
  %c = arith.andi %a, %b : i32
  %res = arith.andi %b, %c : i32
  return %res : i32
}

func.func @andand3(%a : i32, %b : i32) -> i32 {
  %c = arith.andi %a, %b : i32
  %res = arith.andi %c, %b : i32
  return %res : i32
}

// -----

func.func @truncIShrSIToTrunciShrUI(%a: i64) -> i32 {
  %c32 = arith.constant 32: i64
  %sh = arith.shrsi %a, %c32 : i64
  %hi = arith.trunci %sh: i64 to i32
  return %hi : i32
}

func.func @truncIShrSIExactToTrunciShrUIExact(%a: i64) -> i32 {
  %c32 = arith.constant 32: i64
  %sh = arith.shrsi %a, %c32 exact : i64
  %hi = arith.trunci %sh: i64 to i32
  return %hi : i32
}

func.func @truncIShrSIToTrunciShrUIBadShiftAmt1(%a: i64) -> i32 {
  %c33 = arith.constant 33: i64
  %sh = arith.shrsi %a, %c33 : i64
  %hi = arith.trunci %sh: i64 to i32
  return %hi : i32
}

func.func @truncIShrSIToTrunciShrUIBadShiftAmt2(%a: i64) -> i32 {
  %c31 = arith.constant 31: i64
  %sh = arith.shrsi %a, %c31 : i64
  %hi = arith.trunci %sh: i64 to i32
  return %hi : i32
}

func.func @foldShli0(%x : i64) -> i64 {
  %c0 = arith.constant 0 : i64
  %r = arith.shli %x, %c0 : i64
  return %r : i64
}

func.func @foldShrui0(%x : i64) -> i64 {
  %c0 = arith.constant 0 : i64
  %r = arith.shrui %x, %c0 : i64
  return %r : i64
}

func.func @foldShrsi0(%x : i64) -> i64 {
  %c0 = arith.constant 0 : i64
  %r = arith.shrsi %x, %c0 : i64
  return %r : i64
}

func.func @foldOrXor1(%arg0: i1) -> i1 {
  %0 = arith.constant true
  %1 = arith.xori %arg0, %0 : i1
  %2 = arith.ori %arg0, %1 : i1
  return %2 : i1
}

func.func @foldOrXor2(%arg0: i1) -> i1 {
  %0 = arith.constant true
  %1 = arith.xori %0, %arg0 : i1
  %2 = arith.ori %arg0, %1 : i1
  return %2 : i1
}

func.func @foldOrXor3(%arg0: i1) -> i1 {
  %0 = arith.constant true
  %1 = arith.xori %arg0, %0 : i1
  %2 = arith.ori %1, %arg0 : i1
  return %2 : i1
}

func.func @foldOrXor4(%arg0: i1) -> i1 {
  %0 = arith.constant true
  %1 = arith.xori %0, %arg0 : i1
  %2 = arith.ori %1, %arg0 : i1
  return %2 : i1
}

func.func @foldOrXor5(%arg0: i32) -> i32 {
  %0 = arith.constant -1 : i32
  %1 = arith.xori %arg0, %0 : i32
  %2 = arith.ori %arg0, %1 : i32
  return %2 : i32
}

func.func @foldOrXor6(%arg0: index) -> index {
  %0 = arith.constant -1 : index
  %1 = arith.xori %arg0, %0 : index
  %2 = arith.ori %arg0, %1 : index
  return %2 : index
}

func.func @selectOfPoison(%cond : i1, %arg: i32) -> (i32, i32, i32, i32) {
  %poison = ub.poison : i32
  %select1 = arith.select %cond, %poison, %arg : i32
  %select2 = arith.select %cond, %arg, %poison : i32

  // Check that constant folding is applied prior to poison handling.
  %true = arith.constant true
  %false = arith.constant false
  %select3 = arith.select %true, %poison, %arg : i32
  %select4 = arith.select %false, %poison, %arg : i32
  return %select1, %select2, %select3, %select4 : i32, i32, i32, i32
}

func.func @addi_poison1(%arg: i32) -> i32 {
  %0 = ub.poison : i32
  %1 = arith.addi %0, %arg : i32
  return %1 : i32
}

func.func @addi_poison2(%arg: i32) -> i32 {
  %0 = ub.poison : i32
  %1 = arith.addi %arg, %0 : i32
  return %1 : i32
}

func.func @addf_poison1(%arg: f32) -> f32 {
  %0 = ub.poison : f32
  %1 = arith.addf %0, %arg : f32
  return %1 : f32
}

func.func @addf_poison2(%arg: f32) -> f32 {
  %0 = ub.poison : f32
  %1 = arith.addf %arg, %0 : f32
  return %1 : f32
}


func.func @negf_poison() -> f32 {
  %0 = ub.poison : f32
  %1 = arith.negf %0 : f32
  return %1 : f32
}

func.func @extsi_poison() -> i64 {
  %0 = ub.poison : i32
  %1 = arith.extsi %0 : i32 to i64
  return %1 : i64
}

// Just checks that this doesn't crash.
func.func @unsignedExtendConstantResource() -> tensor<i16> {
  %c2 = arith.constant dense_resource<blob1> : tensor<i8>
  %ext = arith.extui %c2 : tensor<i8> to tensor<i16>
  return %ext : tensor<i16>
}

func.func @sequences_fastmath_contract(%arg0: bf16) -> bf16 {
  %0 = arith.extf %arg0 fastmath<contract> : bf16 to f32
  %1 = math.absf %0 : f32
  %2 = arith.truncf %1 fastmath<contract> : f32 to bf16
  %3 = arith.extf %2 fastmath<contract> : bf16 to f32
  %4 = math.sin %3 : f32
  %5 = arith.truncf %4 fastmath<contract> : f32 to bf16
  return %5 : bf16
}

func.func @sequences_no_fastmath(%arg0: bf16) -> bf16 {
  %0 = arith.extf %arg0 : bf16 to f32
  %1 = math.absf %0 : f32
  %2 = arith.truncf %1 : f32 to bf16
  %3 = arith.extf %2 : bf16 to f32
  %4 = math.sin %3 : f32
  %5 = arith.truncf %4 : f32 to bf16
  return %5 : bf16
}

func.func @eliminate_cast_to_f16(%arg0: f32) -> f32 {
  %0 = arith.truncf %arg0 fastmath<contract> : f32 to f16
  %1 = arith.extf %0 fastmath<contract> : f16 to f32
  return %1 : f32
}

func.func @eliminate_cast_to_bf16(%arg0: f32) -> f32 {
  %0 = arith.truncf %arg0 fastmath<contract> : f32 to bf16
  %1 = arith.extf %0 fastmath<contract> : bf16 to f32
  return %1 : f32
}

func.func @bf16_sin_vector(%arg0: vector<32x32x32xbf16>) -> vector<32x32x32xbf16> {
  %0 = arith.extf %arg0 fastmath<contract> : vector<32x32x32xbf16> to vector<32x32x32xf32>
  %1 = math.absf %0 : vector<32x32x32xf32>
  %2 = arith.truncf %1 fastmath<contract> : vector<32x32x32xf32> to vector<32x32x32xbf16>
  %3 = arith.extf %2 fastmath<contract> : vector<32x32x32xbf16> to vector<32x32x32xf32>
  %4 = math.sin %3 : vector<32x32x32xf32>
  %5 = arith.truncf %4 fastmath<contract> : vector<32x32x32xf32> to vector<32x32x32xbf16>
  return %5 : vector<32x32x32xbf16>
}

func.func @f16_sin_vector(%arg0: vector<32x32x32xf16>) -> vector<32x32x32xf16> {
  %0 = arith.extf %arg0 fastmath<contract> : vector<32x32x32xf16> to vector<32x32x32xf32>
  %1 = math.absf %0 : vector<32x32x32xf32>
  %2 = arith.truncf %1 fastmath<contract> : vector<32x32x32xf32> to vector<32x32x32xf16>
  %3 = arith.extf %2 fastmath<contract> : vector<32x32x32xf16> to vector<32x32x32xf32>
  %4 = math.sin %3 : vector<32x32x32xf32>
  %5 = arith.truncf %4 fastmath<contract> : vector<32x32x32xf32> to vector<32x32x32xf16>
  return %5 : vector<32x32x32xf16>
}

func.func @bf16_branch_vector(%arg0: vector<32x32x32xbf16>) -> vector<32x32x32xbf16> {
  %0 = arith.extf %arg0 fastmath<contract> : vector<32x32x32xbf16> to vector<32x32x32xf32>
  %1 = math.absf %0 : vector<32x32x32xf32>
  %2 = arith.truncf %1 fastmath<contract> : vector<32x32x32xf32> to vector<32x32x32xbf16>
  %3 = arith.extf %2 fastmath<contract> : vector<32x32x32xbf16> to vector<32x32x32xf32>
  %4 = math.sin %3 : vector<32x32x32xf32>
  %5 = arith.truncf %4 fastmath<contract> : vector<32x32x32xf32> to vector<32x32x32xbf16>
  %6 = arith.extf %5 fastmath<contract> : vector<32x32x32xbf16> to vector<32x32x32xf32>
  %7 = math.cos %3 : vector<32x32x32xf32>
  %8 = arith.truncf %7 fastmath<contract> : vector<32x32x32xf32> to vector<32x32x32xbf16>
  %9 = arith.extf %8 fastmath<contract> : vector<32x32x32xbf16> to vector<32x32x32xf32>
  %10 = arith.addf %6, %9 : vector<32x32x32xf32>
  %11 = arith.truncf %10 fastmath<contract> : vector<32x32x32xf32> to vector<32x32x32xbf16>
  return %11 : vector<32x32x32xbf16>
}

func.func @bf16_fma(%arg0: vector<32x32x32xbf16>, %arg1: vector<32x32x32xbf16>, %arg2: vector<32x32x32xbf16>) -> vector<32x32x32xbf16> {
  %0 = arith.extf %arg0 fastmath<contract> : vector<32x32x32xbf16> to vector<32x32x32xf32>
  %1 = math.absf %0 : vector<32x32x32xf32>
  %2 = arith.truncf %1 fastmath<contract> : vector<32x32x32xf32> to vector<32x32x32xbf16>
  %3 = arith.extf %2 fastmath<contract> : vector<32x32x32xbf16> to vector<32x32x32xf32>
  %4 = math.sin %3 : vector<32x32x32xf32>
  %5 = arith.truncf %4 fastmath<contract> : vector<32x32x32xf32> to vector<32x32x32xbf16>
  %6 = arith.extf %5 fastmath<contract> : vector<32x32x32xbf16> to vector<32x32x32xf32>
  %7 = math.fma %5, %arg1, %arg2 : vector<32x32x32xbf16>
  %8 = arith.extf %7 fastmath<contract> : vector<32x32x32xbf16> to vector<32x32x32xf32>
  %9 = arith.addf %8, %6 : vector<32x32x32xf32>
  %10 = arith.truncf %9 fastmath<contract> : vector<32x32x32xf32> to vector<32x32x32xbf16>
  return %10 : vector<32x32x32xbf16>
}

{-#
  dialect_resources: {
    builtin: {
      // Note: This is just copied blob, the actual value isn't used or checked.
      blob1: "0x08000000010000000000000002000000000000000300000000000000"
    }
  }
#-}

func.func @unreachable() {
  return
^unreachable:
  %c1_i64 = arith.constant 1 : i64
  // This self referencing operation is legal in an unreachable block.
  // Many patterns are unsafe with respect to this kind of situation,
  // check that we don't infinite loop here.
  %add = arith.addi %add, %c1_i64 : i64
  cf.br ^unreachable
}

// -----

// Verify that cmpi with dynamic-shaped tensors does not crash during folding.
// The fold cannot create a DenseElementsAttr for dynamic shapes.
func.func @cmpi_dynamic_shape_no_fold(%arg0: tensor<?xi32>) -> tensor<?xi1> {
  %0 = arith.cmpi eq, %arg0, %arg0 : tensor<?xi32>
  return %0 : tensor<?xi1>
}

// -----

// arith.truncf of infinity to a FiniteOnly float type (f4E2M1FN) must not fold,
// since the type has no infinity representation. Previously this would crash
// inside APFloat::convert with llvm_unreachable("semantics don't support inf!").

func.func @truncf_inf_to_finite_only_no_fold() -> f4E2M1FN {
  %inf = arith.constant 0x7F800000 : f32
  %result = arith.truncf %inf : f32 to f4E2M1FN
  return %result : f4E2M1FN
}

// -----

// arith.truncf of negative infinity to a FiniteOnly float type must not fold.

func.func @truncf_neg_inf_to_finite_only_no_fold() -> f4E2M1FN {
  %neg_inf = arith.constant 0xFF800000 : f32
  %result = arith.truncf %neg_inf : f32 to f4E2M1FN
  return %result : f4E2M1FN
}

// -----

func.func @convertf_fold_f8() -> f8E5M2 {
  %c = arith.constant 2.0 : f8E4M3FN
  %result = arith.convertf %c : f8E4M3FN to f8E5M2
  return %result : f8E5M2
}
