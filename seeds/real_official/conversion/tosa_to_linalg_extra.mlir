func.func @test_abs_scalar(%arg0: tensor<f32>) -> tensor<f32> {
  %0 = tosa.abs %arg0 : (tensor<f32>) -> tensor<f32>

	return %0 : tensor<f32>
}

// -----

func.func @test_abs_1d_cast_static_to_dynamic(%arg0: tensor<5xf32>) -> tensor<?xf32> {
  %0 = "tosa.abs"(%arg0) : (tensor<5xf32>) -> tensor<?xf32>

  return %0 : tensor<?xf32>
}

// -----

func.func @test_abs_1d_cast_dynamic_to_static(%arg0: tensor<?xf32>) -> tensor<5xf32> {
  %0 = "tosa.abs"(%arg0) : (tensor<?xf32>) -> tensor<5xf32>

  return %0 : tensor<5xf32>
}

// -----

func.func @test_abs_1d_dynamic(%arg0: tensor<?xf32>) -> tensor<?xf32> {

  %0 = tosa.abs %arg0 : (tensor<?xf32>) -> tensor<?xf32>

  return %0 : tensor<?xf32>
}

// -----

func.func @test_add_0d(%arg0: tensor<f32>, %arg1: tensor<f32>) -> tensor<f32> {

  %0 = tosa.add %arg0, %arg1 : (tensor<f32>, tensor<f32>) -> tensor<f32>


  return %0 : tensor<f32>
}

// -----


func.func @test_add_2d_broadcast(%arg0: tensor<2x1xf32>, %arg1: tensor<1x1xf32>) -> tensor<2x1xf32> {
  // tosa element-wise operators now require operands of equal ranks
  %0 = tosa.add %arg0, %arg1 : (tensor<2x1xf32>, tensor<1x1xf32>) -> tensor<2x1xf32>
  return %0 : tensor<2x1xf32>
}

// -----

