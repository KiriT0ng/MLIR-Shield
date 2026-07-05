func.func @generalize_matmul_buffer(%A : memref<16x8xf32>, %B: memref<8x32xf32>, %C: memref<16x32xf32>) {
  linalg.matmul ins(%A, %B: memref<16x8xf32>, memref<8x32xf32>)
               outs(%C: memref<16x32xf32>)
  return
}






// -----

func.func @matmul_bcast_a(%arg0: memref<5xf32>, %arg1: memref<5x7xf32>, %arg2: memref<3x7xf32>) {
  linalg.matmul indexing_maps = [
                       affine_map<(d0, d1, d2) -> (d2)>,
                       affine_map<(d0, d1, d2) -> (d2, d1)>,
                       affine_map<(d0, d1, d2) -> (d0, d1)>
                     ]
                     ins(%arg0, %arg1 : memref<5xf32>, memref<5x7xf32>) outs(%arg2: memref<3x7xf32>)
  return
}


// -----

func.func @generalize_matmul_tensor(%A : tensor<16x8xf32>, %B: tensor<8x32xf32>, %C: tensor<16x32xf32>) -> tensor<16x32xf32> {
  %0 = linalg.matmul ins(%A, %B: tensor<16x8xf32>, tensor<8x32xf32>)
                    outs(%C: tensor<16x32xf32>) -> tensor<16x32xf32>
  return %0: tensor<16x32xf32>
}




// -----

func.func @generalize_matmul_tensor_complex(%A : tensor<16x8xcomplex<f32>>,
                                            %B: tensor<8x32xcomplex<f32>>,
                                            %C: tensor<16x32xcomplex<f32>>)
          -> tensor<16x32xcomplex<f32>> {
  %0 = linalg.matmul ins(%A, %B: tensor<16x8xcomplex<f32>>, tensor<8x32xcomplex<f32>>)
                    outs(%C: tensor<16x32xcomplex<f32>>) -> tensor<16x32xcomplex<f32>>
  return %0: tensor<16x32xcomplex<f32>>
}




// -----

func.func @depthwise_conv_2d_nhwc_hwcm(%input: memref<2x4x5x2xf32>, %filter: memref<2x2x2x3xf32>, %output: memref<2x3x4x2x3xf32>) {
  linalg.depthwise_conv_2d_nhwc_hwcm
     { dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64> }
     ins(%input, %filter : memref<2x4x5x2xf32>, memref<2x2x2x3xf32>)
    outs(%output : memref<2x3x4x2x3xf32>)
  return
}





// -----

func.func @depthwise_conv_2d_nhwc_hwcm(%input: memref<2x4x5x2xf32>, %filter: memref<2x2x2x3xf32>, %output: memref<2x2x3x2x3xf32>) {
  linalg.depthwise_conv_2d_nhwc_hwcm
     { dilations = dense<2> : tensor<2xi64>, strides = dense<1> : tensor<2xi64> }
     ins(%input, %filter : memref<2x4x5x2xf32>, memref<2x2x2x3xf32>)
    outs(%output : memref<2x2x3x2x3xf32>)
  return
}





// -----

func.func @depthwise_conv_2d_nhwc_hwc(%input: memref<1x113x113x96xf32>, %filter: memref<3x3x96xf32>, %output: memref<1x56x56x96xf32>) {
  linalg.depthwise_conv_2d_nhwc_hwc {dilations = dense<1> : vector<2xi64>, strides = dense<2> : vector<2xi64>}
    ins(%input, %filter: memref<1x113x113x96xf32>, memref<3x3x96xf32>)
    outs(%output: memref<1x56x56x96xf32>)
  return
}





// -----

func.func @conv_1d_nwc_wcf(%input: memref<?x?x?xf32>, %filter: memref<?x?x?xf32>, %output: memref<?x?x?xf32>) {
  linalg.conv_1d_nwc_wcf {dilations = dense<1> : tensor<1xi64>,
                                       strides = dense<1> : tensor<1xi64>}
     ins (%input, %filter: memref<?x?x?xf32>, memref<?x?x?xf32>)
    outs (%output: memref<?x?x?xf32>)
  return
}




// -----

func.func @conv_1d_ncw_fcw(%input: memref<?x?x?xf32>, %filter: memref<?x?x?xf32>, %output: memref<?x?x?xf32>) {
  linalg.conv_1d_ncw_fcw {dilations = dense<1> : tensor<1xi64>,
                                       strides = dense<1> : tensor<1xi64>}
     ins (%input, %filter: memref<?x?x?xf32>, memref<?x?x?xf32>)
    outs (%output: memref<?x?x?xf32>)
  return
}




