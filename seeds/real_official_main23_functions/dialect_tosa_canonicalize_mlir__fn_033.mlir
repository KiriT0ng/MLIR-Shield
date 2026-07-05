func.func @clamp_twice_with_signed_quantized_non_overlap_is_not_single_clamp(%arg0:tensor<?x112x112x32x!quant.uniform<i8:f32, 0.023529412224888802:-128>>) -> (tensor<?x112x112x32x!quant.uniform<i8:f32, 0.023529412224888802:-128>>) {
    %0 = tosa.clamp %arg0 {max_val = 50 : i8, min_val = -10 : i8} : (tensor<?x112x112x32x!quant.uniform<i8:f32, 0.023529412224888802:-128>>) -> tensor<?x112x112x32x!quant.uniform<i8:f32, 0.023529412224888802:-128>>
    %1 = tosa.clamp %0 {max_val = 120 : i8, min_val = 60 : i8} : (tensor<?x112x112x32x!quant.uniform<i8:f32, 0.023529412224888802:-128>>) -> tensor<?x112x112x32x!quant.uniform<i8:f32, 0.023529412224888802:-128>>
    return %1 : tensor<?x112x112x32x!quant.uniform<i8:f32, 0.023529412224888802:-128>>
}
