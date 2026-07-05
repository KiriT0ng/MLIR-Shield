func.func @get_gv2_memref() {

  %0 = memref.get_global @gv2 : memref<2x3xf32>
  return
}