// -----

func.func @conv_2d_ngchw_gfchw_q(%input: memref<?x?x?x?x?xi8>, %filter: memref<?x?x?x?x?xi8>, %inputzp: i32, %filterzp: i32, %output: memref<?x?x?x?x?xi32>) {
  linalg.conv_2d_ngchw_gfchw_q {dilations = dense<1> : tensor<2xi64>,
                                       strides = dense<1> : tensor<2xi64>}
     ins (%input, %filter, %inputzp, %filterzp: memref<?x?x?x?x?xi8>, memref<?x?x?x?x?xi8>, i32, i32)
    outs (%output: memref<?x?x?x?x?xi32>)
  return
}




// -----

func.func @generalize_fill(%output: memref<?x?xf32>, %value : f32) {
  linalg.fill ins(%value : f32) outs(%output : memref<?x?xf32>)
  return
}





// -----

func.func @generalize_batch_matm_vec(%lhs : memref<?x?x?xi8>, %rhs: memref<?x?xi8>,  %out: memref<?x?xf32>) {
  linalg.batch_matvec ins(%lhs, %rhs: memref<?x?x?xi8>, memref<?x?xi8>)
                     outs(%out: memref<?x?xf32>)
  return
}



// -----

func.func @generalize_batch_vecmat(%lhs : memref<?x?xi8>, %rhs: memref<?x?x?xi8>,  %out: memref<?x?xf32>) {
  linalg.batch_vecmat ins(%lhs, %rhs: memref<?x?xi8>, memref<?x?x?xi8>)
                     outs(%out: memref<?x?xf32>)
  return
}



// -----

func.func @batch_reduce_gemm(%lhs: memref<7x8x9xf32>, %rhs: memref<7x9x8xf32>, %out: memref<8x8xf32>) {
  linalg.batch_reduce_matmul ins(%lhs, %rhs: memref<7x8x9xf32>, memref<7x9x8xf32>)
                             outs(%out: memref<8x8xf32>)
  return
}




// -----

func.func @generalize_batch_reduce_gemm_bf16(%lhs: memref<7x8x9xbf16>, %rhs: memref<7x9x8xbf16>, %out: memref<8x8xf32>) {
  linalg.batch_reduce_matmul ins(%lhs, %rhs: memref<7x8x9xbf16>, memref<7x9x8xbf16>)
                             outs(%out: memref<8x8xf32>)
  return
}





// -----

func.func @generalize_linalg_map(%arg0: memref<1x8x8x8xf32>, %arg1: memref<1x8x8x8xf32>, %arg2: memref<1x8x8x8xf32>) {
  %cst = arith.constant 0.000000e+00 : f32
  linalg.map {arith.addf} ins(%arg0, %arg1: memref<1x8x8x8xf32>, memref<1x8x8x8xf32>) outs(%arg2 : memref<1x8x8x8xf32>)
  return
}




// -----

func.func @generalize_add(%lhs: memref<7x14x21xf32>, %rhs: memref<7x14x21xf32>,
                          %out: memref<7x14x21xf32>) {
  linalg.add ins(%lhs, %rhs : memref<7x14x21xf32>, memref<7x14x21xf32>)
             outs(%out : memref<7x14x21xf32>)
  return
}





// -----

func.func @generalize_sub(%lhs: memref<7x14x21xf32>, %rhs: memref<7x14x21xf32>,
                          %out: memref<7x14x21xf32>) {
  linalg.sub ins(%lhs, %rhs : memref<7x14x21xf32>, memref<7x14x21xf32>)
             outs(%out : memref<7x14x21xf32>)
  return
}





// -----

func.func @generalize_mul(%lhs: memref<7x14x21xf32>, %rhs: memref<7x14x21xf32>,
                          %out: memref<7x14x21xf32>) {
  linalg.mul ins(%lhs, %rhs : memref<7x14x21xf32>, memref<7x14x21xf32>)
             outs(%out : memref<7x14x21xf32>)
  return
}





// -----

func.func @generalize_div(%lhs: memref<7x14x21xf32>, %rhs: memref<7x14x21xf32>,
                          %out: memref<7x14x21xf32>) {
  linalg.div ins(%lhs, %rhs : memref<7x14x21xf32>, memref<7x14x21xf32>)
             outs(%out : memref<7x14x21xf32>)
  return
}





