func.func @fold_iter_args_with_no_use_of_result_scfforall(%arg0: index, %arg1: tensor<?xf32>, %arg2: tensor<?xf32>, %arg3: tensor<?xf32>) -> tensor<?xf32> {
    %cst = arith.constant 4.200000e+01 : f32
    %c0 = arith.constant 0 : index
    %0 = linalg.fill ins(%cst : f32) outs(%arg1 : tensor<?xf32>) -> tensor<?xf32>
    %dim = tensor.dim %arg1, %c0 : tensor<?xf32>
    %1 = affine.apply #map()[%dim, %arg0]
    %2:3 = scf.forall (%arg4) in (%1) shared_outs(%arg5 = %arg1, %arg6 = %arg2, %arg7 = %arg3) -> (tensor<?xf32>, tensor<?xf32>, tensor<?xf32>) {
      %3 = affine.apply #map1(%arg4)[%arg0]
      %4 = affine.min #map2(%arg4)[%dim, %arg0]
      %extracted_slice = tensor.extract_slice %arg5[%3] [%4] [1] : tensor<?xf32> to tensor<?xf32>
      %extracted_slice_0 = tensor.extract_slice %arg6[%3] [%4] [1] : tensor<?xf32> to tensor<?xf32>
      %extracted_slice_1 = tensor.extract_slice %arg7[%3] [%4] [1] : tensor<?xf32> to tensor<?xf32>
      %extracted_slice_2 = tensor.extract_slice %0[%3] [%4] [1] : tensor<?xf32> to tensor<?xf32>
      %5 = linalg.exp ins(%extracted_slice : tensor<?xf32>) outs(%extracted_slice_1 : tensor<?xf32>) -> tensor<?xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %5 into %arg6[%3] [%4] [1] : tensor<?xf32> into tensor<?xf32>
        tensor.parallel_insert_slice %extracted_slice into %arg5[%3] [%4] [1] : tensor<?xf32> into tensor<?xf32>
        tensor.parallel_insert_slice %extracted_slice_0 into %arg7[%3] [%4] [1] : tensor<?xf32> into tensor<?xf32>
        tensor.parallel_insert_slice %5 into %arg7[%4] [%3] [1] : tensor<?xf32> into tensor<?xf32>
      }
    }
    return %2#1 : tensor<?xf32>
  }
