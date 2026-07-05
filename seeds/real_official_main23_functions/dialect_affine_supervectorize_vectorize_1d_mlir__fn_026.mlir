func.func @index_const_inside_loop(%mem: memref<1x8xi32>) {
  affine.for %arg0 = 0 to 8 {
    %c0_i32 = arith.constant 0 : i32
    %c0 = arith.constant 0 : index
    affine.store %c0_i32, %mem[%c0, %arg0] : memref<1x8xi32>
  }
  return
}
