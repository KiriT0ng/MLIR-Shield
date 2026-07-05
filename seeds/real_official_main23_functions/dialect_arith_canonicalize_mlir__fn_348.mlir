func.func @unsignedExtendConstantResource() -> tensor<i16> {
  %c2 = arith.constant dense_resource<blob1> : tensor<i8>
  %ext = arith.extui %c2 : tensor<i8> to tensor<i16>
  return %ext : tensor<i16>
}
