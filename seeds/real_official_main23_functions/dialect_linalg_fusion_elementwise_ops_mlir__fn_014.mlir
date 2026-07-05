#map0 = affine_map<(d0, d1) -> (d0, d1)>
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
