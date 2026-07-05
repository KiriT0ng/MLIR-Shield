func.func @unreachable() {
  return
^unreachable:
  %c1_i64 = arith.constant 1 : i64
  // This self referencing operation is legal in an unreachable block.
  // Many patterns are unsafe with respect to this kind of situation,
  // check that we don't infinite loop here.
  %add = arith.addi %add, %c1_i64 : i64
  cf.br ^unreachable
}
