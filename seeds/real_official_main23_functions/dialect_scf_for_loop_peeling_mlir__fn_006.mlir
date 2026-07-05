#map = affine_map<(d0, d1)[s0] -> (s0, d0 - d1)>
func.func @nested_loops(%lb0: index, %lb1 : index, %ub0: index, %ub1: index,
                   %step: index) -> i32 {
  %c0 = arith.constant 0 : i32
  %r0 = scf.for %iv0 = %lb0 to %ub0 step %step iter_args(%arg0 = %c0) -> i32 {
    %r1 = scf.for %iv1 = %lb1 to %ub1 step %step iter_args(%arg1 = %arg0) -> i32 {
      %s = affine.min #map(%ub1, %iv1)[%step]
      %casted = arith.index_cast %s : index to i32
      %0 = arith.addi %arg1, %casted : i32
      scf.yield %0 : i32
    }
    %1 = arith.addi %arg0, %r1 : i32
    scf.yield %1 : i32
  }
  return %r0 : i32
}
