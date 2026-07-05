func.func @get_gv3_memref() {
  %0 = memref.get_global @gv3 : memref<f32>
  return
}
