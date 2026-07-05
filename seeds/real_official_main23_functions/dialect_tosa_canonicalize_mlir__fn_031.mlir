func.func @clamp_twice_with_unsigned_quantized_is_single_clamp(%arg0:tensor<?x112x112x32x!quant.uniform<u8:f32, 0.023529412224888802:-128>>) -> (tensor<?x112x112x32x!quant.uniform<u8:f32, 0.023529412224888802:-128>>) {
    %0 = tosa.clamp %arg0 {max_val = 240 : ui8, min_val = 10 : ui8} : (tensor<?x112x112x32x!quant.uniform<u8:f32, 0.023529412224888802:-128>>) -> tensor<?x112x112x32x!quant.uniform<u8:f32, 0.023529412224888802:-128>>
    %1 = tosa.clamp %0 {max_val = 230 : ui8, min_val = 5 : ui8} : (tensor<?x112x112x32x!quant.uniform<u8:f32, 0.023529412224888802:-128>>) -> tensor<?x112x112x32x!quant.uniform<u8:f32, 0.023529412224888802:-128>>
    return %1 : tensor<?x112x112x32x!quant.uniform<u8:f32, 0.023529412224888802:-128>>
}