// -----

func.func @generalize_divu(%lhs: memref<7x14x21xi32>, %rhs: memref<7x14x21xi32>,
                          %out: memref<7x14x21xi32>) {
  linalg.div_unsigned ins(%lhs, %rhs : memref<7x14x21xi32>, memref<7x14x21xi32>)
             outs(%out : memref<7x14x21xi32>)
  return
}





// -----

func.func @generalize_exp(%arg: memref<7x14x21xf32>, %out: memref<7x14x21xf32>) {
  linalg.exp ins(%arg : memref<7x14x21xf32>) outs(%out : memref<7x14x21xf32>)
  return
}





// -----

func.func @generalize_log(%arg: memref<7x14x21xf32>, %out: memref<7x14x21xf32>) {
  linalg.log ins(%arg : memref<7x14x21xf32>) outs(%out : memref<7x14x21xf32>)
  return
}





// -----

func.func @generalize_abs(%arg: memref<7x14x21xf32>, %out: memref<7x14x21xf32>) {
  linalg.abs ins(%arg : memref<7x14x21xf32>) outs(%out : memref<7x14x21xf32>)
  return
}





// -----

func.func @generalize_ceil(%arg: memref<7x14x21xf32>, %out: memref<7x14x21xf32>) {
  linalg.ceil ins(%arg : memref<7x14x21xf32>) outs(%out : memref<7x14x21xf32>)
  return
}





// -----

func.func @generalize_floor(%arg: memref<7x14x21xf32>, %out: memref<7x14x21xf32>) {
  linalg.floor ins(%arg : memref<7x14x21xf32>) outs(%out : memref<7x14x21xf32>)
  return
}





// -----

func.func @generalize_negf(%arg: memref<7x14x21xf32>, %out: memref<7x14x21xf32>) {
  linalg.negf ins(%arg : memref<7x14x21xf32>) outs(%out : memref<7x14x21xf32>)
  return
}





// -----

func.func @generalize_reciprocal(%arg: memref<7x14x21xf32>, %out: memref<7x14x21xf32>) {
  linalg.reciprocal ins(%arg : memref<7x14x21xf32>) outs(%out : memref<7x14x21xf32>)
  return
}






// -----

func.func @generalize_round(%arg: memref<7x14x21xf32>, %out: memref<7x14x21xf32>) {
  linalg.round ins(%arg : memref<7x14x21xf32>) outs(%out : memref<7x14x21xf32>)
  return
}





// -----

func.func @generalize_sqrt(%arg: memref<7x14x21xf32>, %out: memref<7x14x21xf32>) {
  linalg.sqrt ins(%arg : memref<7x14x21xf32>) outs(%out : memref<7x14x21xf32>)
  return
}





// -----

func.func @generalize_rsqrt(%arg: memref<7x14x21xf32>, %out: memref<7x14x21xf32>) {
  linalg.rsqrt ins(%arg : memref<7x14x21xf32>) outs(%out : memref<7x14x21xf32>)
  return
}





// -----

func.func @generalize_square(%arg: memref<7x14x21xf32>, %out: memref<7x14x21xf32>) {
  linalg.square ins(%arg : memref<7x14x21xf32>) outs(%out : memref<7x14x21xf32>)
  return
}





// -----

func.func @generalize_tanh(%arg: memref<7x14x21xf32>, %out: memref<7x14x21xf32>) {
  linalg.tanh ins(%arg : memref<7x14x21xf32>) outs(%out : memref<7x14x21xf32>)
  return
}





// -----

func.func @generalize_erf(%arg: memref<7x14x21xf32>, %out: memref<7x14x21xf32>) {
  linalg.erf ins(%arg : memref<7x14x21xf32>) outs(%out : memref<7x14x21xf32>)
  return
}





// -----

func.func @generalize_max(%lhs: memref<7x14x21xf32>, %rhs: memref<7x14x21xf32>,
                          %out: memref<7x14x21xf32>) {
  linalg.max ins(%lhs, %rhs : memref<7x14x21xf32>, memref<7x14x21xf32>)
             outs(%out : memref<7x14x21xf32>)
  return
}





// -----

func.func @generalize_min(%lhs: memref<7x14x21xf32>, %rhs: memref<7x14x21xf32>,
                          %out: memref<7x14x21xf32>) {
  linalg.min ins(%lhs, %rhs : memref<7x14x21xf32>, memref<7x14x21xf32>)
             outs(%out : memref<7x14x21xf32>)
  return
}






