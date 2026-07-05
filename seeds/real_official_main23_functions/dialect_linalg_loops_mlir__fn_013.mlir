func.func @generic_index_op_zero_rank(%arg0: memref<i32>, %arg1: memref<3x4xi32>)
{
  linalg.generic #trait_broadcast
      ins(%arg0 : memref<i32>)
     outs(%arg1 : memref<3x4xi32>) {
    ^bb(%a: i32, %b: i32) :
      %i = linalg.index 0 : index
      %j = linalg.index 1 : index
      %ij = arith.addi %i, %j : index
      %ij_int = arith.index_cast %ij : index to i32
      %result = arith.addi %a, %ij_int : i32
      linalg.yield %result : i32
  }
  return
}
