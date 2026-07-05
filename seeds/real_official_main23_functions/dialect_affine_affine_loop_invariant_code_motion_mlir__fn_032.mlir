func.func @no_hoist_from_zero_trip_count_loop(%x: i32) -> i32 {
  %alloc = memref.alloc() : memref<1xi32>
  %c42 = arith.constant 42 : i32
  affine.store %c42, %alloc[0] : memref<1xi32>
  affine.for %i = 0 to 0 {
    // This store must not be hoisted: the loop body is never executed.
    affine.store %x, %alloc[0] : memref<1xi32>
  }
  %r = affine.load %alloc[0] : memref<1xi32>
  return %r : i32
}
