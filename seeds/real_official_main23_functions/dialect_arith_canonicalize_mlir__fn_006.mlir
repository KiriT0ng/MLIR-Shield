func.func @select_no_fold_ui1(%arg0: i1) -> ui1 {
  %c0_i1 = "test.constant"() {value = 0 : i32} : () -> ui1
  %c1_i1 = "test.constant"() {value = 1 : i32} : () -> ui1
  %res = arith.select %arg0, %c1_i1, %c0_i1 : ui1
  return %res : ui1
}
