func.func @no_miscompile_block_arg_address_reuse(%cond: i1) {
  %false = arith.constant false
  %c4 = arith.constant 4 : i64
  %c99 = arith.constant 99 : i64
  cf.cond_br %false, ^bb1, ^bb2
^bb1:
  cf.br ^bb3(%c4, %c99 : i64, i64)
^bb2:
  cf.br ^bb3(%c4, %c99 : i64, i64)
^bb3(%a: i64, %b: i64):
  "test.use"(%a) : (i64) -> ()
  cf.br ^bb4
^bb4:
  cf.cond_br %cond, ^bb5, ^bb6
^bb5:
  %c333 = arith.constant 333 : i64
  cf.br ^bb7(%c333 : i64)
^bb6:
  %c444 = arith.constant 444 : i64
  cf.br ^bb7(%c444 : i64)
^bb7(%result: i64):
  vector.print %result : i64
  return
}
