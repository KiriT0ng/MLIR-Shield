#map = affine_map<(d0, d1)[s0] -> (s0, d0 - d1)>
func.func @fully_static_bounds_integers() -> i32 {
  %c0_i32 = arith.constant 0 : i32
  %lb = arith.constant 0 : i32
  %step = arith.constant 4 : i32
  %ub = arith.constant 17 : i32
  %r = scf.for %iv = %lb to %ub step %step
               iter_args(%arg = %c0_i32) -> i32 : i32 {
    %ub_index = arith.index_cast %ub : i32 to index
    %iv_index = arith.index_cast %iv : i32 to index
    %step_index = arith.index_cast %step : i32 to index
    %s = affine.min #map(%ub_index, %iv_index)[%step_index]
    %casted = arith.index_cast %s : index to i32
    %0 = arith.addi %arg, %casted : i32
    scf.yield %0 : i32
  }
  return %r : i32
}
