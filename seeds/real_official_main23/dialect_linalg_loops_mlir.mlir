// Test that we can lower all the way to LLVM without crashing, don't check results here.



func.func @matmul(%arg0: memref<?xi8>, %M: index, %N: index, %K: index) {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %A = memref.view %arg0[%c0][%M, %K] : memref<?xi8> to memref<?x?xf32>
  %B = memref.view %arg0[%c0][%K, %N] : memref<?xi8> to memref<?x?xf32>
  %C = memref.view %arg0[%c0][%M, %N] : memref<?xi8> to memref<?x?xf32>
  linalg.matmul ins(%A, %B: memref<?x?xf32>, memref<?x?xf32>)
               outs(%C: memref<?x?xf32>)
  return
}




func.func @matvec(%arg0: memref<?xi8>, %M: index, %N: index) {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %2 = memref.view %arg0[%c0][%M, %N] : memref<?xi8> to memref<?x?xf32>
  %3 = memref.view %arg0[%c0][%M] : memref<?xi8> to memref<?xf32>
  %4 = memref.view %arg0[%c0][%N] : memref<?xi8> to memref<?xf32>
  linalg.matvec ins(%2, %3: memref<?x?xf32>, memref<?xf32>)
               outs(%4 : memref<?xf32>)
  return
}



func.func @dot(%arg0: memref<?xi8>, %M: index) {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %1 = memref.view %arg0[%c0][%M] : memref<?xi8> to memref<?xf32>
  %2 = memref.view %arg0[%c0][%M] : memref<?xi8> to memref<?xf32>
  %3 = memref.view %arg0[%c0][] : memref<?xi8> to memref<f32>
  linalg.dot ins(%1, %2 : memref<?xf32>, memref<?xf32>)
            outs(%3 : memref<f32>)
  return
}



func.func @dot_int(%arg0: memref<?xi32>, %arg1: memref<?xi32>,
                   %arg3: memref<i32>) {
  // Verifies that we use the correct arith operations for integers.
  linalg.dot ins(%arg0, %arg1 : memref<?xi32>, memref<?xi32>)
             outs(%arg3 : memref<i32>)
  return
}


func.func @dot_bool(%arg0: memref<?xi1>, %arg1: memref<?xi1>,
                    %arg3: memref<i1>) {
  // Verifies that we use the correct (saturating) arith operations for booleans.
  linalg.dot ins(%arg0, %arg1 : memref<?xi1>, memref<?xi1>)
             outs(%arg3 : memref<i1>)
  return
}


func.func @dot_view(%arg0: memref<?xf32, strided<[1], offset: ?>>, %arg1: memref<?xf32, strided<[1], offset: ?>>, %arg2: memref<f32>) {
  linalg.dot ins(%arg0, %arg1 : memref<?xf32, strided<[1], offset: ?>>,
                                memref<?xf32, strided<[1], offset: ?>>)
            outs(%arg2:  memref<f32>)
  return
}


func.func @fill_view(%arg0: memref<?xf32, strided<[1], offset: ?>>, %arg1: f32) {
  linalg.fill ins(%arg1 : f32) outs(%arg0 : memref<?xf32, strided<[1], offset: ?>>)
  return
}


func.func @fill_view0(%arg0: memref<f32>, %arg1: f32) {
  linalg.fill ins(%arg1 : f32) outs(%arg0 : memref<f32>)
  return
}


func.func @fill_view3(%arg0: memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>>, %arg1: f32) {
  linalg.fill ins(%arg1 : f32) outs(%arg0 : memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>>)
  return
}


func.func @copy_view(%arg0: memref<?xf32, strided<[1], offset: ?>>, %arg1: memref<?xf32, strided<[1], offset: ?>>) {
  linalg.generic {
    iterator_types = ["parallel"],
    indexing_maps = [ affine_map<(i) -> (i)>, affine_map<(i) -> (i)>] }
    ins(%arg0: memref<?xf32, strided<[1], offset: ?>>)
   outs(%arg1: memref<?xf32, strided<[1], offset: ?>>) {
    ^bb0(%a: f32, %b: f32):
      linalg.yield %a : f32
  }
  return
}


#accesses = [
  affine_map<(i, j, k) -> (i, j)>,
  affine_map<(i, j, k) -> (i, j, k)>,
  affine_map<(i, j, k) -> (i, k, j)>
]
#trait2 = {
  iterator_types = ["parallel", "parallel", "parallel"],
  indexing_maps = #accesses,
  library_call = "some_external_function_name_2",
  doc = "B(i,j,k), C(i,k,j) = foo(A(i, j), B(i,j,k), C(i,k,j))"
}
func.func @generic_region(%arg0: memref<?x?xf32, strided<[?, 1], offset: ?>>, %arg1: memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>>, %arg2: memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>>) {
  linalg.generic #trait2
    ins(%arg0: memref<?x?xf32, strided<[?, 1], offset: ?>>)
   outs(%arg1, %arg2 : memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>>,
                       memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>>) {
    ^bb0(%a: f32, %b: f32, %c: f32):
      %d = arith.mulf %a, %b : f32
      %e = arith.addf %c, %d : f32
      linalg.yield %d, %e : f32, f32
  }
  return
}


