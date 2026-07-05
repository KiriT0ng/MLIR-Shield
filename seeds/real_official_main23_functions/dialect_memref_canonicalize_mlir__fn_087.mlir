func.func @fold_assume_alignment_chain(%0: memref<128xf32>) -> memref<128xf32> {
  %1 = memref.assume_alignment %0, 16 : memref<128xf32>
  %2 = memref.assume_alignment %1, 16 : memref<128xf32>
  return %2 : memref<128xf32>
}
