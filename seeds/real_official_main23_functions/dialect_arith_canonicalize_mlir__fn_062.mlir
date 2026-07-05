func.func @indexCastUIOfUnsignedExtend_nneg_on_extui(%arg0: i8) -> index {
  %ext = arith.extui %arg0 nneg : i8 to i16
  %idx = arith.index_castui %ext : i16 to index
  return %idx : index
}
