func.func @recursive_effect(%arg : tensor<1xf32>) {
  %init = arith.constant dense<0.0> : tensor<1xf32>
  %mapped = linalg.map ins(%arg:tensor<1xf32>) outs(%init :tensor<1xf32>)
            (%in : f32, %out: f32) {
              vector.print %in : f32
              linalg.yield %in : f32
            }
  func.return
}
