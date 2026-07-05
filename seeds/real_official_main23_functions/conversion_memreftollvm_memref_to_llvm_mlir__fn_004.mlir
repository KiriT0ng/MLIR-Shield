func.func @assume_alignment(%0 : memref<4x4xf16>) {
  %1 = memref.assume_alignment %0, 16 : memref<4x4xf16>
  return
}
