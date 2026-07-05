func.func @replace_duplicate_iter_args(%lb: index, %ub: index, %step: index, %a: index, %b: index) -> (index, index, index, index) {
  %0:4 = scf.for %i = %lb to %ub step %step iter_args(%k0 = %a, %k1 = %b, %k2 = %b, %k3 = %a) -> (index, index, index, index) {
    %1 = arith.addi %k0, %k1 : index
    %2 = arith.addi %k2, %k3 : index
    scf.yield %1, %2, %2, %1 : index, index, index, index
  }
  return %0#0, %0#1, %0#2, %0#3 : index, index, index, index
}
