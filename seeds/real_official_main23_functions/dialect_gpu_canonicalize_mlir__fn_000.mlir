func.func @fold_wait_op_test1() {
  %1 = gpu.wait async
  gpu.wait []
  %3 = gpu.wait async
  gpu.wait [%3]
  return
}
