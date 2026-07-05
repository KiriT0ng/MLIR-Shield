func.func @view_empty_memref(%offset: index, %mem: memref<0xi8>) {


  %0 = memref.view %mem[%offset][] : memref<0xi8> to memref<0x4xf32>

  return
}
