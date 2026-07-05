#id = affine_map<(d0) -> (d0)>
#ub = affine_map<(d0) -> (d0 + 128)>
func.func @scalar_memref_copy_without_dma() {
    %false = arith.constant false
    %4 = memref.alloc() {alignment = 128 : i64} : memref<i1>
    affine.store %false, %4[] : memref<i1>

    return
}
