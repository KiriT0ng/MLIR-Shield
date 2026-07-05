func.func @split_vector_transfer_write_mem_space(%V: vector<4x8xf32>, %A: memref<?x8xf32, 3>, %i: index, %j: index) {
  vector.transfer_write %V, %A[%i, %j] :
    vector<4x8xf32>, memref<?x8xf32, 3>
  return
}
