func.func @insert_slice_cast_no_fold(%arg0 : tensor<1x?xf32>, %arg1 : tensor<?x?xf32>, %arg2 : index, %arg3 : index, %arg4 : index, %arg5 : index, %arg6 : index, %arg7 : index) -> tensor<?x?xf32> {
  %0 = tensor.cast %arg0 : tensor<1x?xf32> to tensor<?x5xf32>
  %1 = tensor.insert_slice %0 into %arg1[%arg2, %arg3] [%arg4, 5] [%arg6, %arg7] : tensor<?x5xf32> into tensor<?x?xf32>
  return %1 : tensor<?x?xf32>
}
