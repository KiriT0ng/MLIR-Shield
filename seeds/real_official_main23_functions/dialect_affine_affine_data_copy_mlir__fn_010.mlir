#id = affine_map<(d0) -> (d0)>
#ub = affine_map<(d0) -> (d0 + 128)>
func.func @scalar_memref_copy_in_loop(%3:memref<480xi1>) {
  %false = arith.constant false
  %4 = memref.alloc() {alignment = 128 : i64} : memref<i1>
  affine.store %false, %4[] : memref<i1>
  %5 = memref.alloc() {alignment = 128 : i64} : memref<i1>
  memref.copy %4, %5 : memref<i1> to memref<i1>
  affine.for %arg0 = 0 to 480 {
    %11 = affine.load %3[%arg0] : memref<480xi1>
    %12 = affine.load %5[] : memref<i1>
    %13 = arith.cmpi slt, %11, %12 : i1
    %14 = arith.select %13, %11, %12 : i1
    affine.store %14, %5[] : memref<i1>
  }

  return
}
