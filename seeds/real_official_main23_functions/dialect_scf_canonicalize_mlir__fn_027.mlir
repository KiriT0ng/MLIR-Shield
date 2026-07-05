func.func @if_condition_swap(%cond: i1) -> index {
  %true = arith.constant true
  %not = arith.xori %cond, %true : i1
  %0 = scf.if %not -> (index) {
    %1 = "test.origTrue"() : () -> index
    scf.yield %1 : index
  } else {
    %1 = "test.origFalse"() : () -> index
    scf.yield %1 : index
  }
  return %0 : index
}
