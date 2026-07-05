#map0 = affine_map<(d0, d1) -> (d0, d1)>

func.func @add_mul_fusion(%arg0: tensor<?x?xf32>, %arg1 : tensor<?x?xf32>, %arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
{
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %0 = tensor.dim %arg0, %c0 : tensor<?x?xf32>
  %1 = tensor.dim %arg0, %c1 : tensor<?x?xf32>
  %2 = tensor.empty(%0, %1) : tensor<?x?xf32>
  %3 = linalg.generic {indexing_maps = [#map0, #map0, #map0], iterator_types = ["parallel", "parallel"]}
      ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>)
      outs(%2 : tensor<?x?xf32>) {
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %4 = arith.addf %arg3, %arg4 : f32
      linalg.yield %4 : f32
  } -> tensor<?x?xf32>
  %4 = linalg.generic {indexing_maps = [#map0, #map0, #map0], iterator_types = ["parallel", "parallel"]}
      ins(%3, %arg2 : tensor<?x?xf32>, tensor<?x?xf32>)
      outs(%2 : tensor<?x?xf32>) {
    ^bb0(%arg5: f32, %arg6: f32, %arg7: f32):
      %5 = arith.mulf %arg5, %arg6 : f32
      linalg.yield %5 : f32
    } -> tensor<?x?xf32>
  return %4 : tensor<?x?xf32>
}

// -----

#map0 = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> ()>

func.func @scalar_add_mul_fusion(%arg0: tensor<?x?xf32>, %arg1 : f32, %arg2 : f32) -> tensor<?x?xf32>
{
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %0 = tensor.dim %arg0, %c0 : tensor<?x?xf32>
  %1 = tensor.dim %arg0, %c1 : tensor<?x?xf32>
  %2 = tensor.empty(%0, %1) : tensor<?x?xf32>
  %3 = linalg.generic {indexing_maps = [#map0, #map1, #map0], iterator_types = ["parallel", "parallel"]}
      ins(%arg0, %arg1 : tensor<?x?xf32>, f32)
      outs(%2 : tensor<?x?xf32>) {
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %4 = arith.addf %arg3, %arg4 : f32
      linalg.yield %4 : f32
  } -> tensor<?x?xf32>
  %4 = linalg.generic {indexing_maps = [#map0, #map1, #map0], iterator_types = ["parallel", "parallel"]}
      ins(%3, %arg2 : tensor<?x?xf32>, f32)
      outs(%2 : tensor<?x?xf32>) {
    ^bb0(%arg5: f32, %arg6: f32, %arg7: f32):
      %5 = arith.mulf %arg5, %arg6 : f32
      linalg.yield %5 : f32
    } -> tensor<?x?xf32>
  return %4 : tensor<?x?xf32>
}

// -----

#map0 = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1, d0)>

func.func @transpose_add_mul_fusion(%arg0: tensor<?x?xf32>, %arg1 : tensor<?x?xf32>, %arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
{
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %0 = tensor.dim %arg0, %c0 : tensor<?x?xf32>
  %1 = tensor.dim %arg0, %c1 : tensor<?x?xf32>
  %2 = tensor.empty(%0, %1) : tensor<?x?xf32>
  %3 = linalg.generic {indexing_maps = [#map0, #map1, #map0], iterator_types = ["parallel", "parallel"]}
      ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>)
      outs(%2 : tensor<?x?xf32>) {
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %4 = arith.addf %arg3, %arg4 : f32
      linalg.yield %4 : f32
  } -> tensor<?x?xf32>
  %4 = linalg.generic {indexing_maps = [#map0, #map0, #map0], iterator_types = ["parallel", "parallel"]}
      ins(%3, %arg2 : tensor<?x?xf32>, tensor<?x?xf32>)
      outs(%2 : tensor<?x?xf32>) {
    ^bb0(%arg5: f32, %arg6: f32, %arg7: f32):
      %5 = arith.mulf %arg5, %arg6 : f32
      linalg.yield %5 : f32
    } -> tensor<?x?xf32>
  return %4 : tensor<?x?xf32>
}

// -----

#map0 = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1, d0)>

func.func @add_transpose_mul_fusion(%arg0: tensor<?x?xf32>, %arg1 : tensor<?x?xf32>, %arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
{
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %0 = tensor.dim %arg0, %c0 : tensor<?x?xf32>
  %1 = tensor.dim %arg0, %c1 : tensor<?x?xf32>
  %2 = tensor.empty(%0, %1) : tensor<?x?xf32>
  %3 = linalg.generic {indexing_maps = [#map0, #map1, #map0], iterator_types = ["parallel", "parallel"]}
      ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>)
      outs(%2 : tensor<?x?xf32>) {
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %4 = arith.addf %arg3, %arg4 : f32
      linalg.yield %4 : f32
  } -> tensor<?x?xf32>
  %4 = linalg.generic {indexing_maps = [#map1, #map0, #map0], iterator_types = ["parallel", "parallel"]}
      ins(%3, %arg2 : tensor<?x?xf32>, tensor<?x?xf32>)
      outs(%2 : tensor<?x?xf32>){
    ^bb0(%arg5: f32, %arg6: f32, %arg7: f32):
      %5 = arith.mulf %arg5, %arg6 : f32
      linalg.yield %5 : f32
    } -> tensor<?x?xf32>
  return %4 : tensor<?x?xf32>
}

// -----

#map0 = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
#map2 = affine_map<(d0) -> (d0)>

func.func @add_broadcast_mul_fusion(%arg0: tensor<?xf32>, %arg1 : tensor<?xf32>, %arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
{
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %0 = tensor.dim %arg0, %c0 : tensor<?xf32>
  %1 = tensor.empty(%0) : tensor<?xf32>
  %2 = linalg.generic {indexing_maps = [#map2, #map2, #map2], iterator_types = ["parallel"]}
      ins(%arg0, %arg1 : tensor<?xf32>, tensor<?xf32>)
      outs(%1 : tensor<?xf32>) {
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %3 = arith.addf %arg3, %arg4 : f32
      linalg.yield %3 : f32
  } -> tensor<?xf32>
  %3 = tensor.dim %arg2, %c1 : tensor<?x?xf32>
  %4 = tensor.empty(%0, %3) : tensor<?x?xf32>
  %5 = linalg.generic {indexing_maps = [#map1, #map0, #map0], iterator_types = ["parallel", "parallel"]}
      ins(%2, %arg2 : tensor<?xf32>, tensor<?x?xf32>)
      outs(%4 : tensor<?x?xf32>){
    ^bb0(%arg5: f32, %arg6: f32, %arg7: f32):
      %6 = arith.mulf %arg5, %arg6 : f32
      linalg.yield %6 : f32
    } -> tensor<?x?xf32>
  return %5 : tensor<?x?xf32>
}

// -----

#map0 = affine_map<() -> ()>

func.func @add_mul_scalar_fusion(%arg0: tensor<f32>, %arg1: tensor<f32>, %arg2: tensor<f32>) -> tensor<f32>
{
  %0 = tensor.empty() : tensor<f32>
  %1 = linalg.generic {indexing_maps = [#map0, #map0, #map0], iterator_types = []}
      ins(%arg0, %arg1 : tensor<f32>, tensor<f32>)
      outs(%0 : tensor<f32>) {
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %2 = arith.addf %arg3, %arg4 : f32
      linalg.yield %2 : f32
  } -> tensor<f32>
  %2 = linalg.generic {indexing_maps = [#map0, #map0, #map0], iterator_types = []}
      ins(%1, %arg2 : tensor<f32>, tensor<f32>)
      outs(%0 : tensor<f32>) {
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %3 = arith.mulf %arg3, %arg4 : f32
      linalg.yield %3 : f32
  } -> tensor<f32>

  return %2 : tensor<f32>
}

// -----

#map0 = affine_map<(d0, d1, d2) -> (d0)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
func.func @generic_op_constant_fusion(%arg0 : tensor<5x?x?xf32>) -> tensor<5x?x?xf32>
{
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c2 = arith.constant 2 : index
  %cst = arith.constant dense<42.0> : tensor<5xf32>
  %0 = tensor.dim %arg0, %c1 : tensor<5x?x?xf32>
  %1 = tensor.dim %arg0, %c2 : tensor<5x?x?xf32>
  %2 = tensor.empty(%0, %1) : tensor<5x?x?xf32>
  %3 = linalg.generic {
    indexing_maps = [#map0, #map1, #map1],
    iterator_types = ["parallel", "parallel", "parallel"]}
    ins(%cst, %arg0 : tensor<5xf32>, tensor<5x?x?xf32>)
    outs(%2 : tensor<5x?x?xf32>) {
    ^bb0(%arg1: f32, %arg2: f32, %arg3: f32):
      %4 = arith.mulf %arg1, %arg2 : f32
      linalg.yield %4 : f32
    } -> tensor<5x?x?xf32>
  return %3 : tensor<5x?x?xf32>
}

// -----

#map0 = affine_map<(d0, d1, d2) -> ()>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
func.func @generic_op_zero_dim_constant_fusion(%arg0 : tensor<5x?x?xf32>)
  -> tensor<5x?x?xf32>
{
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c2 = arith.constant 2 : index
  %cst = arith.constant dense<42.0> : tensor<f32>
  %0 = tensor.dim %arg0, %c1 : tensor<5x?x?xf32>
  %1 = tensor.dim %arg0, %c2 : tensor<5x?x?xf32>
  %2 = tensor.empty(%0, %1) : tensor<5x?x?xf32>
  %3 = linalg.generic {
    indexing_maps = [#map0, #map1, #map1],
    iterator_types = ["parallel", "parallel", "parallel"]}
    ins(%cst, %arg0 : tensor<f32>, tensor<5x?x?xf32>)
    outs(%2 : tensor<5x?x?xf32>) {
    ^bb0(%arg1: f32, %arg2: f32, %arg3: f32):
      %4 = arith.mulf %arg1, %arg2 : f32
      linalg.yield %4 : f32
    } -> tensor<5x?x?xf32>
  return %3 : tensor<5x?x?xf32>
}

// -----

#map0 = affine_map<(d0, d1) -> (d0, d1)>
func.func @producer_indexed_consumer_fusion(%arg0: tensor<?x?xi32>,
                                       %arg1: tensor<?x?xi32>) -> tensor<?x?xi32> {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %0 = tensor.dim %arg0, %c0 : tensor<?x?xi32>
  %1 = tensor.dim %arg0, %c1 : tensor<?x?xi32>
  %2 = tensor.empty(%0, %1) : tensor<?x?xi32>
  %3 = linalg.generic {
    indexing_maps = [#map0, #map0, #map0],
    iterator_types = ["parallel", "parallel"] }
    ins(%arg0, %arg1  : tensor<?x?xi32>, tensor<?x?xi32>)
    outs(%2 : tensor<?x?xi32>) {
    ^bb0(%arg2: i32, %arg3: i32, %arg4: i32):
      %10 = arith.addi %arg2, %arg3 : i32
      linalg.yield %10 : i32
    } -> tensor<?x?xi32>
  %4 = linalg.generic {
    indexing_maps = [#map0, #map0],
    iterator_types = ["parallel", "parallel"] }
    ins(%3 : tensor<?x?xi32>)
    outs(%2 : tensor<?x?xi32>) {
    ^bb0(%arg2: i32, %arg3: i32):
      %idx0 = linalg.index 0 : index
      %idx1 = linalg.index 1 : index
      %5 = arith.index_cast %idx0 : index to i32
      %6 = arith.index_cast %idx1 : index to i32
      %7 = arith.addi %arg2, %5 : i32
      %8 = arith.subi %7, %6 : i32
      linalg.yield %8 : i32
    } -> tensor<?x?xi32>
  return %4 : tensor<?x?xi32>
}

// -----

#map0 = affine_map<(d0, d1) -> (d0, d1)>
func.func @indexed_producer_consumer_fusion(%arg0: tensor<?x?xi32>) -> tensor<?x?xi32> {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %0 = tensor.dim %arg0, %c0 : tensor<?x?xi32>
  %1 = tensor.dim %arg0, %c1 : tensor<?x?xi32>
  %2 = tensor.empty(%0, %1) : tensor<?x?xi32>
  %3 = linalg.generic {
    indexing_maps = [#map0, #map0],
    iterator_types = ["parallel", "parallel"] }
    ins(%arg0 : tensor<?x?xi32>)
    outs(%2 : tensor<?x?xi32>) {
    ^bb0(%arg4: i32, %arg5: i32):
      %idx0 = linalg.index 0 : index
      %idx1 = linalg.index 1 : index
      %4 = arith.index_cast %idx0 : index to i32
      %5 = arith.index_cast %idx1 : index to i32
      %6 = arith.addi %arg4, %4 : i32
      %7 = arith.subi %6, %5 : i32
      linalg.yield %7 : i32
    } -> tensor<?x?xi32>
  %4 = linalg.generic {
    indexing_maps = [#map0, #map0, #map0],
    iterator_types = ["parallel", "parallel"] }
    ins(%3, %arg0 : tensor<?x?xi32>, tensor<?x?xi32>)
    outs(%2 : tensor<?x?xi32>) {
    ^bb0(%arg2: i32, %arg3: i32, %arg4: i32):
      %10 = arith.addi %arg2, %arg3 : i32
      linalg.yield %10 : i32
    } -> tensor<?x?xi32>
  return %4 : tensor<?x?xi32>
}

// -----

// The indices of the first generic op are swapped after fusion.
#map0 = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
func.func @indexed_producer_indexed_consumer_fusion(%arg0: tensor<?x?xi32>)
                                               -> tensor<?x?xi32> {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %0 = tensor.dim %arg0, %c0 : tensor<?x?xi32>
  %1 = tensor.dim %arg0, %c1 : tensor<?x?xi32>
  %2 = tensor.empty(%0, %1) : tensor<?x?xi32>
  %3 = linalg.generic {
    indexing_maps = [#map0, #map0],
    iterator_types = ["parallel", "parallel"] }
    ins(%arg0 : tensor<?x?xi32>)
    outs(%2 : tensor<?x?xi32>) {
    ^bb0(%arg2: i32, %arg3: i32):
      %idx0 = linalg.index 0 : index
      %idx1 = linalg.index 1 : index
      %4 = arith.index_cast %idx0 : index to i32
      %5 = arith.index_cast %idx1 : index to i32
      %6 = arith.addi %arg2, %4 : i32
      %7 = arith.subi %5, %6 : i32
      linalg.yield %7 : i32
    } -> tensor<?x?xi32>
  %4= linalg.generic {
    indexing_maps = [#map1, #map1],
    iterator_types = ["parallel", "parallel"] }
    ins(%3 : tensor<?x?xi32>)
    outs(%2 : tensor<?x?xi32>) {
    ^bb0(%arg2: i32, %arg3: i32):
      %idx0 = linalg.index 0 : index
      %idx1 = linalg.index 1 : index
      %5 = arith.index_cast %idx0 : index to i32
      %6 = arith.index_cast %idx1 : index to i32
      %7 = arith.addi %arg2, %5 : i32
      %8 = arith.subi %7, %6 : i32
      linalg.yield %8 : i32
    } -> tensor<?x?xi32>
  return %4 : tensor<?x?xi32>
}

// -----

#map1 = affine_map<(d0) -> (d0)>
#map2 = affine_map<(d0, d1) -> (d0, d1)>
#map3 = affine_map<(d0, d1) -> (d1)>
func.func @one_dim_indexed_producer_consumer_fusion(%arg0 : tensor<?xi32>,
                                               %arg1 : tensor<?x?xi32>) -> tensor<?x?xi32> {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %d0 = tensor.dim %arg0, %c0 : tensor<?xi32>
  %0 = tensor.empty(%d0) : tensor<?xi32>
  %1 = linalg.generic
      {indexing_maps = [#map1, #map1],
       iterator_types = ["parallel"]}
      ins(%arg0 : tensor<?xi32>) outs(%0 : tensor<?xi32>) {
      ^bb0(%arg2 : i32, %arg3 : i32):
        %2 = linalg.index 0 : index
        %3 = arith.index_cast %2 : index to i32
        %4 = arith.addi %arg2, %3 : i32
        linalg.yield %4 : i32
      } -> tensor<?xi32>
  %2 = tensor.dim %arg1, %c0 : tensor<?x?xi32>
  %3 = tensor.dim %arg1, %c1 : tensor<?x?xi32>
  %4 = tensor.empty(%2, %3) : tensor<?x?xi32>
  %5 = linalg.generic
      {indexing_maps = [#map2, #map3, #map2],
       iterator_types = ["parallel", "parallel"]}
      ins(%arg1, %1 : tensor<?x?xi32>, tensor<?xi32>)
      outs(%4 : tensor<?x?xi32>) {
      ^bb0(%arg2 : i32, %arg3 : i32, %arg4: i32):
        %6 = arith.addi %arg2, %arg3 : i32
        linalg.yield %6 : i32
     } -> tensor<?x?xi32>
  return %5 : tensor<?x?xi32>
}

// -----

func.func @scalar_generic_fusion
  (%arg0: tensor<5x1x1xf32>, %arg1 : tensor<i32>) -> tensor<10xf32>
{
  %c0 = arith.constant 0 : index
  %cst = arith.constant dense<1.000000e+00> : tensor<10xf32>
  %0 = tensor.empty() : tensor<f32>
  %1 = linalg.generic
    {indexing_maps = [affine_map<() -> ()>, affine_map<() -> ()>],
     iterator_types = []}
    ins(%arg1 : tensor<i32>) outs(%0 : tensor<f32>) {
    ^bb0(%arg2: i32, %arg3: f32):
      %3 = arith.index_cast %arg2 : i32 to index
      %4 = tensor.extract %arg0[%3, %c0, %c0] : tensor<5x1x1xf32>
      linalg.yield %4 : f32
    } -> tensor<f32>
  %2 = tensor.empty() : tensor<10xf32>
  %3 = linalg.generic
   {indexing_maps = [affine_map<(d0) -> ()>, affine_map<(d0) -> (d0)>,
                     affine_map<(d0) -> (d0)>],
    iterator_types = ["parallel"]}
    ins(%1, %cst : tensor<f32>, tensor<10xf32>) outs(%2 : tensor<10xf32>) {
    ^bb0(%arg2: f32, %arg3: f32, %arg4: f32):
      %4 = arith.mulf %arg2, %arg3 : f32
      linalg.yield %4 : f32
    } -> tensor<10xf32>
  return %3 : tensor<10xf32>
}

// -----

func.func @constant_fusion(%arg0 : tensor<4xf32>) -> (tensor<4xf32>) {
  %cst = arith.constant dense<1.0> : tensor<4xf32>
  %1 = tensor.empty() : tensor<4xf32>
  %2 = linalg.generic
    {indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>,
                      affine_map<(d0) -> (d0)>],
     iterator_types = ["parallel"]}
    ins (%arg0, %cst : tensor<4xf32>, tensor<4xf32>)
    outs (%1 : tensor<4xf32>) {
    ^bb0(%arg1: f32, %arg2: f32, %arg3: f32):
      %3 = arith.addf %arg1, %arg2 : f32
      linalg.yield %3 : f32
    } -> tensor<4xf32>
  return %2 : tensor<4xf32>
}


// -----

#map0 = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0) -> (0, d0)>
#map2 = affine_map<(d0) -> (0)>
func.func @consumer_with_reduction(%arg0: tensor<1x10xf32>,
                              %arg1: tensor<1x10xf32>,
                              %arg2: tensor<1xf32>) -> tensor<1xf32> {
  %init = tensor.empty() : tensor<1x10xf32>
  %0 = linalg.generic
    {indexing_maps = [#map0, #map0, #map0],
     iterator_types = ["parallel", "parallel"]}
    ins(%arg0, %arg1 : tensor<1x10xf32>, tensor<1x10xf32>)
    outs(%init : tensor<1x10xf32>) {
  ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
    %2 = arith.addf %arg3, %arg4 : f32
    linalg.yield %2 : f32
  } -> tensor<1x10xf32>
  %1 = linalg.generic
    {indexing_maps = [#map1, #map2],
     iterator_types = ["reduction"]}
    ins(%0 : tensor<1x10xf32>)
    outs(%arg2 : tensor<1xf32>)  {
  ^bb0(%arg3: f32, %arg4: f32):
    %2 = arith.addf %arg3, %arg4 : f32
    linalg.yield %2 : f32
  } -> tensor<1xf32>
  return %1 : tensor<1xf32>
}

// -----

func.func @sigmoid_dynamic_dim(%0: tensor<?x1xf32>) -> tensor<?x1xf32> {
  %cp5 = arith.constant 5.000000e-01 : f32
  %c0 = arith.constant 0 : index
  %shape = shape.shape_of %0 : tensor<?x1xf32> -> tensor<?xindex>
  %extend = shape.to_extent_tensor %shape : tensor<?xindex> -> tensor<2xindex>
  %extracted = tensor.extract %extend[%c0] : tensor<2xindex>
  %init0 = tensor.empty(%extracted) : tensor<?x1xf32>
  %1 = linalg.generic {indexing_maps = [
    affine_map<(d0, d1) -> (d0, d1)>],
    iterator_types = ["parallel", "parallel"]
  }
     outs(%init0 : tensor<?x1xf32>) {
    ^bb0(%a: f32):
      linalg.yield %cp5 : f32
  } -> tensor<?x1xf32>
  %d0 = tensor.dim %0, %c0 : tensor<?x1xf32>
  %init1 = tensor.empty(%d0) : tensor<?x1xf32>
  %2 = linalg.generic {indexing_maps = [
    affine_map<(d0, d1) -> (d0, d1)>,
    affine_map<(d0, d1) -> (d0, d1)>,
    affine_map<(d0, d1) -> (d0, d1)>],
    iterator_types = ["parallel", "parallel"]
  }
      ins(%0, %1 : tensor<?x1xf32>, tensor<?x1xf32>)
     outs(%init1 : tensor<?x1xf32>) {
  ^bb0(%a: f32, %b: f32, %c: f32):
      %m = arith.mulf %a, %b : f32
      linalg.yield %m : f32
  } -> tensor<?x1xf32>
  return %2 : tensor<?x1xf32>
}

// -----

func.func private @compute1(%a: f64) -> f64
func.func private @compute2(%a: f64, %b: i32) -> i32

func.func @generic_index_op2(%arg0: tensor<1x8xf64>, %arg1: tensor<1x8xi32>) -> tensor<1x8xi32> {
  %0 = linalg.generic {
    indexing_maps = [affine_map<(i, j) -> (i, j)>],
    iterator_types = ["parallel", "parallel"]}
  outs(%arg0 : tensor<1x8xf64>) {
  ^bb0(%a: f64):
    %r = func.call @compute1(%a) : (f64) -> f64
    linalg.yield %r : f64
  } -> tensor<1x8xf64>

  %1 = linalg.generic {
    indexing_maps = [affine_map<(i, j) -> (i, j)>, affine_map<(i, j) -> (i, j)>],
    iterator_types = ["parallel", "parallel"]}
  ins(%0 : tensor<1x8xf64>)
  outs(%arg1 : tensor<1x8xi32>) {
  ^bb0(%a: f64, %b: i32):
    %r = func.call @compute2(%a, %b) : (f64, i32) -> i32
    linalg.yield %r : i32
  } -> tensor<1x8xi32>

  return %1 : tensor<1x8xi32>
}

// -----

func.func @no_fuse_constant_with_reduction() -> tensor<3xf32>
{
  %three = arith.constant dense<3.0> : tensor<3x2xf32>
  %init = tensor.empty() : tensor<3xf32>
  %result = linalg.generic {
      indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>,
                       affine_map<(d0, d1) -> (d0)>],
      iterator_types = ["parallel", "reduction"]}
     ins(%three : tensor<3x2xf32>) outs(%init : tensor<3xf32>) {
     ^bb0(%arg0 : f32, %arg1 : f32):
        %0 = arith.addf %arg0, %arg1 : f32
        linalg.yield %0 : f32
  } -> tensor<3xf32>
  return %result : tensor<3xf32>
}

// -----

#map = affine_map<(d0, d1) -> (d0, d1)>
#trait = {
  indexing_maps = [#map, #map],
  iterator_types = ["parallel", "parallel"]
}
func.func @break_outs_dependency(%arg0 : tensor<?x?xf32>) -> tensor<?x?xf32>
{
  %0 = linalg.generic #trait ins(%arg0 : tensor<?x?xf32>) outs(%arg0 : tensor<?x?xf32>) {
       ^bb0(%arg1 : f32, %arg2 : f32) :
         %1 = arith.addf %arg1, %arg1 : f32
         linalg.yield %1 : f32
       } -> tensor<?x?xf32>
  %2 = linalg.generic #trait ins(%0 : tensor<?x?xf32>) outs(%0 : tensor<?x?xf32>) {
       ^bb0(%arg1 : f32, %arg2 : f32) :
         %3 = arith.mulf %arg1, %arg1 : f32
         linalg.yield %3 : f32
       } -> tensor<?x?xf32>
  return %2 : tensor<?x?xf32>
}

// -----

func.func @fuse_scalar_constant(%arg0 : tensor<?x?xf32>) -> (tensor<?x?xf32>, tensor<?x?xi32>) {
  %cst = arith.constant 4.0 : f32
  %c42 = arith.constant 42 : i32
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %d0 = tensor.dim %arg0, %c0 : tensor<?x?xf32>
  %d1 = tensor.dim %arg0, %c1 : tensor<?x?xf32>
  %0 = tensor.empty(%d0, %d1) : tensor<?x?xf32>
  %1 = tensor.empty(%d0, %d1) : tensor<?x?xi32>
  %2:2 = linalg.generic {
      indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>,
                       affine_map<(d0, d1) -> ()>,
                       affine_map<(d0, d1) -> ()>,
                       affine_map<(d0, d1) -> (d0, d1)>,
                       affine_map<(d0, d1) -> (d0, d1)>],
      iterator_types = ["parallel", "parallel"]}
      ins(%arg0, %cst, %c42 : tensor<?x?xf32>, f32, i32)
      outs(%0, %1 : tensor<?x?xf32>, tensor<?x?xi32>) {
      ^bb0(%arg1 : f32, %arg2 : f32, %arg3 : i32, %arg4 : f32, %arg5 : i32) :
        %3 = arith.addf %arg1, %arg2 : f32
        linalg.yield %3, %arg3 : f32, i32
      } -> (tensor<?x?xf32>, tensor<?x?xi32>)
  return %2#0, %2#1 : tensor<?x?xf32>, tensor<?x?xi32>
}

// -----

// Fusing the broadcast into a reduction would require to insert extra knowledge
// about the size of the reduction dimension. As long, as this is not
// implemented, we check that two linalg operations remain.

#map0 = affine_map<(d0, d1) -> ()>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#map2 = affine_map<(d0, d1) -> (d1, d0)>
#map3 = affine_map<(d0, d1) -> (d0)>

func.func @no_fusion_missing_reduction_shape(%arg0: tensor<f32>, %arg1: index) -> tensor<?xf32> {
  %cst = arith.constant 0xFF800000 : f32
  %4 = tensor.empty(%arg1, %arg1) : tensor<?x?xf32>
  %5 = linalg.generic {
    indexing_maps = [#map0, #map1],
    iterator_types = ["parallel", "parallel"]
  } ins(%arg0 : tensor<f32>) outs(%4 : tensor<?x?xf32>) {
  ^bb0(%arg2: f32, %arg3: f32):
    linalg.yield %arg2 : f32
  } -> tensor<?x?xf32>
  %6 = tensor.empty(%arg1) : tensor<?xf32>
  %7 = linalg.fill ins(%cst : f32) outs(%6 : tensor<?xf32>) -> tensor<?xf32>
  %8 = linalg.generic {
    indexing_maps = [#map2, #map3],
    iterator_types = ["parallel", "reduction"]
  } ins(%5 : tensor<?x?xf32>) outs(%7 : tensor<?xf32>) {
  ^bb0(%arg2: f32, %arg3: f32):
    %9 = arith.maximumf %arg2, %arg3 : f32
    linalg.yield %9 : f32
  } -> tensor<?xf32>
  return %8 : tensor<?xf32>
}

// -----

func.func @fusion_different_axes(%arg0 : tensor<5000xi64>, %arg1 : tensor<5000xi32>) -> tensor<5000xi32> {
  %c1_i32 = arith.constant 1 : i32
  %0 = linalg.generic {
        indexing_maps = [affine_map<(d0) -> (d0)>],
        iterator_types = ["parallel"]}
        outs(%arg0 : tensor<5000xi64>) {
        ^bb0(%arg3: i64):  // no predecessors
          %22 = linalg.index 0 : index
          %23 = arith.index_cast %22 : index to i64
          linalg.yield %23 : i64
        } -> tensor<5000xi64>
  %1 = tensor.empty() : tensor<5000xi32>
  %2 = linalg.generic {
        indexing_maps = [affine_map<(d0, d1) -> (d0)>, affine_map<(d0, d1) -> (d1)>],
        iterator_types = ["parallel", "parallel"]}
        ins(%0 : tensor<5000xi64>) outs(%1 : tensor<5000xi32>) {
        ^bb0(%arg3: i64, %arg5: i32):  // no predecessors
          %22 = arith.index_cast %arg3 : i64 to index
          %23 = tensor.extract %arg1[%22] : tensor<5000xi32>
          linalg.yield %23 : i32
        } -> tensor<5000xi32>
  return %2 : tensor<5000xi32>
}

// -----

func.func @fusion_different_axes_indexed(%arg0: tensor<2x2xi32>) ->  tensor<2xi32> {
  %0 = tensor.empty() : tensor<2x2xi32>
  %1 = linalg.generic {
        indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>],
        iterator_types = ["parallel", "parallel"]}
        ins(%arg0 : tensor<2x2xi32>) outs(%0 : tensor<2x2xi32>) {
          ^bb0(%in: i32, %out: i32):
            %2 = linalg.index 1 : index
            %3 = arith.index_cast %2 : index to i32
            linalg.yield %3 : i32
        } -> tensor<2x2xi32>
  %4 = tensor.empty() : tensor<2xi32>
  %5 = linalg.generic {
        indexing_maps = [affine_map<(d0) -> (d0, 1)>, affine_map<(d0) -> (d0)>],
        iterator_types = ["parallel"]}
        ins(%1 : tensor<2x2xi32>) outs(%4 : tensor<2xi32>) {
          ^bb0(%in: i32, %out: i32):
            linalg.yield %in : i32
        } -> tensor<2xi32>
  return %5 : tensor<2xi32>
}


// -----

#map0 = affine_map<(d0) -> (d0)>
func.func @fold_fill_generic_basic(%arg0: tensor<?xf32>) -> (tensor<?xf32>) {
  %c0 = arith.constant 0 : index
  %cst = arith.constant 7.0 : f32
  %0 = tensor.dim %arg0, %c0 : tensor<?xf32>
  %1 = tensor.empty(%0) : tensor<?xf32>
  %2 = linalg.fill ins(%cst : f32) outs(%1 : tensor<?xf32>) -> tensor<?xf32>
  %3 = tensor.empty(%0) : tensor<?xf32>
  %4 = linalg.generic {indexing_maps = [#map0, #map0, #map0], iterator_types=["parallel"]} ins(%arg0, %2 : tensor<?xf32>, tensor<?xf32>) outs (%3:tensor<?xf32>) {
  ^bb0(%arg1: f32, %arg2: f32, %arg3: f32):
    %5 = arith.addf  %arg1, %arg2 : f32
        linalg.yield %5 : f32
  } -> tensor<?xf32>
  return %4 : tensor<?xf32>
}

// -----

#map0 = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1, d0)>
func.func @fold_fill_generic_mixedaccess(%arg0: tensor<?x?xf32>) -> (tensor<?x?xf32>) {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 0 : index
  %cst1 = arith.constant 7.0 : f32
  %cst2 = arith.constant 6.0 : f32
  %0 = tensor.dim %arg0, %c0 : tensor<?x?xf32>
  %1 = tensor.dim %arg0, %c1 : tensor<?x?xf32>
  %2 = tensor.empty(%0, %1) : tensor<?x?xf32>
  %3 = linalg.fill ins(%cst1 : f32) outs(%2 : tensor<?x?xf32>) -> tensor<?x?xf32>
  %4 = tensor.empty(%1, %0) : tensor<?x?xf32>
  %5 = linalg.fill ins(%cst2 : f32) outs(%4 : tensor<?x?xf32>) -> tensor<?x?xf32>
  %6 = tensor.empty(%0, %1) : tensor<?x?xf32>
  %7 = linalg.generic {indexing_maps = [#map0, #map1, #map0], iterator_types=["parallel","parallel"]} ins(%3, %5 : tensor<?x?xf32>, tensor<?x?xf32>) outs (%6:tensor<?x?xf32>) {
  ^bb0(%arg1: f32, %arg2: f32, %arg3: f32):
    %8 = arith.divf  %arg1, %arg2 : f32
        linalg.yield %8 : f32
  } -> tensor<?x?xf32>
  return %7 : tensor<?x?xf32>
}

// -----

#map = affine_map<() -> ()>
module {
  func.func @fuse_multi_result_producer(%arg0: tensor<f32>, %arg1: tensor<f32>, %arg2: tensor<f32>, %arg3: tensor<f32>, %arg4: tensor<f32>) -> tensor<f32> {
    %0 = tensor.empty() : tensor<f32>
    %1 = tensor.empty() : tensor<f32>
    %2:2 = linalg.generic {
      indexing_maps = [#map, #map, #map, #map, #map], iterator_types = []}
      ins(%arg0, %arg1, %arg1 : tensor<f32>, tensor<f32>, tensor<f32>) outs(%0, %1 : tensor<f32>, tensor<f32>) {
    ^bb0(%arg5: f32, %arg6: f32, %arg7: f32, %arg8: f32, %arg9: f32):
      %4 = arith.addf %arg5, %arg6 : f32
      %5 = arith.addf %4, %arg7 : f32
      linalg.yield %4, %5 : f32, f32
    } -> (tensor<f32>, tensor<f32>)
    %3 = linalg.generic {
      indexing_maps = [#map, #map, #map], iterator_types = []}
      ins(%2#1, %arg1 : tensor<f32>, tensor<f32>) outs(%arg4 : tensor<f32>) {
    ^bb0(%arg5: f32, %arg6: f32, %arg7: f32):
      %4 = arith.addf %arg5, %arg6 : f32
      %5 = arith.addf %4, %arg6 : f32
      linalg.yield %5 : f32
    } -> tensor<f32>
    return %3 : tensor<f32>
  }
}

// -----

// In this test we expect the first two linalg.generic operations to be fused into one, but the third one (the matmul) to remain separate. 
// The reason is that when the pattern is applied the 1st time, the fusion of the first two operations produces a fused operation with 
// an additional result and ana dditional output indexing map that is not a permutation / not invertible. 
// The fused op will still produce also the original result (and its output indexing map), which is preserved because the new indexing map 
// is not invertible. Thus the fused op will have 2 results, but only the 2nd one will be used by the following matmul op as an input argument.
// When trying to apply the fusion pattern again, the matmul op won't be fused because the operand to fuse was not produced with an invertible indexing map.

#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0 * 4 + d1 * 2 + d2 + d3, 0, 0, 0)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d6)>
#map3 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d3, d4, d5, d6)>
#map4 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3, d4, d5)>
module {
  func.func @fuse_only_as_long_as_result_map_is_permutation(%arg0: tensor<1x1x2x1xf32>, %arg1: tensor<1x1x2x1xf32>) -> tensor<1x1x2x4xf32> {
    %c2 = arith.constant 2 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %0 = tensor.empty() : tensor<1x2x2x1xf32>
    %1 = linalg.generic {indexing_maps = [#map], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} outs(%0 : tensor<1x2x2x1xf32>) {
    ^bb0(%out: f32):
      %6 = linalg.index 1 : index
      %7 = linalg.index 2 : index
      %8 = arith.cmpi ult, %6, %c1 : index
      %9 = arith.cmpi ult, %7, %c2 : index
      %10 = arith.andi %8, %9 : i1
      %11 = scf.if %10 -> (f32) {
        %extracted = tensor.extract %arg1[%c0, %6, %7, %c0] : tensor<1x1x2x1xf32>
        scf.yield %extracted : f32
      } else {
        scf.yield %cst : f32
      }
      linalg.yield %11 : f32
    } -> tensor<1x2x2x1xf32>
    %2 = tensor.empty() : tensor<4x1x1x1xf32>
    %3 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%1 : tensor<1x2x2x1xf32>) outs(%2 : tensor<4x1x1x1xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<4x1x1x1xf32>
    %4 = tensor.empty() : tensor<1x1x2x4xf32>
    %expanded = tensor.expand_shape %4 [[0], [1], [2], [3, 4, 5]] output_shape [1, 1, 2, 4, 1, 1] : tensor<1x1x2x4xf32> into tensor<1x1x2x4x1x1xf32>
    %5 = linalg.generic {indexing_maps = [#map2, #map3, #map4], iterator_types = ["parallel", "parallel", "parallel", "parallel", "parallel", "parallel", "reduction"]} ins(%arg0, %3 : tensor<1x1x2x1xf32>, tensor<4x1x1x1xf32>) outs(%expanded : tensor<1x1x2x4x1x1xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %6 = arith.mulf %in, %in_0 : f32
      %7 = arith.addf %6, %out : f32
      linalg.yield %7 : f32
    } -> tensor<1x1x2x4x1x1xf32>
    %collapsed = tensor.collapse_shape %5 [[0], [1], [2], [3, 4, 5]] : tensor<1x1x2x4x1x1xf32> into tensor<1x1x2x4xf32>
    return %collapsed : tensor<1x1x2x4xf32>
  }
}