// -----

func.func @generalize_powf(%lhs: memref<7x14x21xf32>, %rhs: memref<7x14x21xf32>,
                          %out: memref<7x14x21xf32>) {
  linalg.powf ins(%lhs, %rhs : memref<7x14x21xf32>, memref<7x14x21xf32>)
             outs(%out : memref<7x14x21xf32>)
  return
}






// -----

func.func @generalize_select(%cond: memref<7x14x21xi1>, %lhs: memref<7x14x21xf32>, %rhs: memref<7x14x21xf32>,
                              %out: memref<7x14x21xf32>) {
  linalg.select ins(%cond, %lhs, %rhs: memref<7x14x21xi1>, memref<7x14x21xf32>, memref<7x14x21xf32>)
                outs(%out: memref<7x14x21xf32>)
  return
}






// -----

func.func @fill_tensor(%f: f32, %v: vector<2x4xf32>) -> (tensor<f32>, tensor<vector<2x4xf32>>) {
  %e0 = tensor.empty() : tensor<f32>
  %0 = linalg.fill ins(%f : f32) outs(%e0 : tensor<f32>) -> tensor<f32>

  %e1 = tensor.empty() : tensor<vector<2x4xf32>>
  %1 = linalg.fill ins(%v : vector<2x4xf32>) outs(%e1 : tensor<vector<2x4xf32>>) -> tensor<vector<2x4xf32>>

  return %0, %1: tensor<f32>, tensor<vector<2x4xf32>>
}

// -----




func.func @matmul_transpose_a_explicit(%arg0: memref<5x3xf32>, %arg1: memref<5x7xf32>, %arg2: memref<3x7xf32>) {
  linalg.matmul indexing_maps = [
                       affine_map<(d0, d1, d2) -> (d2, d0)>,
                       affine_map<(d0, d1, d2) -> (d2, d1)>,
                       affine_map<(d0, d1, d2) -> (d0, d1)>
                      ]
                      ins(%arg0, %arg1 : memref<5x3xf32>, memref<5x7xf32>)
                      outs(%arg2: memref<3x7xf32>)
  return
}

// -----



func.func @matmul_transpose_b_explicit(%arg0: memref<3x5xf32>, %arg1: memref<7x5xf32>, %arg2: memref<3x7xf32>) {
  linalg.matmul indexing_maps = [
                       affine_map<(d0, d1, d2) -> (d0, d2)>,
                       affine_map<(d0, d1, d2) -> (d1, d2)>,
                       affine_map<(d0, d1, d2) -> (d0, d1)>
                      ]
                      ins(%arg0, %arg1 : memref<3x5xf32>, memref<7x5xf32>)
                      outs(%arg2: memref<3x7xf32>)
  return
}

// -----




func.func @matmul_transpose_a_b_explicit(%arg0: memref<5x3xf32>, %arg1: memref<7x5xf32>, %arg2: memref<3x7xf32>) {
  linalg.matmul indexing_maps = [
                       affine_map<(d0, d1, d2) -> (d2, d0)>,
                       affine_map<(d0, d1, d2) -> (d1, d2)>,
                       affine_map<(d0, d1, d2) -> (d0, d1)>
                      ]
                      ins(%arg0, %arg1 : memref<5x3xf32>, memref<7x5xf32>)
                      outs(%arg2: memref<3x7xf32>)
  return
}

// -----



func.func @batch_matmul(%arg0: tensor<2x3x5xf32>, %arg1: tensor<2x5x7xf32>, %arg2: tensor<2x3x7xf32>) -> tensor<2x3x7xf32> {
  %0 = linalg.batch_matmul indexing_maps = [
                            affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>,
                            affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>,
                            affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
                           ]
    ins(%arg0, %arg1: tensor<2x3x5xf32>, tensor<2x5x7xf32>)
    outs(%arg2: tensor<2x3x7xf32>) -> tensor<2x3x7xf32>
  return %0 : tensor<2x3x7xf32>
}

// -----



func.func @batch_reduce_matmul(%A: tensor<2x3x5xf32>, %B: tensor<2x5x7xf32>, %C: tensor<3x7xf32>) -> tensor<3x7xf32> {
  %0 = linalg.batch_reduce_matmul indexing_maps = [
                            affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>,
                            affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>,
                            affine_map<(d0, d1, d2, d3) -> (d1, d2)>
                           ]
    ins(%A, %B: tensor<2x3x5xf32>, tensor<2x5x7xf32>)
    outs(%C: tensor<3x7xf32>) -> tensor<3x7xf32>
  return %0 : tensor<3x7xf32>
}

