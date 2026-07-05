func.func @frontier_vector_transfer_81(%m: memref<?x?xf32, strided<[?, ?], offset: ?>>, %i: index, %j: index) -> vector<2x2xf32> {
  %pad = arith.constant 0.000000e+00 : f32
  %v = vector.transfer_read %m[%i, %j], %pad {in_bounds = [false, true]} : memref<?x?xf32, strided<[?, ?], offset: ?>>, vector<2x2xf32>
  return %v : vector<2x2xf32>
}
