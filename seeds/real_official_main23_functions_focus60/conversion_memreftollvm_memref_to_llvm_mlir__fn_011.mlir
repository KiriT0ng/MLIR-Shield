func.func @get_gv0_memref() {
  %0 = memref.get_global @gv0 : memref<2xf32>
  return
}
