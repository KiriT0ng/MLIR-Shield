#id = affine_map<(d0) -> (d0)>
#ub = affine_map<(d0) -> (d0 + 128)>
func.func @multiple_blocks(%arg0: index) -> memref<1x2x1xi32> {
  %c1_i32 = arith.constant 1 : i32
  %c3_i32 = arith.constant 3 : i32
  %0 = memref.get_global @__constant_1x2x1xi32_1 : memref<1x2x1xi32>
  %alloc = memref.alloc() {alignment = 64 : i64} : memref<1x2x1xi32>
  memref.copy %0, %alloc : memref<1x2x1xi32> to memref<1x2x1xi32>
  cf.br ^bb1(%alloc : memref<1x2x1xi32>)
^bb1(%1: memref<1x2x1xi32>):  // 2 preds: ^bb0, ^bb2
  %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<1x2x1xi1>
  affine.for %arg1 = 0 to 1 {
    affine.for %arg2 = 0 to 2 {
      affine.for %arg3 = 0 to 1 {
        %3 = affine.load %1[%arg1, %arg2, %arg3] : memref<1x2x1xi32>
        %4 = arith.cmpi slt, %3, %c3_i32 : i32
        affine.store %4, %alloc_0[%arg1, %arg2, %arg3] : memref<1x2x1xi1>
      }
    }
  }
  %2 = memref.load %alloc_0[%arg0, %arg0, %arg0] : memref<1x2x1xi1>
  cf.cond_br %2, ^bb2, ^bb3
^bb2:  // pred: ^bb1
  %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<1x2x1xi32>
  affine.for %arg1 = 0 to 1 {
    affine.for %arg2 = 0 to 2 {
      affine.for %arg3 = 0 to 1 {
        // Ensure that this reference isn't replaced.
        %3 = affine.load %1[%arg1, %arg2, %arg3] : memref<1x2x1xi32>
        %4 = arith.addi %3, %c1_i32 : i32
        affine.store %4, %alloc_1[%arg1, %arg2, %arg3] : memref<1x2x1xi32>
      }
    }
  }
  cf.br ^bb1(%alloc_1 : memref<1x2x1xi32>)
^bb3:  // pred: ^bb1
  return %1 : memref<1x2x1xi32>
}
