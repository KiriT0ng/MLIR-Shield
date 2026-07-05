func.func @test_simple_f32(%arg0: tensor<1xf32>) -> () {
  %0 = tosa.tanh %arg0 : (tensor<1xf32>) -> tensor<1xf32>

  %1 = tosa.abs %arg0 : (tensor<1xf32>) -> tensor<1xf32>

  %2 = tosa.add %0, %0 : (tensor<1xf32>, tensor<1xf32>) -> tensor<1xf32>

  %3 = tosa.sub %0, %1 : (tensor<1xf32>, tensor<1xf32>) -> tensor<1xf32>

  %shift = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
  %4 = tosa.mul %0, %1, %shift : (tensor<1xf32>, tensor<1xf32>, tensor<1xi8>) -> tensor<1xf32>

  %in_zp = "tosa.const"() <{values = dense<0.0> : tensor<1xf32>}> : () -> tensor<1xf32>
  %out_zp = "tosa.const"() <{values = dense<0.0> : tensor<1xf32>}> : () -> tensor<1xf32>
  %5 = tosa.negate %0, %in_zp, %out_zp : (tensor<1xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1xf32>

  %6 = tosa.pow %1, %2 : (tensor<1xf32>, tensor<1xf32>) -> tensor<1xf32>

  %7 = tosa.rsqrt %1 : (tensor<1xf32>) -> tensor<1xf32>

  %8 = tosa.log %arg0 : (tensor<1xf32>) -> tensor<1xf32>

  %9 = tosa.exp %arg0 : (tensor<1xf32>) -> tensor<1xf32>

  %10 = tosa.greater %0, %1 : (tensor<1xf32>, tensor<1xf32>) -> tensor<1xi1>

  %11 = tosa.greater_equal %0, %1 : (tensor<1xf32>, tensor<1xf32>) -> tensor<1xi1>

  %12 = tosa.equal %0, %1 : (tensor<1xf32>, tensor<1xf32>) -> tensor<1xi1>

  %13 = tosa.select %10, %0, %1 : (tensor<1xi1>, tensor<1xf32>, tensor<1xf32>) -> tensor<1xf32>

  %14 = tosa.maximum %0, %1 : (tensor<1xf32>, tensor<1xf32>) -> tensor<1xf32>

  %15 = tosa.minimum %0, %1 : (tensor<1xf32>, tensor<1xf32>) -> tensor<1xf32>

  %16 = tosa.ceil %0 : (tensor<1xf32>) -> tensor<1xf32>

  %17 = tosa.floor %0 : (tensor<1xf32>) -> tensor<1xf32>

  %18 = tosa.clamp %0 {min_val = 1.0 : f32, max_val = 5.0 : f32} : (tensor<1xf32>) -> tensor<1xf32>

  %19 = tosa.sigmoid %0 : (tensor<1xf32>) -> tensor<1xf32>

  %20 = tosa.cast %0 : (tensor<1xf32>) -> tensor<1xi32>

  %21 = tosa.cast %0 : (tensor<1xf32>) -> tensor<1xi1>

  %22 = tosa.cast %0 : (tensor<1xf32>) -> tensor<1xf16>

  %23 = tosa.reciprocal %0 : (tensor<1xf32>) -> tensor<1xf32>

  %24 = tosa.erf %0 : (tensor<1xf32>) -> tensor<1xf32>

  %25 = tosa.sin %arg0 : (tensor<1xf32>) -> tensor<1xf32>

  %26 = tosa.cos %arg0 : (tensor<1xf32>) -> tensor<1xf32>

  return
}
