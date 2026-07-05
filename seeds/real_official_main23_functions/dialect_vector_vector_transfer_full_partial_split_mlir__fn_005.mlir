func.func @transfer_read_within_scf_for(%A : memref<?x?xf32>, %lb : index, %ub : index, %step : index) {
  %c0 = arith.constant 0 : index
  %f0 = arith.constant 0.0 : f32
  scf.for %i = %lb to %ub step %step {
    %0 = vector.transfer_read %A[%c0, %c0], %f0 : memref<?x?xf32>, vector<2x2xf32>
    func.call @fake_side_effecting_fun(%0) : (vector<2x2xf32>) -> ()
  }
  return
}
