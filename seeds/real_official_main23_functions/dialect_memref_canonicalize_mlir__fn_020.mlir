func.func @alloc_alignment_const_fold() -> memref<?xf32> {
  %c4 = arith.constant 4 : index
  %a = memref.alloc(%c4) {alignment = 4096 : i64} : memref<?xf32>

  return %a : memref<?xf32>
}
