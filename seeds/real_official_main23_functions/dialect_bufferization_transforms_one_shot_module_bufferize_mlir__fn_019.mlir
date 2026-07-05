func.func @main() {
  %A = arith.constant dense<[1, 2, 3, 4]> : tensor<4xi32>

// Note: The scf.execute_region canonicalizes away.

  scf.execute_region {
    func.call @some_external_func_within_scf_execute(%A) : (tensor<4xi32>) -> ()
    scf.yield
  }

  return
}
