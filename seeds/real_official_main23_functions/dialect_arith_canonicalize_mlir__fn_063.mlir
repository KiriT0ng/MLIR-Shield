func.func @indexCastUIOfUnsignedExtend_nneg_on_castui(%arg0: i8) -> index {
  %ext = arith.extui %arg0 : i8 to i16
  %idx = arith.index_castui %ext nneg : i16 to index
  return %idx : index
}
