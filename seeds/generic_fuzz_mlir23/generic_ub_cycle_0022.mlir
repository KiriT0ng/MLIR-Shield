"builtin.module"() ({
  %0 = "arith.muli"(%1, %0) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
  %1 = "arith.constant"() <{value = 1 : index}> : () -> index
}) : () -> ()
