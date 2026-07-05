// Source: https://github.com/llvm/llvm-project/issues/119868
// Command from issue:
// mlir-opt test.mlir -test-linalg-elementwise-fusion-patterns=fuse-multiuse-producer
#map = affine_map<(d0) -> (d0)>
module {
  func.func private @printMemrefI32(tensor<*xi32>)
  func.func @main() {
    %0 = "tosa.const"() <{value = dense<70> : tensor<84xi64>}> : () -> tensor<84xi64>
    %1 = "tosa.const"() <{value = dense<0> : tensor<1xi32>}> : () -> tensor<1xi32>
    %2 = "tosa.const"() <{value = dense<70> : tensor<84xi64>}> : () -> tensor<84xi64>
    %3 = "tosa.const"() <{value = dense<140> : tensor<84xi64>}> : () -> tensor<84xi64>
    %4 = tensor.empty() : tensor<84xi1>
    %5 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%3, %2 : tensor<84xi64>, tensor<84xi64>) outs(%4 : tensor<84xi1>) {
    ^bb0(%in: i64, %in_0: i64, %out: i1):
      %12 = arith.cmpi sge, %in, %in_0 : i64
      linalg.yield %12 : i1
    } -> tensor<84xi1>
    %6 = tensor.empty() : tensor<84xi1>
    %7 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%5 : tensor<84xi1>) outs(%6 : tensor<84xi1>) {
    ^bb0(%in: i1, %out: i1):
      %false = arith.constant false
      %12 = arith.subi %false, %in : i1
      linalg.yield %12 : i1
    } -> tensor<84xi1>
    %8 = tensor.empty() : tensor<84xi32>
    %9 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%5 : tensor<84xi1>) outs(%8 : tensor<84xi32>) {
    ^bb0(%in: i1, %out: i32):
      %12 = arith.extui %in : i1 to i32
      linalg.yield %12 : i32
    } -> tensor<84xi32>
    %10 = tensor.empty() : tensor<84xi32>
    %11 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%9, %9 : tensor<84xi32>, tensor<84xi32>) outs(%10 : tensor<84xi32>) {
    ^bb0(%in: i32, %in_0: i32, %out: i32):
      %12 = arith.shrsi %in, %in_0 : i32
      linalg.yield %12 : i32
    } -> tensor<84xi32>
    %cast = tensor.cast %11 : tensor<84xi32> to tensor<*xi32>
    call @printMemrefI32(%cast) : (tensor<*xi32>) -> ()
    return
  }
}