// -----




func.func @contract_matmul(%A: memref<3x5xf32>, %B: memref<5x7xf32>, %C: memref<3x7xf32>) {
  linalg.contract
      indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>,
                       affine_map<(d0, d1, d2) -> (d2, d1)>,
                       affine_map<(d0, d1, d2) -> (d0, d1)>]
      ins(%A, %B : memref<3x5xf32>, memref<5x7xf32>)
      outs(%C: memref<3x7xf32>)

  return
}

// -----




func.func @contract_matmul_transpose_a_b(%A: memref<5x3xf32>, %B: memref<7x5xf32>, %C: memref<3x7xf32>) {
  linalg.contract
      indexing_maps = [affine_map<(d0, d1, d2) -> (d2, d0)>,
                       affine_map<(d0, d1, d2) -> (d1, d2)>,
                       affine_map<(d0, d1, d2) -> (d0, d1)>]
      ins(%A, %B : memref<5x3xf32>, memref<7x5xf32>)
      outs(%C: memref<3x7xf32>)
  return
}

// -----




func.func @contract_batch_matmul(%A: memref<9x3x5xf32>, %B: memref<9x5x7xf32>, %C: memref<9x3x7xf32>) {
  linalg.contract
      indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>,
                       affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>,
                       affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>]
      ins(%A, %B : memref<9x3x5xf32>, memref<9x5x7xf32>)
      outs(%C: memref<9x3x7xf32>)
  return
}

// -----




#accessA = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#accessB = affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>
#accessC = affine_map<(d0, d1, d2, d3) -> (d1, d2)>
func.func @contract_batch_reduce_matmul(
    %A: memref<9x3x5xf32>, %B: memref<9x5x7xf32>, %C: memref<3x7xf32>) {
  linalg.contract
      indexing_maps = [#accessA, #accessB, #accessC]
      ins(%A, %B : memref<9x3x5xf32>, memref<9x5x7xf32>)
      outs(%C: memref<3x7xf32>)
  return
}

// -----




#accessA = affine_map<(d0, d1, d2, d3) -> (d0, d3, d1)>
#accessB = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#accessC = affine_map<(d0, d1, d2, d3) -> (d1, d2)>
func.func @contract_batch_reduce_matmul_permute_m_with_k_and_k_with_n(
    %A: memref<9x5x3xf32>, %B: memref<9x7x5xf32>, %C: memref<3x7xf32>) {
  linalg.contract
      indexing_maps = [#accessA, #accessB, #accessC]
      ins(%A, %B : memref<9x5x3xf32>, memref<9x7x5xf32>)
      outs(%C: memref<3x7xf32>)
  return
}

// -----




#accessAB = affine_map<(d0) -> (d0)>
#accessC = affine_map<(d0) -> ()>
func.func @contract_dot(
    %A: memref<9xf32>, %B: memref<9xf32>, %C: memref<f32>) {
  linalg.contract
      indexing_maps = [#accessAB, #accessAB, #accessC]
      ins(%A, %B : memref<9xf32>, memref<9xf32>)
      outs(%C: memref<f32>)
  return
}

// -----




#accessAB = affine_map<(d0, d1, d2) -> (d2)>
#accessC = affine_map<(d0, d1, d2) -> (d0, d1)>
func.func @contract_matmul_bcast_a_b(
    %A: memref<5xf32>, %B: memref<5xf32>, %C: memref<3x7xf32>) {
  linalg.contract
      indexing_maps = [#accessAB, #accessAB, #accessC]
      ins(%A, %B : memref<5xf32>, memref<5xf32>)
      outs(%C: memref<3x7xf32>)
  return
}

// -----

// Test that discardable (user-defined) attributes are preserved during
// generalization.

func.func @preserve_discardable_attrs(%A : tensor<16x8xf32>,
                                            %B : tensor<8x32xf32>,
                                            %C : tensor<16x32xf32>) -> tensor<16x32xf32> {
  %0 = linalg.matmul {my_custom_attr = "preserved", another_attr = 42 : i64}
                     ins(%A, %B: tensor<16x8xf32>, tensor<8x32xf32>)
                     outs(%C: tensor<16x32xf32>) -> tensor<16x32xf32>
  return %0: tensor<16x32xf32>
}
