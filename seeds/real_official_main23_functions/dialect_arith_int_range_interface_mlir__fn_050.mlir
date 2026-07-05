func.func @caller(%arg0: memref<?xindex, 4>) {
  call @callee(%arg0) : (memref<?xindex, 4>) -> ()
  return
}
