func.func private @ub_negative_alloc_size() -> memref<?x?x?xi1> {
  %idx1 = index.constant 1
  %c-2 = arith.constant -2 : index
  %c15 = arith.constant 15 : index
  %alloc = memref.alloc(%c15, %c-2, %idx1) : memref<?x?x?xi1>
  return %alloc : memref<?x?x?xi1>
}
