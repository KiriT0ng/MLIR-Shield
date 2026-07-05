func.func @view_memref_as_rank0(%offset: index, %mem: memref<2xi8>) {

  %memref_view_bf16 = memref.view %mem[%offset][] : memref<2xi8> to memref<bf16>

  return
}
