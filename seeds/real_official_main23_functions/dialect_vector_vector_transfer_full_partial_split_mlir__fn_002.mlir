func.func @split_vector_transfer_write_2d(%V: vector<4x8xf32>, %A: memref<?x8xf32>, %i: index, %j: index) {
  vector.transfer_write %V, %A[%i, %j] :
    vector<4x8xf32>, memref<?x8xf32>
  return
}
