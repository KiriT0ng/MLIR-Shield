func.func @atomic_rmw_with_offset(%I : memref<10xi32, strided<[1], offset: 5>>, %ival : i32, %i : index) {
  memref.atomic_rmw andi %ival, %I[%i] : (i32, memref<10xi32, strided<[1], offset: 5>>) -> i32
  return
}
