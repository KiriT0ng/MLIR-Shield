"builtin.module"() ({
  %0 = "arith.muli"(%1, %0) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
  %1 = "arith.constant"() <{value = 0 : index}> : () -> index
}) : () -> ()
