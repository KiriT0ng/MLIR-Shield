func.func @split_vector_transfer_read_mem_space(%A: memref<?x8xf32, 3>, %i: index, %j: index) -> vector<4x8xf32> {
  %c0 = arith.constant 0 : index
  %f0 = arith.constant 0.0 : f32

  //               inBounds with a different memory space
  //               slow path, fill tmp alloc and yield a memref_casted version of it

  %1 = vector.transfer_read %A[%i, %j], %f0 : memref<?x8xf32, 3>, vector<4x8xf32>

  return %1: vector<4x8xf32>
}