#trait4 = {
  iterator_types = ["parallel", "parallel", "parallel"],
  indexing_maps = #accesses,
  library_call = "some_external_function_name_2",
  doc = "B(i,j,k), C(i,k,j) = foo(A(i, j) * B(i,j,k), i * j * k + C(i,k,j))"
}
func.func @generic_index_region(
        %arg0: memref<?x?xf32, strided<[?, 1], offset: ?>>,
        %arg1: memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>>,
        %arg2: memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>>) {
  linalg.generic #trait4
      ins(%arg0 : memref<?x?xf32, strided<[?, 1], offset: ?>>)
     outs(%arg1, %arg2 : memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>>,
                         memref<?x?x?xf32, strided<[?, ?, 1], offset: ?>>) {
    ^bb0(%a: f32, %b: f32, %c: f32):
      %i = linalg.index 0 : index
      %j = linalg.index 1 : index
      %k = linalg.index 2 : index
      %result_1 = arith.mulf %a, %b : f32

      %ij = arith.addi %i, %j : index
      %ijk = arith.addi %ij, %k : index
      %ijk_int = arith.index_cast %ijk : index to i32
      %ijk_float = arith.sitofp %ijk_int : i32 to f32

      %result_2 = arith.addf %c, %ijk_float : f32
      linalg.yield %result_1, %result_2 : f32, f32
  }
  return
}



// -----

#broadcast_access = [
  affine_map<(i, j) -> ()>,
  affine_map<(i, j) -> (i, j)>
]

#trait_broadcast = {
  indexing_maps = #broadcast_access,
  iterator_types = ["parallel", "parallel"],
  library_call = "some_broadcast_external_fn"
}

func.func @generic_op_zero_rank(%arg0: memref<f32>, %arg1: memref<3x4xf32>)
{
  linalg.generic #trait_broadcast
      ins(%arg0 : memref<f32>)
     outs(%arg1 : memref<3x4xf32>) {
    ^bb(%a: f32, %b: f32) :
      linalg.yield %a : f32
  }
  return
}



func.func @generic_op_scalar(%arg0: f32, %arg1: memref<3x4xf32>)
{
  linalg.generic #trait_broadcast
      ins(%arg0 : f32)
     outs(%arg1 : memref<3x4xf32>) {
    ^bb(%a: f32, %b: f32) :
      linalg.yield %a : f32
  }
  return
}



func.func @generic_index_op_zero_rank(%arg0: memref<i32>, %arg1: memref<3x4xi32>)
{
  linalg.generic #trait_broadcast
      ins(%arg0 : memref<i32>)
     outs(%arg1 : memref<3x4xi32>) {
    ^bb(%a: i32, %b: i32) :
      %i = linalg.index 0 : index
      %j = linalg.index 1 : index
      %ij = arith.addi %i, %j : index
      %ij_int = arith.index_cast %ij : index to i32
      %result = arith.addi %a, %ij_int : i32
      linalg.yield %result : i32
  }
  return
}



#reduce_1D_access = [
  affine_map<(i) -> (i)>,
  affine_map<(i) -> ()>
]

#trait_reduce_1D = {
  indexing_maps = #reduce_1D_access,
  iterator_types = ["reduction"],
  library_call = "some_reduce_external_fn"
}

func.func @generic_op_1D_reduce(%arg0: memref<?xf32>, %arg1: memref<f32>)
{
  linalg.generic #trait_reduce_1D
      ins(%arg0 : memref<?xf32>)
     outs(%arg1 : memref<f32>) {
    ^bb(%a: f32, %b: f32) :
      %0 = arith.addf %a, %b : f32
      linalg.yield %0 : f32
  }
  return
}



#reduce_init_1D_access = [
  affine_map<(i) -> (i)>,
  affine_map<(i) -> ()>,
  affine_map<(i) -> ()>
]

#trait_reduce_init_1D = {
  indexing_maps = #reduce_init_1D_access,
  iterator_types = ["reduction"],
  library_call = "some_reduce_external_fn"
}

