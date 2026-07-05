func.func @assuming_all_to_cstr_eq(%a : !shape.shape, %b : tensor<?xindex>,
    %c : tensor<3xindex>) -> !shape.witness {
  %0 = shape.cstr_eq %a, %b : !shape.shape, tensor<?xindex>
  %1 = shape.cstr_eq %b, %c : tensor<?xindex>, tensor<3xindex>
  %2 = shape.assuming_all %0, %1
  return %2 : !shape.witness
}
