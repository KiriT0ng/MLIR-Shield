func.func @extract_aligned_pointer_as_index_unranked(%m: memref<*xf32>) -> index {
  %0 = memref.extract_aligned_pointer_as_index %m: memref<*xf32> -> index

  return %0: index
}
