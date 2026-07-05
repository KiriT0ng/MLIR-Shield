// Source: https://github.com/llvm/llvm-project/issues/82382
// Command from issue:
// mlir-opt --convert-linalg-to-affine-loops --affine-loop-tile="tile-sizes=4,28,28,16,7,7,3" --affine-loop-unroll="unroll-factor=4" --canonicalize --affine-parallelize --lower-affine --canonicalize --gpu-map-parallel-loops --convert-parallel-loops-to-gpu conv2d.mlir
func.func @main() {
  %in_buf = memref.alloc() : memref<16x230x230x3xf32>
  %filter_buf = memref.alloc() : memref<64x7x7x3xf32>
  %out_buf = memref.alloc() : memref<16x112x112x64xf32>
  linalg.conv_2d_nhwc_fhwc {dilations = dense<1> : tensor<2xi64>, strides = dense<2> : tensor<2xi64>}
    ins (%in_buf, %filter_buf: memref<16x230x230x3xf32>, memref<64x7x7x3xf32>)
    outs (%out_buf: memref<16x112x112x64xf32>)
  return
}
