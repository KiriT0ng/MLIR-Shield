func.func @scf_for_all_step_size_0()  {
  %x = arith.constant 0 : index
  scf.forall (%i, %j) = (0, 4) to (1, 5) step (%x, 8) {
    vector.print %i : index
    scf.forall.in_parallel {}
  }
  return
}
