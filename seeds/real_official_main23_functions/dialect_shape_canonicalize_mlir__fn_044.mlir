func.func @assuming_all_duplicate_operands(%arg0 : tensor<?xindex>,
    %arg1 : tensor<?xindex>) -> !shape.witness {
  %0 = shape.cstr_broadcastable %arg0, %arg1 : tensor<?xindex>, tensor<?xindex>
  %1 = shape.assuming_all %0, %0, %0
  return %1 : !shape.witness
}
