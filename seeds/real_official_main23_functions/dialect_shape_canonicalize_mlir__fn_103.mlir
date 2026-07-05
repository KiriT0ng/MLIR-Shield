func.func @broadcast_on_single_operand(%a : tensor<?xindex>) {
  %0 = shape.broadcast %a : tensor<?xindex> -> tensor<?xindex>
  "use"(%0) : (tensor<?xindex>) -> ()
  return
}
