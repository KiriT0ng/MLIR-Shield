func.func private @side_effect()
func.func @nested_unused(%cond1: i1, %cond2: i1) -> (index) {
  %0, %1 = scf.if %cond1 -> (index, index) {
    %2, %3 = scf.if %cond2 -> (index, index) {
      func.call @side_effect() : () -> ()
      %c0 = "test.value0"() : () -> (index)
      %c1 = "test.value1"() : () -> (index)
      scf.yield %c0, %c1 : index, index
    } else {
      %c2 = "test.value2"() : () -> (index)
      %c3 = "test.value3"() : () -> (index)
      scf.yield %c2, %c3 : index, index
    }
    scf.yield %2, %3 : index, index
  } else {
    %c0 = "test.value0_2"() : () -> (index)
    %c1 = "test.value1_2"() : () -> (index)
    scf.yield %c0, %c1 : index, index
  }
  return %1 : index
}
