func.func @alloc_const_fold_with_symbols2() -> memref<?xi32, strided<[?], offset: ?>> {
  %c1 = arith.constant 1 : index
  %0 = memref.alloc(%c1)[%c1, %c1] : memref<?xi32, strided<[?], offset: ?>>
  return %0 : memref<?xi32, strided<[?], offset: ?>>
}
