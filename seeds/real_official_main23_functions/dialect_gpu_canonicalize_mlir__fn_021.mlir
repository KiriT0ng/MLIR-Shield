func.func @make_reduce_uniform() {
  %0:6 = "test.test1"() : () -> (index, index, index, index, index, index)
  gpu.launch blocks(%arg0, %arg1, %arg2) in (%arg6 = %0#0, %arg7 = %0#1, %arg8 = %0#2)
    threads(%arg3, %arg4, %arg5) in (%arg9 = %0#3, %arg10 = %0#4, %arg11 = %0#5) {
    %1 = "test.test2"() : () -> i32
    %2 = gpu.all_reduce add %1 {} : (i32) -> (i32)
    "test.test3"(%2) : (i32) -> ()
    gpu.terminator
  }
  return
}
