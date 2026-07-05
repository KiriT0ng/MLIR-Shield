module {
  func.func @no_crash_dim_of_ambiguous_subview(%arg0: memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>, %arg1: index) -> index {
    return %arg1 : index
  }
}