func.func @generic_index_op_1D_reduce(%arg0: memref<?xf32>,
                                %arg1: memref<f32>,
                                %arg2: memref<f32>)
{
  linalg.generic #trait_reduce_init_1D
      ins(%arg0, %arg1 : memref<?xf32>, memref<f32>)
     outs(%arg2 : memref<f32>) {
    ^bb(%a: f32, %b: f32, %c: f32) :
      %i = linalg.index 0 : index
      %0 = arith.constant 0 : index
      %1 = arith.cmpi eq, %0, %i : index
      %2 = arith.select %1, %b, %c : f32
      %3 = arith.addf %a, %2 : f32
      linalg.yield %3 : f32
  }
  return
}


#trait_const_fill = {
  indexing_maps = [affine_map<(i) -> (i)>],
  iterator_types = ["parallel"],
  library_call = "some_external_fn"
}
func.func @generic_const_init(%arg0: memref<?xf32>) {
        %cst = arith.constant 1.0 : f32
  linalg.generic #trait_const_fill outs(%arg0 : memref<?xf32>) {
    ^bb0(%arg1: f32):
      linalg.yield %cst : f32
    }
    return
}


#scalar_access = [
  affine_map<() -> ()>,
  affine_map<() -> ()>,
  affine_map<() -> ()>
]
#scalar_trait = {
  iterator_types = [],
  indexing_maps = #scalar_access,
  library_call = "some_external_fn"
}
func.func @scalar_code(%arg0: memref<f32>, %arg1 : memref<f32>, %arg2 : memref<f32>, %arg3 : i1)
{
  linalg.generic #scalar_trait
    ins(%arg0, %arg1 : memref<f32>, memref<f32>)
   outs(%arg2 : memref<f32>) {
  ^bb(%a : f32, %b : f32, %c : f32) :
    %result = scf.if %arg3 -> (f32) {
      scf.yield %a : f32
    } else {
      scf.yield %b : f32
    }
    linalg.yield %result : f32
  }
  return
}


//----------------------------------------------------------------------------//
// Named ops to loops.
//----------------------------------------------------------------------------//
func.func @batch_reduce_matmul_as_contract(
    %A: memref<?x?x?xf32>, %B: memref<?x?x?xf32>, %C: memref<?x?xf32>) {
  linalg.contract
      indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>,
                       affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>,
                       affine_map<(d0, d1, d2, d3) -> (d1, d2)>]
      ins(%A, %B : memref<?x?x?xf32>, memref<?x?x?xf32>)
      outs(%C : memref<?x?xf32>)
  return
}


func.func @named_batch_matmul(%A: memref<?x?x?xf32>, %B: memref<?x?x?xf32>, %C: memref<?x?x?xf32>) {
  linalg.batch_matmul ins(%A, %B : memref<?x?x?xf32>, memref<?x?x?xf32>)
                     outs(%C : memref<?x?x?xf32>)
  return
}



func.func @conv1d_no_symbols(%in : memref<?xf32>, %filter : memref<?xf32>, %out : memref<?xf32>) -> () {
  linalg.conv_1d ins(%in, %filter : memref<?xf32>, memref<?xf32>)
                outs(%out : memref<?xf32>)
  return
}




func.func @conv2d_no_symbols(%in : memref<?x?xf32>, %filter : memref<?x?xf32>, %out : memref<?x?xf32>) -> () {
  linalg.conv_2d ins(%in, %filter : memref<?x?xf32>, memref<?x?xf32>)
                outs(%out: memref<?x?xf32>)
  return
}





func.func @conv3d_no_symbols(%in : memref<?x?x?xf32>, %filter : memref<?x?x?xf32>, %out : memref<?x?x?xf32>) -> () {
  linalg.conv_3d ins(%in, %filter : memref<?x?x?xf32>, memref<?x?x?xf32>)
                outs(%out : memref<?x?x?xf32>)
  return
}





// -----

func.func @lower_to_loops_with_rank_reducing_subviews(
    %arg0 : memref<?xi32>, %arg1 : memref<?x?xi32>, %arg2 : index,
    %arg3 : index, %arg4 : index) {
  %0 = memref.subview %arg0[%arg2] [%arg3] [1]
      : memref<?xi32> to memref<?xi32, strided<[1], offset: ?>>
  %1 = memref.subview %arg1[0, %arg4] [1, %arg3] [1, 1]
      : memref<?x?xi32> to memref<?xi32, strided<[1], offset: ?>>
  linalg.generic {
    iterator_types = ["parallel"],
    indexing_maps = [affine_map<(i) -> (i)>, affine_map<(i) -> (i)>]}
    ins(%0: memref<?xi32, strided<[1], offset: ?>>)
   outs(%1: memref<?xi32, strided<[1], offset: ?>>) {
    ^bb0(%a: i32, %b: i32):
      linalg.yield %a : i32
  }
  return
}


// -----

func.func @transpose(%input: memref<?xf32>,
                     %init: memref<?xf32>) {
  linalg.transpose ins(%input:memref<?xf32>)
                   outs(%init:memref<?xf32>)
                   permutation = [0]
  return
}
