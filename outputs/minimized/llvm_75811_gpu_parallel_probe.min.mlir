module {
  func.func @main() {
    %c0_6 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c1_7 = arith.constant 1 : index
    scf.parallel (%arg0) = (%c0_6) to (%c1) step (%c1_7) {
      %c0_8 = arith.constant 0 : index
      %c1_9 = arith.constant 1 : index
      %c1_10 = arith.constant 1 : index
      scf.parallel (%arg1) = (%c0_8) to (%c1_9) step (%c1_10) {
      } {mapping = [#gpu.loop_dim_map<processor = thread_x, map = (d0) -> (d0), bound = (d0) -> (d0)>]}
    } {mapping = [#gpu.loop_dim_map<processor = block_x, map = (d0) -> (d0), bound = (d0) -> (d0)>]}
    return
  }
}
