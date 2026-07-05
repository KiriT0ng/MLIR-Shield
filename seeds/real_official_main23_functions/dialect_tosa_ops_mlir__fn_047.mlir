func.func @clamp_quantized_unsigned(%arg0:tensor<?x112x112x32x!quant.uniform<u8:f32, 0.023529412224888802:-128>>) -> (tensor<?x112x112x32x!quant.uniform<u8:f32, 0.023529412224888802:-128>>) {
    %0 = tosa.clamp %arg0 {max_val = 255 : ui8, min_val = 0 : ui8} : (tensor<?x112x112x32x!quant.uniform<u8:f32, 0.023529412224888802:-128>>) -> tensor<?x112x112x32x!quant.uniform<u8:f32, 0.023529412224888802:-128>>
    return %0 : tensor<?x112x112x32x!quant.uniform<u8:f32, 0.023529412224888802:-128>>
}
