func.func @split_vector_transfer_read_2d(%A: memref<?x8xf32>, %i: index, %j: index) -> vector<4x8xf32> {
  %c0 = arith.constant 0 : index
  %f0 = arith.constant 0.0 : f32

  // alloca for boundary full tile
  // %i + 4 <= dim(%A, 0)
  // %j + 8 <= dim(%A, 1)
  // are both conds true
  //               inBounds, just yield %A
  //               slow path, fill tmp alloc and yield a memref_casted version of it

  %1 = vector.transfer_read %A[%i, %j], %f0 : memref<?x8xf32>, vector<4x8xf32>

  return %1: vector<4x8xf32>
}
