func.func @unknown_trip_count_store_not_hoisted(%x: i32, %n: index) -> i32 {
  %alloc = memref.alloc() : memref<1xi32>
  %c42 = arith.constant 42 : i32
  affine.store %c42, %alloc[0] : memref<1xi32>
  affine.for %i = 0 to %n {
    // This store must not be hoisted: if %n == 0 at runtime the loop body
    // never executes, and hoisting would change the observable result.
    affine.store %x, %alloc[0] : memref<1xi32>
  }
  %r = affine.load %alloc[0] : memref<1xi32>
  return %r : i32
}
