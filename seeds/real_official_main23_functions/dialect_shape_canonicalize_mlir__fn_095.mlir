func.func @fold_assuming_all_single_element(%arg: tensor<?xindex>) {
  %0 = "test.source"() : () -> (!shape.witness)
  %1 = shape.assuming_all %0
  "consume.witness"(%1) : (!shape.witness) -> ()
  return
}
