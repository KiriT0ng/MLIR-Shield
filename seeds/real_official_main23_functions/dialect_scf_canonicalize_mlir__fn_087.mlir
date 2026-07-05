func.func @index_switch_fold_no_res() {
  %c1 = arith.constant 1 : index
  scf.index_switch %c1
  case 0 {
    scf.yield
  }
  default {
    "test.op"() : () -> ()
    scf.yield
  }
  return
}
