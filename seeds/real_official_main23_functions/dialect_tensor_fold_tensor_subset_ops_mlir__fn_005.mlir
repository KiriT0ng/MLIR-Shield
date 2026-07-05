func.func @insert_slice_of_transfer_write_overwrite_all(%arg0: tensor<1000x1000xf32>, %arg1: vector<5x6xf32>, %arg2: index, %arg3: tensor<100x100xf32>) -> tensor<1000x1000xf32> {
  %c0 = arith.constant 0 : index

  %0 = vector.transfer_write %arg1, %arg3[%c0, %c0] {in_bounds = [true, true]} : vector<5x6xf32>, tensor<100x100xf32>
  %inserted_slice = tensor.insert_slice %0 into %arg0[3, %arg2] [100, 100] [1, 1] : tensor<100x100xf32> into tensor<1000x1000xf32>
  return %inserted_slice : tensor<1000x1000xf32>
}
