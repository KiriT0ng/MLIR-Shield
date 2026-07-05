func.func @main() {
  %v0 = arith.constant 0.0 : f32
  %v1 = arith.constant 1.0 : f32
  %v2 = arith.constant 2.0 : f32

  %A = bufferization.alloc_tensor() : tensor<64xf32>
  %B = bufferization.alloc_tensor() : tensor<64xf32>
  %C = bufferization.alloc_tensor() : tensor<f32>

  %AA = linalg.fill ins(%v1 : f32) outs(%A : tensor<64xf32>) -> tensor<64xf32>
  %BB = linalg.fill ins(%v2 : f32) outs(%B : tensor<64xf32>) -> tensor<64xf32>
  %CC = linalg.fill ins(%v0 : f32) outs(%C : tensor<f32>) -> tensor<f32>

  %res = call @init_and_dot(%AA, %BB, %CC) :
    (tensor<64xf32>, tensor<64xf32>, tensor<f32>) -> tensor<f32>

  %res2 = tensor.cast %res: tensor<f32> to tensor<*xf32>

  call @printMemrefF32(%res2) : (tensor<*xf32>) -> ()

  return
}
