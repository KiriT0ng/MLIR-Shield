func.func @fold_iter_args_not_being_modified_within_scfforall(%arg0: index, %arg1: tensor<?xf32>, %arg2: tensor<?xf32>) -> (tensor<?xf32>, tensor<?xf32>) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 4.200000e+01 : f32
    %0 = linalg.fill ins(%cst : f32) outs(%arg1 : tensor<?xf32>) -> tensor<?xf32>
    %dim = tensor.dim %arg1, %c0 : tensor<?xf32>
    %1 = affine.apply #map()[%dim, %arg0]
    %2:2 = scf.forall (%arg3) in (%1) shared_outs(%arg4 = %arg1, %arg5 = %arg2) -> (tensor<?xf32>, tensor<?xf32>) {
      %3 = affine.apply #map1(%arg3)[%arg0]
      %4 = affine.min #map2(%arg3)[%dim, %arg0]
      %extracted_slice0 = tensor.extract_slice %arg4[%3] [%4] [1] : tensor<?xf32> to tensor<?xf32>
      %extracted_slice1 = tensor.extract_slice %arg5[%3] [%4] [1] : tensor<?xf32> to tensor<?xf32>
      %5 = linalg.exp ins(%extracted_slice0 : tensor<?xf32>) outs(%extracted_slice1 : tensor<?xf32>) -> tensor<?xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %5 into %arg5[%3] [%4] [1] : tensor<?xf32> into tensor<?xf32>
      }
    }
    return %2#0, %2#1 : tensor<?xf32>, tensor<?xf32>
  }
