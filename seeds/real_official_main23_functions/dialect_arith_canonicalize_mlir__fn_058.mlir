func.func @nested_andi() -> (i32) {
  %0 = "test.constant"() {value = 0x7fffffff} : () -> i32
  %1 = "test.constant"() {value = -2147483648} : () -> i32
  %2 = "test.constant"() {value = 0x80000000} : () -> i32
  %4 = arith.andi %0, %1 : i32
  %5 = arith.andi %4, %2 : i32
  return %5 : i32
}
