#map = affine_map<(d0, d1)[s0] -> (s0, d0 - d1)>
func.func @fully_dynamic_bounds(%lb : index, %ub: index, %step: index) -> i32 {
  %c0 = arith.constant 0 : i32
  %r = scf.for %iv = %lb to %ub step %step iter_args(%arg = %c0) -> i32 {
    %s = affine.min #map(%ub, %iv)[%step]
    %casted = arith.index_cast %s : index to i32
    %0 = arith.addi %arg, %casted : i32
    scf.yield %0 : i32
  }
  return %r : i32
}

// -----


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
// -----

#map = affine_map<(d0, d1)[s0] -> (s0, d0 - d1)>
func.func @fully_static_bounds() -> i32 {
  %c0_i32 = arith.constant 0 : i32
  %lb = arith.constant 0 : index
  %step = arith.constant 4 : index
  %ub = arith.constant 17 : index
  %r = scf.for %iv = %lb to %ub step %step
               iter_args(%arg = %c0_i32) -> i32 {
    %s = affine.min #map(%ub, %iv)[%step]
    %casted = arith.index_cast %s : index to i32
    %0 = arith.addi %arg, %casted : i32
    scf.yield %0 : i32
  }
  return %r : i32
}

// -----

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

// -----

#map = affine_map<(d0, d1)[s0] -> (s0, d0 - d1)>
func.func @dynamic_upper_bound(%ub : index) -> i32 {
  %c0_i32 = arith.constant 0 : i32
  %lb = arith.constant 0 : index
  %step = arith.constant 4 : index
  %r = scf.for %iv = %lb to %ub step %step
               iter_args(%arg = %c0_i32) -> i32 {
    %s = affine.min #map(%ub, %iv)[%step]
    %casted = arith.index_cast %s : index to i32
    %0 = arith.addi %arg, %casted : i32
    scf.yield %0 : i32
  }
  return %r : i32
}

// -----

#map = affine_map<(d0, d1)[s0] -> (s0, d0 - d1)>
func.func @no_loop_results(%ub : index, %d : memref<i32>) {
  %c0_i32 = arith.constant 0 : i32
  %lb = arith.constant 0 : index
  %step = arith.constant 4 : index
  scf.for %iv = %lb to %ub step %step {
    %s = affine.min #map(%ub, %iv)[%step]
    %r = memref.load %d[] : memref<i32>
    %casted = arith.index_cast %s : index to i32
    %0 = arith.addi %r, %casted : i32
    memref.store %0, %d[] : memref<i32>
  }
  return
}

// -----

// Test rewriting of affine.min/max ops. Make sure that more general cases than
// the ones above are successfully rewritten. Also make sure that the pattern
// does not rewrite ops that should not be rewritten.

//                 (affine.min folded away)
//                 (affine.min folded away)
#map0 = affine_map<(d0, d1)[s0] -> (s0, d0 - d1)>
#map1 = affine_map<(d0, d1)[s0] -> (d0 - d1 + 1, s0)>
#map2 = affine_map<(d0, d1)[s0] -> (s0 + 1, d0 - d1 + 1)>
#map3 = affine_map<(d0, d1)[s0] -> (s0, d0 - d1 - 1)>
#map4 = affine_map<(d0, d1, d2)[s0] -> (s0, d0 - d1, d2)>
#map5 = affine_map<(d0, d1)[s0] -> (-s0, -d0 + d1)>
func.func @test_affine_op_rewrite(%lb : index, %ub: index,
                             %step: index, %d : memref<?xindex>,
                             %some_val: index) {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c2 = arith.constant 2 : index
  %c3 = arith.constant 3 : index
  %c4 = arith.constant 4 : index
  %c5 = arith.constant 5 : index
  scf.for %iv = %lb to %ub step %step {
    // Most common case: Rewrite min(%ub - %iv, %step) to %step.
    %m0 = affine.min #map0(%ub, %iv)[%step]
    memref.store %m0, %d[%c0] : memref<?xindex>

    // Increase %ub - %iv a little bit, pattern should still apply.
    %m1 = affine.min #map1(%ub, %iv)[%step]
    memref.store %m1, %d[%c1] : memref<?xindex>

    // Rewrite min(%ub - %iv + 1, %step + 1) to %step + 1.
    %m2 = affine.min #map2(%ub, %iv)[%step]
    memref.store %m2, %d[%c2] : memref<?xindex>

    // min(%ub - %iv - 1, %step) cannot be simplified because %ub - %iv - 1
    // can be smaller than %step. (Can be simplified in if-statement.)
    %m3 = affine.min #map3(%ub, %iv)[%step]
    memref.store %m3, %d[%c3] : memref<?xindex>

    // min(%ub - %iv, %step, %some_val) cannot be simplified because the range
    // of %some_val is unknown.
    %m4 = affine.min #map4(%ub, %iv, %some_val)[%step]
    memref.store %m4, %d[%c4] : memref<?xindex>

    // Rewrite max(-%ub + %iv, -%step) to -%ub + %iv (and -%step in the scf.if).
    %m5 = affine.max #map5(%ub, %iv)[%step]
    memref.store %m5, %d[%c5] : memref<?xindex>
  }
  return
}

// -----


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

// -----

func.func @regression(%arg0: memref<i64>, %arg1: index) {
  %c0 = arith.constant 0 : index
  %0 = affine.apply affine_map<()[s0] -> (s0 * s0)>()[%arg1]
  scf.for %arg2 = %c0 to %0 step %arg1 {
    %1 = affine.min affine_map<(d0)[s0] -> (s0, -d0 + s0 * s0)>(%arg2)[%arg1]
    %2 = arith.index_cast %0 : index to i64
    memref.store %2, %arg0[] : memref<i64>
  }
  return
}

// -----

// Regression test: Make sure that we do not crash.

func.func @zero_step(%arg0: memref<i64>) {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %foldto0 = arith.subi %c1, %c1 : index
  scf.for %arg2 = %c0 to %c1 step %foldto0 {
    %2 = arith.index_cast %arg2 : index to i64
    memref.store %2, %arg0[] : memref<i64>
  }
  return
}
