func.func private @side_effect()
func.func @one_unused(%cond: i1) -> (index) {
  %0, %1 = scf.if %cond -> (index, index) {
    func.call @side_effect() : () -> ()
    %c0 = "test.value0"() : () -> (index)
    %c1 = "test.value1"() : () -> (index)
    scf.yield %c0, %c1 : index, index
  } else {
    %c2 = "test.value2"() : () -> (index)
    %c3 = "test.value3"() : () -> (index)
    scf.yield %c2, %c3 : index, index
  }
  return %1 : index
}
