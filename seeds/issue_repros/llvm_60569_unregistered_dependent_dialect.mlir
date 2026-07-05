// Source: https://github.com/llvm/llvm-project/issues/60569
// Command from issue:
// mlir-opt -allow-unregistered-dialect -test-rewrite-dynamic-op test-rewrite-dynamic-op.mlir
func.func @rewrite_dynamic_op(%arg0: i32) {
  %0:2 = "test.dynamic_one_operand_two_results"(%arg0) : (i32) -> (i32, i32)
  return
}
