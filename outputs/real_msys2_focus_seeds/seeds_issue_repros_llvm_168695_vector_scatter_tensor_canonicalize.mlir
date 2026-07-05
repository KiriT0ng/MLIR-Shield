// Source: https://github.com/llvm/llvm-project/issues/168695
// Expected trigger: canonicalizing vector.scatter with tensor output asserted in newer MLIR builds.

func.func @scatter_tensor(
  %base: tensor<16xf32>,
  %mask: vector<16xi1>,
  %value: vector<16xf32>
) -> tensor<16xf32> {
  %c0 = arith.constant 0 : index
  %index = vector.step : vector<16xindex>
  %0 = vector.scatter %base[%c0] [%index], %mask, %value
      : tensor<16xf32>, vector<16xindex>, vector<16xi1>, vector<16xf32> -> tensor<16xf32>
  return %0 : tensor<16xf32>
}