func.func @test_add_1d_all_dynamic(%arg0: tensor<?xf32>, %arg1: tensor<?xf32>) -> tensor<?xf32> {

  %0 = tosa.add %arg0, %arg1 : (tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>

  return %0 : tensor<?xf32>
}

// -----

func.func @test_add_1d_broadcast_dynamic_to_static(%arg0: tensor<5xf32>, %arg1: tensor<?xf32>) -> tensor<5xf32> {

  %0 = tosa.add %arg0, %arg1 : (tensor<5xf32>, tensor<?xf32>) -> tensor<5xf32>

  return %0 : tensor<5xf32>
}

// -----

func.func @test_add_1d_broadcast_static_to_dynamic(%arg0: tensor<1xf32>, %arg1: tensor<?xf32>) -> tensor<?xf32> {

  %0 = tosa.add %arg0, %arg1 : (tensor<1xf32>, tensor<?xf32>) -> tensor<?xf32>

  return %0 : tensor<?xf32>
}

// -----

func.func @test_add_1d_broadcast_static_to_static(%arg0: tensor<1xf32>, %arg1: tensor<3xf32>) -> tensor<3xf32> {

  %0 = tosa.add %arg0, %arg1 : (tensor<1xf32>, tensor<3xf32>) -> tensor<3xf32>

  return %0 : tensor<3xf32>
}

// -----

func.func @test_add_1d_matching_no_broadcast(%arg0: tensor<1xf32>, %arg1: tensor<1xf32>) -> tensor<1xf32> {

  %0 = tosa.add %arg0, %arg1 : (tensor<1xf32>, tensor<1xf32>) -> tensor<1xf32>

  return %0 : tensor<1xf32>
}

// -----

func.func @test_add_1d_matching_static(%arg0: tensor<3xf32>, %arg1: tensor<3xf32>) -> tensor<3xf32> {

  %0 = tosa.add %arg0, %arg1 : (tensor<3xf32>, tensor<3xf32>) -> tensor<3xf32>

  return %0 : tensor<3xf32>
}

// -----

func.func @test_add_2d_all_dynamic(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>) -> tensor<?x?xf32> {






  %0 = tosa.add %arg0, %arg1 : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>

  return %0 : tensor<?x?xf32>
}

// -----

func.func @test_select_2d_one_dynamic(%arg0: tensor<2x?xi1>, %arg1: tensor<2x?xf32>, %arg2: tensor<2x?xf32>) -> tensor<2x?xf32> {





  %0 = tosa.select %arg0, %arg1, %arg2 : (tensor<2x?xi1>, tensor<2x?xf32>, tensor<2x?xf32>) -> tensor<2x?xf32>

  return %0 : tensor<2x?xf32>
}

// -----

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

// -----

func.func @test_simple_f16(%arg0: tensor<1xf16>) -> () {

  %0 = tosa.cast %arg0 : (tensor<1xf16>) -> tensor<1xf32>

  %1 = "tosa.cast"(%arg0) : (tensor<1xf16>) -> tensor<1xi8>

  %2 = "tosa.cast"(%arg0) : (tensor<1xf16>) -> tensor<1xi32>
  return
}

// -----

func.func @test_simple_i16(%arg0: tensor<1xi16>) -> () {
  %shift = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
  %0 = tosa.mul %arg0, %arg0, %shift : (tensor<1xi16>, tensor<1xi16>, tensor<1xi8>) -> tensor<1xi32>

  return
}

// -----

func.func @test_simple_ui8(%arg0: tensor<1xui8>) -> () {
  %0 = tosa.cast %arg0 : (tensor<1xui8>) -> tensor<1xf32>
  return
}

// -----

func.func @test_simple_i32(%arg0: tensor<1xi32>, %unsigned: tensor<1xui32>, %unsigned64: tensor<1xui64>) -> () {
  %0 = tosa.add %arg0, %arg0 : (tensor<1xi32>, tensor<1xi32>) -> tensor<1xi32>

  %1 = tosa.sub %arg0, %arg0 : (tensor<1xi32>, tensor<1xi32>) -> tensor<1xi32>

  %shift1 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
  %2 = tosa.mul %arg0, %arg0, %shift1 : (tensor<1xi32>, tensor<1xi32>, tensor<1xi8>) -> tensor<1xi32>

  %shift2 = "tosa.const"() <{values = dense<2> : tensor<1xi8>}> : () -> tensor<1xi8>
  %3 = tosa.mul %arg0, %arg0, %shift2: (tensor<1xi32>, tensor<1xi32>, tensor<1xi8>) -> tensor<1xi32>

  %4 = tosa.intdiv %arg0, %arg0 : (tensor<1xi32>, tensor<1xi32>) -> tensor<1xi32>

  %in_zp = "tosa.const"() <{values = dense<0> : tensor<1xi32>}> : () -> tensor<1xi32>
  %out_zp = "tosa.const"() <{values = dense<0> : tensor<1xi32>}> : () -> tensor<1xi32>
  %5 = tosa.negate %arg0, %in_zp, %out_zp : (tensor<1xi32>, tensor<1xi32>, tensor<1xi32>) -> tensor<1xi32>

  %6 = tosa.bitwise_and %arg0, %arg0 : (tensor<1xi32>, tensor<1xi32>) -> tensor<1xi32>

  %7 = tosa.bitwise_or %arg0, %arg0 : (tensor<1xi32>, tensor<1xi32>) -> tensor<1xi32>

  %8 = tosa.bitwise_xor %arg0, %arg0 : (tensor<1xi32>, tensor<1xi32>) -> tensor<1xi32>

  %9 = tosa.logical_left_shift %arg0, %arg0 : (tensor<1xi32>, tensor<1xi32>) -> tensor<1xi32>

  %10 = tosa.logical_right_shift %arg0, %arg0 : (tensor<1xi32>, tensor<1xi32>) -> tensor<1xi32>

  %11 = tosa.arithmetic_right_shift %arg0, %arg0 {round = 0 : i1} : (tensor<1xi32>, tensor<1xi32>) -> tensor<1xi32>

  %12 = tosa.arithmetic_right_shift %arg0, %arg0 {round = 1 : i1} : (tensor<1xi32>, tensor<1xi32>) -> tensor<1xi32>

  %13 = tosa.clz %arg0 : (tensor<1xi32>) -> tensor<1xi32>

  %14 = tosa.greater %0, %1 : (tensor<1xi32>, tensor<1xi32>) -> tensor<1xi1>

  %15 = tosa.greater_equal %0, %1 : (tensor<1xi32>, tensor<1xi32>) -> tensor<1xi1>

  %16 = tosa.select %14, %0, %1 : (tensor<1xi1>, tensor<1xi32>, tensor<1xi32>) -> tensor<1xi32>

  %17 = tosa.maximum %0, %1 : (tensor<1xi32>, tensor<1xi32>) -> tensor<1xi32>

  %18 = tosa.minimum %0, %1 : (tensor<1xi32>, tensor<1xi32>) -> tensor<1xi32>

  %19 = tosa.clamp %0 {min_val = 1 : i32, max_val = 5 : i32} : (tensor<1xi32>) -> tensor<1xi32>

  %u0 = tosa.clamp %unsigned {min_val = 4 : ui32, max_val = 32 : ui32} : (tensor<1xui32>) -> tensor<1xui32>

  %20 = tosa.cast %0 : (tensor<1xi32>) -> tensor<1xi16>

  %21 = tosa.cast %0 : (tensor<1xi32>) -> tensor<1xi64>

  %22 = tosa.cast %0 : (tensor<1xi32>) -> tensor<1xi1>

  %23 = tosa.cast %0 : (tensor<1xi32>) -> tensor<1xf32>

  %24 = tosa.abs %arg0 : (tensor<1xi32>) -> tensor<1xi32>

  return
}

// -----

func.func @test_simple_ui8(%arg0: tensor<1xi8>) -> () {

  %0 = tosa.cast %arg0 : (tensor<1xi8>) -> tensor<1xf32>

  return
}

// -----

func.func @test_i8(%arg0: tensor<1xi8>) -> () {
  %0 = tosa.clamp %arg0 {min_val = -127 : i8, max_val = 126 : i8} : (tensor<1xi8>) -> tensor<1xi8>

  return
}

// -----

func.func @test_i64(%arg0: tensor<1xi64>) -> () {
  %0 = tosa.clamp %arg0 {min_val = -9223372036854775808 : i64, max_val = 9223372036854775807 : i64} : (tensor<1xi64>) -> tensor<1xi64>

  return
}

// -----

func.func @test_clamp_f16(%arg0: tensor<1xf16>) -> () {
  %0 = tosa.clamp %arg0 {min_val = 0.0 : f16, max_val = 6.0 : f16} : (tensor<1xf16>) -> tensor<1xf16>

  return
}

// -----

func.func @test_bool(%arg0: tensor<1xi1>, %arg1: tensor<1xi1>) -> () {
  %0 = tosa.logical_and %arg0, %arg1 : (tensor<1xi1>, tensor<1xi1>) -> tensor<1xi1>

  %1 = tosa.logical_or %arg0, %arg1 : (tensor<1xi1>, tensor<1xi1>) -> tensor<1xi1>

  %2 = tosa.logical_xor %arg0, %arg1 : (tensor<1xi1>, tensor<1xi1>) -> tensor<1xi1>

  %3 = tosa.logical_not %arg0 : (tensor<1xi1>) -> tensor<1xi1>

  return
}

// -----

func.func @test_negate_quantized(%arg0: tensor<1xi8>) -> () {
  %in_zp0 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
  %out_zp0 = "tosa.const"() <{values = dense<7> : tensor<1xi8>}> : () -> tensor<1xi8>
  %0 = tosa.negate %arg0, %in_zp0, %out_zp0 : (tensor<1xi8>, tensor<1xi8>, tensor<1xi8>) -> tensor<1xi8>

  %in_zp3 = "tosa.const"() <{values = dense<-128> : tensor<1xi8>}> : () -> tensor<1xi8>
  %out_zp3 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
  %3 = tosa.negate %arg0, %in_zp3, %out_zp3 : (tensor<1xi8>, tensor<1xi8>, tensor<1xi8>) -> tensor<1xi8>

  %in_zp4 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
  %out_zp4 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
  %4 = tosa.negate %arg0, %in_zp4, %out_zp4 : (tensor<1xi8>, tensor<1xi8>, tensor<1xi8>) -> tensor<1xi8>

  return
}

// -----

func.func @test_negate_no_const_1(%arg0: tensor<50x42xf16> ,%arg1: tensor<1xf16> , %arg2: tensor<1xf16> ) -> tensor<*xf16> {
  %0 = tosa.negate %arg0, %arg1, %arg2 : (tensor<50x42xf16>, tensor<1xf16>, tensor<1xf16>) -> tensor<50x42xf16>
  %cast = tensor.cast %0 : tensor<50x42xf16> to tensor<*xf16>
  return %cast : tensor<*xf16>
}

// -----

func.func @test_negate_no_const_2(%arg0: tensor<50x42xi16> ,%arg1: tensor<1xi16> , %arg2: tensor<1xi16> ) -> tensor<*xi16> {
  %0 = tosa.negate %arg0, %arg1, %arg2 : (tensor<50x42xi16>, tensor<1xi16>, tensor<1xi16>) -> tensor<50x42xi16>
  %cast = tensor.cast %0 : tensor<50x42xi16> to tensor<*xi16>
  return %cast : tensor<*xi16>
}

// -----

func.func @test_identity(%arg0: tensor<1xf32>, %arg1: tensor<1xi32>) -> (tensor<1xf32>, tensor<1xi32>) {
  %0 = tosa.identity %arg0 : (tensor<1xf32>) -> tensor<1xf32>
  %1 = tosa.identity %arg1 : (tensor<1xi32>) -> tensor<1xi32>

  return %0, %1 : tensor<1xf32>, tensor<1xi32>
}

// -----

func.func @reduce_bf16(%arg0: tensor<5x4xbf16>) -> () {
  %0 = tosa.reduce_sum %arg0 {axis = 0 : i32} : (tensor<5x4xbf16>) -> tensor<1x4xbf16>
  return
}

// -----

func.func @reduce_float(%arg0: tensor<5x4xf32>) -> () {
  %0 = tosa.reduce_sum %arg0 {axis = 0 : i32} : (tensor<5x4xf32>) -> tensor<1x4xf32>

  %1 = tosa.reduce_sum %arg0 {axis = 1 : i32} : (tensor<5x4xf32>) -> tensor<5x1xf32>

  %2 = tosa.reduce_product %arg0 {axis = 0 : i32} : (tensor<5x4xf32>) -> tensor<1x4xf32>

  %3 = tosa.reduce_min %arg0 {axis = 0 : i32} : (tensor<5x4xf32>) -> tensor<1x4xf32>

  %4 = tosa.reduce_max %arg0 {axis = 0 : i32} : (tensor<5x4xf32>) -> tensor<1x4xf32>
  return
}

// -----

func.func @reduce_float_dyn(%arg0: tensor<?x5x4xf32>) -> () {
  %0 = tosa.reduce_sum %arg0 {axis = 1 : i32} : (tensor<?x5x4xf32>) -> tensor<?x1x4xf32>
  return
}

// -----

func.func @reduce_float_dyn_rank_1(%arg0: tensor<?xf32>) -> () {
  %0 = tosa.reduce_sum %arg0 {axis = 0 : i32} : (tensor<?xf32>) -> tensor<1xf32>
  return
}

// -----

func.func @reduce_float_dyn_nonzero_batch(%arg0: tensor<5x?x4xf32>) -> () {
  %0 = tosa.reduce_product %arg0 {axis = 2 : i32} : (tensor<5x?x4xf32>) -> tensor<5x?x1xf32>
  return
}

// -----

func.func @reduce_float_dyn_multiple(%arg0: tensor<?x?xf32>) -> () {
  %0 = tosa.reduce_max %arg0 {axis = 1 : i32} : (tensor<?x?xf32>) -> tensor<?x1xf32>
  return
}

// -----

func.func @reduce_int(%arg0: tensor<5x4xi32>) -> () {
  %0 = tosa.reduce_sum %arg0 {axis = 0 : i32} : (tensor<5x4xi32>) -> tensor<1x4xi32>

  %1 = tosa.reduce_sum %arg0 {axis = 1 : i32} : (tensor<5x4xi32>) -> tensor<5x1xi32>

  %2 = tosa.reduce_product %arg0 {axis = 0 : i32} : (tensor<5x4xi32>) -> tensor<1x4xi32>

  %3 = tosa.reduce_min %arg0 {axis = 0 : i32} : (tensor<5x4xi32>) -> tensor<1x4xi32>

  %4 = tosa.reduce_max %arg0 {axis = 0 : i32} : (tensor<5x4xi32>) -> tensor<1x4xi32>
  return
}

// -----

func.func @reduce_bool(%arg0: tensor<5x4xi1>) -> () {
  %0 = tosa.reduce_all %arg0 {axis = 0 : i32} : (tensor<5x4xi1>) -> tensor<1x4xi1>

  %1 = tosa.reduce_any %arg0 {axis = 0 : i32} : (tensor<5x4xi1>) -> tensor<1x4xi1>

  return
}

// -----

func.func @rescale_i8(%arg0 : tensor<2xi8>) -> () {
  %multiplier = "tosa.const"() {values = dense<19689> : tensor<1xi16>} : () -> tensor<1xi16>
  %shift = "tosa.const"() {values = dense<15> : tensor<1xi8>} : () -> tensor<1xi8>
  %input_zp = "tosa.const"() {values = dense<17> : tensor<1xi8>} : () -> tensor<1xi8>
  %output_zp = "tosa.const"() {values = dense<22> : tensor<1xi8>} : () -> tensor<1xi8>
  %0 = tosa.rescale %arg0, %multiplier, %shift, %input_zp, %output_zp {scale32 = false, rounding_mode = SINGLE_ROUND, per_channel = false, input_unsigned = false, output_unsigned = false} : (tensor<2xi8>, tensor<1xi16>, tensor<1xi8>, tensor<1xi8>, tensor<1xi8>) -> tensor<2xi8>

  return
}

// -----

func.func @rescale_i8_unsigned_output_explicit(%arg0 : tensor<2xi8>) -> () {
  %multiplier = "tosa.const"() {values = dense<19689> : tensor<1xi16> } : () -> tensor<1xi16>
  %shift = "tosa.const"() {values = dense<15> : tensor<1xi8> } : () -> tensor<1xi8>
  %input_zp = "tosa.const"() {values = dense<17> : tensor<1xi8>} : () -> tensor<1xi8>
  %output_zp = "tosa.const"() {values = dense<-22> : tensor<1xi8>} : () -> tensor<1xi8>
  %1 = tosa.rescale %arg0, %multiplier, %shift, %input_zp, %output_zp {scale32 = false, rounding_mode = SINGLE_ROUND, per_channel = false, input_unsigned = false, output_unsigned = true} : (tensor<2xi8>, tensor<1xi16>, tensor<1xi8>, tensor<1xi8>, tensor<1xi8>) -> tensor<2xui8>

  return
}

// -----

func.func @rescale_i8_unsigned_output_implicit(%arg0 : tensor<2xi8>) -> () {
  %multiplier = "tosa.const"() {values = dense<19689> : tensor<1xi16> } : () -> tensor<1xi16>
  %shift = "tosa.const"() {values = dense<15> : tensor<1xi8> } : () -> tensor<1xi8>
  %input_zp = "tosa.const"() {values = dense<17> : tensor<1xi8>} : () -> tensor<1xi8>
  %output_zp = "tosa.const"() {values = dense<-22> : tensor<1xi8>} : () -> tensor<1xi8>
  %1 = tosa.rescale %arg0, %multiplier, %shift, %input_zp, %output_zp {scale32 = false, rounding_mode = SINGLE_ROUND, per_channel = false, input_unsigned = false, output_unsigned = true} : (tensor<2xi8>, tensor<1xi16>, tensor<1xi8>, tensor<1xi8>, tensor<1xi8>) -> tensor<2xi8>

  return
}

// -----

func.func @rescale_i48_unsigned_output_implicit(%arg0 : tensor<2xi48>) -> () {
  %multiplier = "tosa.const"() {values = dense<19689> : tensor<1xi16> } : () -> tensor<1xi16>
  %shift = "tosa.const"() {values = dense<15> : tensor<1xi8> } : () -> tensor<1xi8>
  %input_zp = "tosa.const"() {values = dense<0> : tensor<1xi48>} : () -> tensor<1xi48>
  %output_zp = "tosa.const"() {values = dense<-22> : tensor<1xi8>} : () -> tensor<1xi8>
  %1 = tosa.rescale %arg0, %multiplier, %shift, %input_zp, %output_zp {scale32 = false, rounding_mode = SINGLE_ROUND, per_channel = false, input_unsigned = false, output_unsigned = true} : (tensor<2xi48>, tensor<1xi16>, tensor<1xi8>, tensor<1xi48>, tensor<1xi8>) -> tensor<2xi8>

  return
}

// -----


func.func @rescale_i8_dyn_batch(%arg0 : tensor<?x2xi8>) -> () {
  %multiplier = "tosa.const"() {values = dense<19689> : tensor<1xi16>} : () -> tensor<1xi16>
  %shift = "tosa.const"() {values = dense<15> : tensor<1xi8>} : () -> tensor<1xi8>
  %input_zp = "tosa.const"() {values = dense<17> : tensor<1xi8>} : () -> tensor<1xi8>
  %output_zp = "tosa.const"() {values = dense<22> : tensor<1xi8>} : () -> tensor<1xi8>
  %0 = tosa.rescale %arg0, %multiplier, %shift, %input_zp, %output_zp {scale32 = false, rounding_mode = SINGLE_ROUND, per_channel = false, input_unsigned = false, output_unsigned = false} : (tensor<?x2xi8>, tensor<1xi16>, tensor<1xi8>, tensor<1xi8>, tensor<1xi8>) -> tensor<?x2xi8>

  %1 = tosa.rescale %arg0, %multiplier, %shift, %input_zp, %output_zp {scale32 = false, rounding_mode = SINGLE_ROUND, per_channel = false, input_unsigned = false, output_unsigned = true} : (tensor<?x2xi8>, tensor<1xi16>, tensor<1xi8>, tensor<1xi8>, tensor<1xi8>) -> tensor<?x2xi8>

  return
}

// -----


func.func @rescale_dyn(%arg0 : tensor<1x?x?x32xi32>) -> () {
  %input_zp = "tosa.const"() {values = dense<0> : tensor<1xi32>} : () -> tensor<1xi32>
  %output_zp = "tosa.const"() {values = dense<0> : tensor<1xi8>} : () -> tensor<1xi8>
  %multiplier = "tosa.const"() {values = dense<1376784203> : tensor<1xi32> } : () -> tensor<1xi32>
  %shift = "tosa.const"() {values = dense<38> : tensor<1xi8> } : () -> tensor<1xi8>
  %0 = tosa.rescale %arg0, %multiplier, %shift, %input_zp, %output_zp {rounding_mode = DOUBLE_ROUND, per_channel = false, scale32 = true, input_unsigned = false, output_unsigned = false} : (tensor<1x?x?x32xi32>, tensor<1xi32>, tensor<1xi8>, tensor<1xi32>, tensor<1xi8>) -> tensor<1x?x?x32xi8>
  return
}

// -----

func.func @rescale_i8_unsigned_input_explicit(%arg0 : tensor<2xui8>) -> () {
  %multiplier = "tosa.const"() {values = dense<19689> : tensor<1xi16> } : () -> tensor<1xi16>
  %shift = "tosa.const"() {values = dense<15> : tensor<1xi8> } : () -> tensor<1xi8>
  %input_zp = "tosa.const"() {values = dense<17> : tensor<1xi8>} : () -> tensor<1xi8>
  %output_zp = "tosa.const"() {values = dense<22> : tensor<1xi8>} : () -> tensor<1xi8>
  %0 = tosa.rescale %arg0, %multiplier, %shift, %input_zp, %output_zp {scale32 = false, rounding_mode = SINGLE_ROUND, per_channel = false, input_unsigned = true, output_unsigned = false} : (tensor<2xui8>, tensor<1xi16>, tensor<1xi8>, tensor<1xi8>, tensor<1xi8>) -> tensor<2xi8>

  return
}

// -----

func.func @rescale_i8_unsigned_input_implicit(%arg0 : tensor<2xi8>) -> () {
  %multiplier = "tosa.const"() {values = dense<19689> : tensor<1xi16> } : () -> tensor<1xi16>
  %shift = "tosa.const"() {values = dense<15> : tensor<1xi8> } : () -> tensor<1xi8>
  %input_zp = "tosa.const"() {values = dense<-128> : tensor<1xi8>} : () -> tensor<1xi8>
  %output_zp = "tosa.const"() {values = dense<22> : tensor<1xi8>} : () -> tensor<1xi8>
  %0 = tosa.rescale %arg0, %multiplier, %shift, %input_zp, %output_zp {scale32 = false, rounding_mode = SINGLE_ROUND, per_channel = false, input_unsigned = true, output_unsigned = false} : (tensor<2xi8>, tensor<1xi16>, tensor<1xi8>, tensor<1xi8>, tensor<1xi8>) -> tensor<2xi8>

  return
}

// -----

func.func @rescale_i8_unsigned_input_output_explicit(%arg0 : tensor<2xui8>) -> () {
  %multiplier = "tosa.const"() {values = dense<19689> : tensor<1xi16> } : () -> tensor<1xi16>
  %shift = "tosa.const"() {values = dense<15> : tensor<1xi8> } : () -> tensor<1xi8>
  %input_zp = "tosa.const"() {values = dense<17> : tensor<1xi8>} : () -> tensor<1xi8>
  %output_zp = "tosa.const"() {values = dense<22> : tensor<1xi8>} : () -> tensor<1xi8>
  %0 = tosa.rescale %arg0, %multiplier, %shift, %input_zp, %output_zp {scale32 = false, rounding_mode = SINGLE_ROUND, per_channel = false, input_unsigned = true, output_unsigned = false} : (tensor<2xui8>, tensor<1xi16>, tensor<1xi8>, tensor<1xi8>, tensor<1xi8>) -> tensor<2xui8>

  return
}

// -----


func.func @rescale_per_channel(%arg0 : tensor<3xi8>) -> (tensor<3xi8>) {

  %multiplier = "tosa.const"() {values = dense<[42, 43, 44]> : tensor<3xi16>} : () -> tensor<3xi16>
  %shift = "tosa.const"() {values = dense<[14, 15, 64]> : tensor<3xi8>} : () -> tensor<3xi8>
  %input_zp = "tosa.const"() {values = dense<43> : tensor<1xi8>} : () -> tensor<1xi8>
  %output_zp = "tosa.const"() {values = dense<52> : tensor<1xi8>} : () -> tensor<1xi8>
  %0 = tosa.rescale %arg0, %multiplier, %shift, %input_zp, %output_zp {scale32 = false, rounding_mode = SINGLE_ROUND, per_channel = true, input_unsigned = false, output_unsigned = false} : (tensor<3xi8>, tensor<3xi16>, tensor<3xi8>, tensor<1xi8>, tensor<1xi8>) -> tensor<3xi8>

  return %0 : tensor<3xi8>
}

// -----

func.func @rescaleDoubleRound(%arg0 : tensor<2xi8>) -> (tensor<2xi8>) {
  %multiplier = "tosa.const"() {values = dense<19689> : tensor<1xi32>} : () -> tensor<1xi32>
  %shift = "tosa.const"() {values = dense<33> : tensor<1xi8>} : () -> tensor<1xi8>
  %input_zp = "tosa.const"() {values = dense<43> : tensor<1xi8>} : () -> tensor<1xi8>
  %output_zp = "tosa.const"() {values = dense<52> : tensor<1xi8>} : () -> tensor<1xi8>

  %0 = tosa.rescale %arg0, %multiplier, %shift, %input_zp, %output_zp {scale32 = true, rounding_mode = DOUBLE_ROUND, per_channel = false, input_unsigned = false, output_unsigned = false} : (tensor<2xi8>, tensor<1xi32>, tensor<1xi8>, tensor<1xi8>, tensor<1xi8>) -> tensor<2xi8>
  return %0 : tensor<2xi8>
}

// -----

func.func @rescaleUnnecessaryDoubleRound(%arg0 : tensor<2xi8>) -> (tensor<2xi8>) {
  %multiplier = "tosa.const"() {values = dense<19689> : tensor<1xi32>} : () -> tensor<1xi32>
  %shift = "tosa.const"() {values = dense<15> : tensor<1xi8>} : () -> tensor<1xi8>
  %input_zp = "tosa.const"() {values = dense<43> : tensor<1xi8>} : () -> tensor<1xi8>
  %output_zp = "tosa.const"() {values = dense<52> : tensor<1xi8>} : () -> tensor<1xi8>

  %0 = tosa.rescale %arg0, %multiplier, %shift, %input_zp, %output_zp {scale32 = true, rounding_mode = DOUBLE_ROUND, per_channel = false, input_unsigned = false, output_unsigned = false} : (tensor<2xi8>, tensor<1xi32>, tensor<1xi8>, tensor<1xi8>, tensor<1xi8>) -> tensor<2xi8>
  return %0 : tensor<2xi8>
}

// -----

func.func @unsupportedRescaleInexactRound(%arg0 : tensor<2xi8>) -> (tensor<2xi8>) {
  %multiplier = "tosa.const"() {values = dense<19689> : tensor<1xi32> } : () -> tensor<1xi32>
  %shift = "tosa.const"() {values = dense<33> : tensor<1xi8> } : () -> tensor<1xi8>
  %input_zp = "tosa.const"() {values = dense<0> : tensor<1xi8>} : () -> tensor<1xi8>
  %output_zp = "tosa.const"() {values = dense<0> : tensor<1xi8>} : () -> tensor<1xi8>
  // expected-error@+1 {{failed to legalize operation 'tosa.rescale'}}
  %0 = tosa.rescale %arg0, %multiplier, %shift, %input_zp, %output_zp {scale32 = true, rounding_mode = INEXACT_ROUND, per_channel = false, input_unsigned = false, output_unsigned = false} : (tensor<2xi8>, tensor<1xi32>, tensor<1xi8>, tensor<1xi8>, tensor<1xi8>) -> tensor<2xi8>
  return %0 : tensor<2xi8>
}

// -----

func.func @rescale_no_const(%arg0 : tensor<2xi8>, %multiplier : tensor<1xi32>, %shift : tensor<1xi8>, %input_zp : tensor<1xi8>, %output_zp : tensor<1xi8>) -> (tensor<2xi8>) {
  %0 = tosa.rescale %arg0, %multiplier, %shift, %input_zp, %output_zp {scale32 = true, rounding_mode = DOUBLE_ROUND, per_channel = false, input_unsigned = false, output_unsigned = false} : (tensor<2xi8>, tensor<1xi32>, tensor<1xi8>, tensor<1xi8>, tensor<1xi8>) -> tensor<2xi8>
  return %0 : tensor<2xi8>
}

// -----

func.func @rescale_no_const_per_channel(%arg0 : tensor<2xi8>, %arg1 : tensor<2xi32>, %arg2 : tensor<2xi8>, %input_zp : tensor<1xi8>, %output_zp : tensor<1xi8>) -> (tensor<2xi8>) {
    %0 = tosa.rescale %arg0, %arg1, %arg2, %input_zp, %output_zp {scale32 = true, rounding_mode = DOUBLE_ROUND, per_channel = true, input_unsigned = false, output_unsigned = false} : (tensor<2xi8>, tensor<2xi32>, tensor<2xi8>, tensor<1xi8>, tensor<1xi8>) -> tensor<2xi8>
  return %0 : tensor<2xi8>
}

// -----

func.func @rescale_no_const_per_channel_input_output_zp_ui8(%arg0 : tensor<2xi8>, %arg1 : tensor<2xi32>, %arg2 : tensor<2xi8>, %input_zp : tensor<1xui8>, %output_zp : tensor<1xui8>) -> (tensor<2xui8>) {
    %0 = tosa.rescale %arg0, %arg1, %arg2, %input_zp, %output_zp {scale32 = true, rounding_mode = DOUBLE_ROUND, per_channel = true, input_unsigned = false, output_unsigned = true} : (tensor<2xi8>, tensor<2xi32>, tensor<2xi8>, tensor<1xui8>, tensor<1xui8>) -> tensor<2xui8>
  return %0 : tensor<2xui8>
}

// -----


func.func @reverse(%arg0: tensor<5x4xi32>) -> () {
  %0 = tosa.reverse %arg0 {axis = 0 : i32} : (tensor<5x4xi32>) -> tensor<5x4xi32>

  %1 = tosa.reverse %arg0 {axis = 1 : i32} : (tensor<5x4xi32>) -> tensor<5x4xi32>
  return
}

// -----


func.func @reverse_dyn(%arg0: tensor<?xi32>) -> () {
  %0 = tosa.reverse %arg0 {axis = 0 : i32} : (tensor<?xi32>) -> tensor<?xi32>
  return
}

// -----


func.func @tile(%arg0 : tensor<2x3xi8>) -> () {
  %cst21 = tosa.const_shape { values = dense<[2, 1]> : tensor<2xindex> } : () -> !tosa.shape<2>
  %0 = tosa.tile %arg0, %cst21: (tensor<2x3xi8>, !tosa.shape<2>) -> tensor<4x3xi8>

  // tosa.reshape [[GENERIC]], [[CONST8]]
  %cst12 = tosa.const_shape { values = dense<[1, 2]> : tensor<2xindex> } : () -> !tosa.shape<2>
  %1 = tosa.tile %arg0, %cst12: (tensor<2x3xi8>, !tosa.shape<2>) -> tensor<2x6xi8>

  %cst57 = tosa.const_shape { values = dense<[5, 7]> : tensor<2xindex> } : () -> !tosa.shape<2>
  %2 = tosa.tile %arg0, %cst57: (tensor<2x3xi8>, !tosa.shape<2>)  -> tensor<10x21xi8>

  return
}

// -----


func.func @tile_dyn_input(%arg0 : tensor<?x3xi8>) -> () {
  %cst21 = tosa.const_shape { values = dense<[2, 1]> : tensor<2xindex> } : () -> !tosa.shape<2>
  %0 = tosa.tile %arg0, %cst21: (tensor<?x3xi8>, !tosa.shape<2>)  -> tensor<?x3xi8>

  return
}

// -----


func.func @tile_dyn_multiples(%arg0 : tensor<2x3xi8>) -> () {
  %cst = tosa.const_shape { values = dense<[2, -1]> : tensor<2xindex> } : () -> !tosa.shape<2>
  %0 = tosa.tile %arg0, %cst: (tensor<2x3xi8>, !tosa.shape<2>)  -> tensor<2x?xi8>

  return
}

// -----


func.func @argmax(%arg0 : tensor<3x2xi32>, %arg1 : tensor<6xf32>) -> () {
  %0 = tosa.argmax %arg0 { axis = 0 : i32} : (tensor<3x2xi32>)  -> tensor<2xi32>

  %1 = tosa.argmax %arg0 { axis = 1 : i32} : (tensor<3x2xi32>)  -> tensor<3xi32>

  %2 = tosa.argmax %arg1 { axis = 0 : i32} : (tensor<6xf32>)  -> tensor<i32>

  return
}

// -----


func.func @argmax_dyn_non_axis(%arg0 : tensor<3x?xi32>) -> () {
  %0 = tosa.argmax %arg0 { axis = 0 : i32} : (tensor<3x?xi32>)  -> tensor<?xi32>
  return
}

// -----


func.func @argmax_dyn_axis(%arg0 : tensor<3x?xi32>) -> () {
  %0 = tosa.argmax %arg0 { axis = 1 : i32} : (tensor<3x?xi32>)  -> tensor<3xi32>
  return
}

// -----

func.func @gather_float(%arg0: tensor<2x3x2xf32>, %arg1: tensor<2x3xi32>) -> () {
  %0 = tosa.gather %arg0, %arg1 : (tensor<2x3x2xf32>, tensor<2x3xi32>)  -> tensor<2x3x2xf32>
  return
}

// -----

func.func @gather_float_dyn(%arg0: tensor<?x3x2xf32>, %arg1: tensor<?x3xi32>) -> () {
  %0 = tosa.gather %arg0, %arg1 : (tensor<?x3x2xf32>, tensor<?x3xi32>)  -> tensor<?x3x2xf32>
  return
}

// -----

func.func @gather_float_all_dynamic(%arg0: tensor<?x?x?xf32>, %arg1: tensor<?x?xi32>) -> () {
  %0 = tosa.gather %arg0, %arg1 : (tensor<?x?x?xf32>, tensor<?x?xi32>)  -> tensor<?x?x?xf32>
  return
}

// -----

func.func @gather_int(%arg0: tensor<2x3x2xi32>, %arg1: tensor<2x3xi32>) -> () {
  %0 = tosa.gather %arg0, %arg1 : (tensor<2x3x2xi32>, tensor<2x3xi32>)  -> tensor<2x3x2xi32>
  return
}

// -----

func.func @table8(%arg0: tensor<6xi8>, %arg1: tensor<512xi8>) -> () {
  %0 = tosa.table %arg0, %arg1 : (tensor<6xi8>, tensor<512xi8>)  -> tensor<6xi8>
  return
}

// -----

func.func @table16(%arg0: tensor<6xi16>, %arg1: tensor<513xi16>) -> () {
  %0 = tosa.table %arg0, %arg1 : (tensor<6xi16>, tensor<513xi16>)  -> tensor<6xi32>
  return
}

// -----

func.func @table8_dyn(%arg0: tensor<?xi8>, %arg1: tensor<512xi8>) -> () {
  %0 = tosa.table %arg0, %arg1 : (tensor<?xi8>, tensor<512xi8>)  -> tensor<?xi8>
  return
}

// -----

func.func @table8_dyn_table(%arg0: tensor<6xi8>, %arg1: tensor<?xi8>) -> () {
  %0 = tosa.table %arg0, %arg1 : (tensor<6xi8>, tensor<?xi8>)  -> tensor<6xi8>
  return
}

// -----

func.func @test_static_rfft2d(%arg0: tensor<5x4x8xf32>) -> (tensor<5x4x5xf32>, tensor<5x4x5xf32>) {
  %output_real, %output_imag = "tosa.rfft2d"(%arg0) {} : (tensor<5x4x8xf32>) -> (tensor<5x4x5xf32>, tensor<5x4x5xf32>)
  return %output_real, %output_imag : tensor<5x4x5xf32>, tensor<5x4x5xf32>
}

// -----

func.func @test_dynamic_rfft2d(%arg0: tensor<?x?x?xf32>) -> (tensor<?x?x?xf32>, tensor<?x?x?xf32>) {
  %output_real, %output_imag = "tosa.rfft2d"(%arg0) {} : (tensor<?x?x?xf32>) -> (tensor<?x?x?xf32>, tensor<?x?x?xf32>)
  return %output_real, %output_imag : tensor<?x?x?xf32>, tensor<?x?x?xf32>
}

// -----

func.func @test_static_fft2d(%arg0: tensor<8x8x8xf32>, %arg1: tensor<8x8x8xf32>) -> (tensor<8x8x8xf32>, tensor<8x8x8xf32>) {
  %output_real, %output_imag = "tosa.fft2d"(%arg0, %arg1) {inverse=false} : (tensor<8x8x8xf32>, tensor<8x8x8xf32>) -> (tensor<8x8x8xf32>, tensor<8x8x8xf32>)
  return %output_real, %output_imag : tensor<8x8x8xf32>, tensor<8x8x8xf32>
}

// -----

func.func @test_dynamic_fft2d(%arg0: tensor<?x?x?xf32>, %arg1: tensor<?x?x?xf32>) -> (tensor<?x?x?xf32>, tensor<?x?x?xf32>) {
  %output_real, %output_imag = "tosa.fft2d"(%arg0, %arg1) {inverse = true} : (tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> (tensor<?x?x?xf32>, tensor<?x?x?xf32>)
  return %output_real, %output_imag : tensor<?x?x?xf32>, tensor<?x?x?xf32>
}


// -----


func.func @test_cast_fp32_i64(%arg0: tensor<1xf32>) -> (tensor<1xi64>) {
  %0 = tosa.cast %arg0 : (tensor<1xf32>) -> tensor<1xi64>
  return %0: tensor<1xi64>
}

// -----

func.func @reduce_min_nan_propagate(%arg0: tensor<5x4xf32>, %arg1: tensor<5x4xf32>) -> () {
  %3 = tosa.reduce_min %arg0 {axis = 0 : i32, nan_mode = PROPAGATE} : (tensor<5x4xf32>) -> tensor<1x4xf32>
  return
}

// -----

func.func @reduce_max_nan_propagate(%arg0: tensor<5x4xf32>, %arg1: tensor<5x4xf32>) -> () {
  %4 = tosa.reduce_max %arg0 {axis = 0 : i32, nan_mode = PROPAGATE} : (tensor<5x4xf32>) -> tensor<1x4xf32>
  return
}

// -----

func.func @reduce_min_nan_ignore_int(%arg0: tensor<5x4xi8>, %arg1: tensor<5x4xi8>) -> () {
  %5 = tosa.reduce_min %arg0 {axis = 0 : i32, nan_mode = IGNORE} : (tensor<5x4xi8>) -> tensor<1x4xi8>
  return
}

// -----

func.func @reduce_max_nan_ignore_int(%arg0: tensor<5x4xi8>, %arg1: tensor<5x4xi8>) -> () {
  %6 = tosa.reduce_max %arg0 {axis = 0 : i32, nan_mode = IGNORE} : (tensor<5x4xi8>) -> tensor<1x4xi8>
  return
}

// -----

func.func @reduce_min_nan_ignore(%arg0: tensor<5x4xf32>, %arg1: tensor<5x4xf32>) -> () {
  %5 = tosa.reduce_min %arg0 {axis = 0 : i32, nan_mode = IGNORE} : (tensor<5x4xf32>) -> tensor<1x4xf32>
  return
}

// -----

func.func @reduce_max_nan_ignore(%arg0: tensor<5x4xf32>, %arg1: tensor<5x4xf32>) -> () {
  %6 = tosa.reduce_max %arg0 {axis = 0 : i32, nan_mode = IGNORE} : (tensor<5x4xf32>) -> tensor<1x4xf32>
  return
}

// -----

func.func @minimum_nan_propagate(%arg0: tensor<5x4xf32>, %arg1: tensor<5x4xf32>) -> () {
  %7 = tosa.minimum %arg0, %arg1 {nan_mode = PROPAGATE} : (tensor<5x4xf32>, tensor<5x4xf32>) -> tensor<5x4xf32>
  return
}

// -----

func.func @maximum_nan_propagate(%arg0: tensor<5x4xf32>, %arg1: tensor<5x4xf32>) -> () {
  %8 = tosa.maximum %arg0, %arg1 {nan_mode = PROPAGATE} : (tensor<5x4xf32>, tensor<5x4xf32>) -> tensor<5x4xf32>
  return
}

// -----

func.func @minimum_nan_ignore_int(%arg0: tensor<5x4xi8>, %arg1: tensor<5x4xi8>) -> () {
  %9 = tosa.minimum %arg0, %arg1 {nan_mode = IGNORE} : (tensor<5x4xi8>, tensor<5x4xi8>) -> tensor<5x4xi8>
  return
}

// -----

func.func @maximum_nan_ignore_int(%arg0: tensor<5x4xi8>, %arg1: tensor<5x4xi8>) -> () {
  %10 = tosa.maximum %arg0, %arg1 {nan_mode = IGNORE} : (tensor<5x4xi8>, tensor<5x4xi8>) -> tensor<5x4xi8>
  return
}

// -----

func.func @minimum_nan_ignore(%arg0: tensor<5x4xf32>, %arg1: tensor<5x4xf32>) -> () {
  %9 = tosa.minimum %arg0, %arg1 {nan_mode = IGNORE} : (tensor<5x4xf32>, tensor<5x4xf32>) -> tensor<5x4xf32>
  return
}

// -----

func.func @maximum_nan_ignore(%arg0: tensor<5x4xf32>, %arg1: tensor<5x4xf32>) -> () {
  %10 = tosa.maximum %arg0, %arg1 {nan_mode = IGNORE} : (tensor<5x4xf32>, tensor<5x4xf32>) -> tensor<5x4xf32>
  return
}

// -----

func.func @argmax_nan_propagate(%arg0: tensor<5x4xf32>, %arg1: tensor<5x4xf32>) -> () {
  %11 = tosa.argmax %arg0 {axis = 0 : i32, nan_mode = PROPAGATE} : (tensor<5x4xf32>)  -> tensor<4xi32>
  return
}

// -----

func.func @argmax_nan_ignore_int(%arg0: tensor<5x4xi8>, %arg1: tensor<5x4xi8>) -> () {
 %12 = tosa.argmax %arg0 {axis = 0 : i32, nan_mode = IGNORE} : (tensor<5x4xi8>)  -> tensor<4xi32>
  return
}

// -----

func.func @argmax_nan_ignore(%arg0: tensor<5x4xf32>, %arg1: tensor<5x4xf32>) -> () {
  %12 = tosa.argmax %arg0 {axis = 0 : i32, nan_mode = IGNORE} : (tensor<5x4xf32>)  -> tensor<4xi32>
  return
}

// -----

func.func @clamp_nan_propagate(%arg0: tensor<5x4xf32>, %arg1: tensor<5x4xf32>) -> () {
  %13 = tosa.clamp %arg0 {min_val =  1.0 : f32, max_val = 5.0 : f32, nan_mode = PROPAGATE} : (tensor<5x4xf32>) -> tensor<5x4xf32>
  return
}

// -----

func.func @clamp_nan_ignore_int(%arg0: tensor<5x4xi8>, %arg1: tensor<5x4xi8>) -> () {
  %14 = tosa.clamp %arg0 {min_val = 1 : i8, max_val = 5 : i8, nan_mode = IGNORE} : (tensor<5x4xi8>) -> tensor<5x4xi8>
  return
}

// -----

func.func @clamp_nan_ignore(%arg0: tensor<5x4xf32>, %arg1: tensor<5x4xf32>) -> () {
  %14 = tosa.clamp %arg0 {min_val = 1.0 : f32, max_val = 5.0 : f32, nan_mode = IGNORE} : (tensor<5x4xf32>) -> tensor<5x4xf32>

  return
}

// -----

func.func @test_0d_input(%arg0: tensor<i32>) -> () {
  %shift1 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
  %0 = tosa.mul %arg0, %arg0, %shift1 : (tensor<i32>, tensor<i32>, tensor<1xi8>) -> tensor<i32>

  %in_zp = "tosa.const"() <{values = dense<0> : tensor<1xi32>}> : () -> tensor<1xi32>
  %out_zp = "tosa.const"() <{values = dense<0> : tensor<1xi32>}> : () -> tensor<1xi32>
  %5 = tosa.negate %arg0, %in_zp, %out_zp : (tensor<i32>, tensor<1xi32>, tensor<1xi32>) -> tensor<i32>

  return
}

// -----

func.func @mul_no_const_shift(%arg0: tensor<2x3xi32>, %arg1: tensor<2x3xi32>, %arg2: tensor<1xi8>) -> tensor<2x3xi32> {
  %0 = tosa.mul %arg0, %arg1, %arg2 : (tensor<2x3xi32>, tensor<2x3xi32>, tensor<1xi8>) -> tensor<2x3xi32>
  return %0 : tensor<2x3xi32>
}
// -----

func.func @negate_i64_no_noop_cast(%arg0: tensor<4xi64>, %in_zp: tensor<1xi64>, %out_zp: tensor<1xi64>) -> tensor<4xi64> {
  %neg = tosa.negate %arg0, %in_zp, %out_zp : (tensor<4xi64>, tensor<1xi64>, tensor<1xi64>) -> tensor<4xi64>
  return %neg : tensor<4xi64>
}
