func.func @merge_constant_padding_dynamic(%arg0: tensor<?x?xf32>, %idx: index, %pad_value: f32) -> tensor<?x?xf32> {
  %pad0 = tensor.pad %arg0 low[%idx, 1] high[1, 0] {
    ^bb0(%b0: index, %b1 : index):
      tensor.yield %pad_value : f32
    } : tensor<?x?xf32> to tensor<?x?xf32>
  %pad1 = tensor.pad %pad0 low[0, 2] high[%idx, 2] {
    ^bb0(%b2: index, %b3 : index):
      tensor.yield %pad_value : f32
    } : tensor<?x?xf32> to tensor<?x?xf32>
  return %pad1 : tensor<?x?xf32>
}
