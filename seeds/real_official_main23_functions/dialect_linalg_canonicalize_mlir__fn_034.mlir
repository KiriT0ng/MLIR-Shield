func.func @multi_insert_pad_into_fill_overlap(%input: tensor<7x123x124xf32>, %a: tensor<8x128x128xf32>, %offset: index) -> tensor<8x384x384xf32> {
  %f0 = arith.constant 0.0 : f32
  %c0 = arith.constant 0 : index
  %pad = tensor.pad %input low[1, 2, 0] high[0, 3, 4] {
  ^bb0(%arg3: index, %arg4: index, %arg5: index):
    tensor.yield %f0 : f32
  } : tensor<7x123x124xf32> to tensor<8x128x128xf32>
  %empty = tensor.empty() : tensor<8x384x384xf32>
  %fill = linalg.fill ins(%f0 : f32) outs(%empty : tensor<8x384x384xf32>) -> tensor<8x384x384xf32>
  %0 = tensor.insert_slice %a   into %fill[%offset, 0, 0]  [8, 128, 128] [1, 1, 1] : tensor<8x128x128xf32> into tensor<8x384x384xf32>
  %1 = tensor.insert_slice %a   into %0   [0, 0, 129]      [8, 128, 128] [1, 1, 1] : tensor<8x128x128xf32> into tensor<8x384x384xf32>
  // Range overlap with %1 at dim#3
  %2 = tensor.insert_slice %pad into %1   [0, 0, 256]      [8, 128, 128] [1, 1, 1] : tensor<8x128x128xf32> into tensor<8x384x384xf32>
  return %2: tensor<8x384x384xf32>
}
