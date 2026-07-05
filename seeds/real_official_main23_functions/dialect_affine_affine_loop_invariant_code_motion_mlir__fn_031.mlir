func.func @hoist_pure_from_zero_trip_count_loop(%x: i32, %y: i32) -> i32 {
  %alloc = memref.alloc() : memref<1xi32>
  affine.for %i = 0 to 0 {
    // arith.addi is pure and loop-invariant — it should be hoisted even though
    // the loop never executes.
    %z = arith.addi %x, %y : i32
    // The store is not pure so it must stay in the loop.
    affine.store %z, %alloc[0] : memref<1xi32>
  }
  %r = affine.load %alloc[0] : memref<1xi32>
  return %r : i32
}
