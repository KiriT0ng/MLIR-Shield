func.func @conv_2d_ngchw_gfchw_q(%input: memref<?x?x?x?x?xi8>, %filter: memref<?x?x?x?x?xi8>, %inputzp: i32, %filterzp: i32, %output: memref<?x?x?x?x?xi32>) {
  linalg.conv_2d_ngchw_gfchw_q {dilations = dense<1> : tensor<2xi64>,
                                       strides = dense<1> : tensor<2xi64>}
     ins (%input, %filter, %inputzp, %filterzp: memref<?x?x?x?x?xi8>, memref<?x?x?x?x?xi8>, i32, i32)
    outs (%output: memref<?x?x?x?x?xi32>)
  return
}
