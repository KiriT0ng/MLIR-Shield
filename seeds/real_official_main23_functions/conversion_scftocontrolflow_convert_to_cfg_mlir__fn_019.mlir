func.func @ifs_in_parallel(%arg1: index, %arg2: index, %arg3: index, %arg4: i1, %arg5: i1) {
  scf.parallel (%i) = (%arg1) to (%arg2) step (%arg3) {
    scf.if %arg4 {
      %0 = scf.if %arg5 -> (index) {
        %1 = "test.if2"() : () -> index
        scf.yield %1 : index
      } else {
        %2 = "test.else2"() : () -> index
        scf.yield %2 : index
      }
    }
    scf.reduce
  }

  return
}
