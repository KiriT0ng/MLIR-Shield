func.func @alloc_const_fold_with_symbols1(%arg0 : index) -> memref<?xi32, strided<[?], offset: ?>> {
  %c1 = arith.constant 1 : index
  %0 = memref.alloc(%arg0)[%c1, %c1] : memref<?xi32, strided<[?], offset: ?>>
  return %0 : memref<?xi32, strided<[?], offset: ?>>
}
