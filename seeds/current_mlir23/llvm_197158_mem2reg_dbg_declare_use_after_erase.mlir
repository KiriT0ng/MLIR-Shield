#di_basic_type = #llvm.di_basic_type<tag = DW_TAG_base_type, name = "double", sizeInBits = 64>
#di_file = #llvm.di_file<"repro.ll" in "">
#di_compile_unit = #llvm.di_compile_unit<id = distinct[0]<>, sourceLanguage = DW_LANG_C_plus_plus_14, file = #di_file, producer = "clang", isOptimized = false, emissionKind = Full>
#di_subprogram = #llvm.di_subprogram<compileUnit = #di_compile_unit, scope = #di_file, name = "foo", linkageName = "foo", file = #di_file, line = 1, subprogramFlags = Definition>
#di_local_variable = #llvm.di_local_variable<scope = #di_subprogram, name = "d", file = #di_file, line = 2, type = #di_basic_type>
llvm.func @foo() {
  %one = llvm.mlir.constant(1 : i32) : i32
  %cst = llvm.mlir.constant(4.000000e+00 : f64) : f64
  %p = llvm.alloca %one x f64 : (i32) -> !llvm.ptr
  llvm.intr.dbg.declare #di_local_variable = %p : !llvm.ptr
  llvm.store %cst, %p : f64, !llvm.ptr
  %v = llvm.load %p : !llvm.ptr -> f64
  llvm.store %v, %p : f64, !llvm.ptr
  llvm.return
}
