func.func @affine_parallel(%memref_8: memref<4090x2040xf32>, %x: index) {
  %cst = arith.constant 0.000000e+00 : f32
  affine.parallel (%arg3) = (0) to (32) {
    affine.for %arg4 = 0 to 16 {
      affine.parallel (%arg5, %arg6) = (0, 0) to (min(128, 122), min(64, %arg3 * -64 + 2040)) {
        affine.for %arg7 = 0 to min #map(%arg4) {
          affine.store %cst, %memref_8[%arg5 + 3968, %arg6 + %arg3 * 64] : memref<4090x2040xf32>
        }
      }
    }
  }
  // The store is inside a loop with an unknown (non-constant) trip count, so
  // it must not be hoisted: the loop might not execute at runtime.

  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c32 = arith.constant 32 : index
  scf.parallel (%arg3) = (%c0) to (%c32) step (%c1) {
    affine.for %arg4 = 0 to 16 {
      affine.parallel (%arg5, %arg6) = (0, 0) to (min(128, 122), min(64, %x * -64 + 2040)) {
        affine.for %arg7 = 0 to min #map(%arg4) {
          affine.store %cst, %memref_8[%arg5 + 3968, %arg6] : memref<4090x2040xf32>
        }
      }
    }
  }

  affine.for %arg3 = 0 to 32 {
    affine.for %arg4 = 0 to 16 {
      affine.parallel (%arg5, %arg6) = (0, 0) to (min(128, 122), min(64, %arg3 * -64 + 2040)) {
        // Unknown region-holding op for this pass.
        scf.for %arg7 = %c0 to %x step %c1 {
          affine.store %cst, %memref_8[%arg5 + 3968, %arg6 + %arg3 * 64] : memref<4090x2040xf32>
        }
      }
    }
  }

  return
}
