#map = affine_map<(d0, d1)[s0] -> (s0, d0 - d1)>
func.func @static_two_iterations_ub_used_in_loop(%arg0: memref<1xi32>) -> i32 {
  %c0_i32 = arith.constant 0 : i32
  %lb = arith.constant 0 : index
  %step = arith.constant 4 : index
  %ub = arith.constant 7 : index
  %r = scf.for %iv = %lb to %ub step %step iter_args(%arg = %c0_i32) -> i32 {
    %s = affine.min #map(%ub, %iv)[%step]
    %casted = arith.index_cast %s : index to i32
    %0 = arith.addi %arg, %casted : i32
    %1 = memref.load %arg0[%ub] : memref<1xi32>
    %result = arith.addi %0, %1 : i32
    scf.yield %result : i32
  }
  return %r : i32
}
