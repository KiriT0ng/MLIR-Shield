func.func @assume_alignment_w_offset(%0 : memref<4x4xf16, strided<[?, ?], offset: ?>>) {
  %1 = memref.assume_alignment %0, 16 : memref<4x4xf16, strided<[?, ?], offset: ?>>
  return
}
