gpu.module @test_module_0 {
  func.func @gpu_index_ops()
      -> (index, index, index, index, index, index,
          index, index, index, index, index, index,
          index) {

    %tIdX = gpu.thread_id x
    %tIdY = gpu.thread_id y
    %tIdZ = gpu.thread_id z

    %bDimX = gpu.block_dim x
    %bDimY = gpu.block_dim y
    %bDimZ = gpu.block_dim z

    %bIdX = gpu.block_id x
    %bIdY = gpu.block_id y
    %bIdZ = gpu.block_id z

    %gDimX = gpu.grid_dim x
    %gDimY = gpu.grid_dim y
    %gDimZ = gpu.grid_dim z


    %laneId = gpu.lane_id

    func.return %tIdX, %tIdY, %tIdZ, %bDimX, %bDimY, %bDimZ,
               %bIdX, %bIdY, %bIdZ, %gDimX, %gDimY, %gDimZ,
               %laneId
        : index, index, index, index, index, index,
          index, index, index, index, index, index,
          index
  }
}



gpu.module @test_module_1 {
  func.func @gpu_index_comp(%idx : index) -> index {
    %0 = arith.addi %idx, %idx : index
    func.return %0 : index
  }
}



gpu.module @test_module_2 {
  gpu.func @gpu_all_reduce_op() {
    %arg0 = arith.constant 1.0 : f32
    %result = gpu.all_reduce add %arg0 uniform {} : (f32) -> (f32)

    gpu.return
  }
}



gpu.module @test_module_3 {
  gpu.func @gpu_all_reduce_region() {
    %arg0 = arith.constant 1 : i32
    %result = gpu.all_reduce %arg0 uniform {
    ^bb(%lhs : i32, %rhs : i32):
      %xor = arith.xori %lhs, %rhs : i32
      "gpu.yield"(%xor) : (i32) -> ()
    } : (i32) -> (i32)
    gpu.return
  }
}



gpu.module @test_module_4 {
  func.func @gpu_shuffle() -> (f32, f32, f32, f32, i1, i1, i1, i1) {
    %arg0 = arith.constant 1.0 : f32
    %arg1 = arith.constant 4 : i32
    %arg2 = arith.constant 23 : i32
    %shfl, %pred = gpu.shuffle xor %arg0, %arg1, %arg2 : f32
    %shflu, %predu = gpu.shuffle up %arg0, %arg1, %arg2 : f32
    %shfld, %predd = gpu.shuffle down %arg0, %arg1, %arg2 : f32
    %shfli, %predi = gpu.shuffle idx %arg0, %arg1, %arg2 : f32

    func.return %shfl, %shflu, %shfld, %shfli, %pred, %predu, %predd, %predi
      : f32, f32,f32, f32, i1, i1, i1, i1
  }

  func.func @gpu_shuffle_unused_pred() -> (f32, f32, f32, f32) {
    %arg0 = arith.constant 1.0 : f32
    %arg1 = arith.constant 4 : i32
    %arg2 = arith.constant 23 : i32
    %shfl, %pred = gpu.shuffle xor %arg0, %arg1, %arg2 : f32
    %shflu, %predu = gpu.shuffle up %arg0, %arg1, %arg2 : f32
    %shfld, %predd = gpu.shuffle down %arg0, %arg1, %arg2 : f32
    %shfli, %predi = gpu.shuffle idx %arg0, %arg1, %arg2 : f32

    func.return %shfl, %shflu, %shfld, %shfli : f32, f32,f32, f32
  }
}

gpu.module @test_module_5 {
  func.func @gpu_sync() {
    gpu.barrier
    func.return
  }

  func.func @gpu_sync_subgroup() {
    gpu.barrier scope <subgroup>
    func.return
  }

  func.func @gpu_named_barriers(%member_count : i32) {
    %nb0 = gpu.initialize_named_barrier %member_count : i32 -> !gpu.named_barrier
    %c2 = arith.constant 2 : i32
    %nb1 = gpu.initialize_named_barrier %c2 : i32 -> !gpu.named_barrier
    gpu.barrier named(%nb0 : !gpu.named_barrier)
    gpu.barrier named(%nb1 : !gpu.named_barrier)
    func.return
  }

  func.func @gpu_named_barrier_arg(%nb : !gpu.named_barrier) {
    gpu.barrier named(%nb : !gpu.named_barrier)
    func.return
  }

}



gpu.module @test_module_6 {
  func.func @gpu_fabs(%arg_f32 : f32, %arg_f64 : f64) -> (f32, f64) {
    %result32 = math.absf %arg_f32 : f32
    %result64 = math.absf %arg_f64 : f64
    func.return %result32, %result64 : f32, f64
  }
}



gpu.module @test_module_7 {
  func.func @gpu_cbrt(%arg_f32 : f32, %arg_f64 : f64) -> (f32, f64) {
    %result32 = math.cbrt %arg_f32 : f32
    %result64 = math.cbrt %arg_f64 : f64
    func.return %result32, %result64 : f32, f64
  }
}



gpu.module @test_module_8 {
  func.func @gpu_ceil(%arg_f32 : f32, %arg_f64 : f64) -> (f32, f64) {
    %result32 = math.ceil %arg_f32 : f32
    %result64 = math.ceil %arg_f64 : f64
    func.return %result32, %result64 : f32, f64
  }
}



gpu.module @test_module_9 {
  func.func @gpu_floor(%arg_f32 : f32, %arg_f64 : f64) -> (f32, f64) {
    %result32 = math.floor %arg_f32 : f32
    %result64 = math.floor %arg_f64 : f64
    func.return %result32, %result64 : f32, f64
  }
}



gpu.module @test_module_10 {
  func.func @gpu_cos(%arg_f32 : f32, %arg_f64 : f64) -> (f32, f64, f32) {
    %result32 = math.cos %arg_f32 : f32
    %result64 = math.cos %arg_f64 : f64
    %result32Fast = math.cos %arg_f32 fastmath<afn> : f32
    func.return %result32, %result64, %result32Fast : f32, f64, f32
  }
}


gpu.module @test_module_11 {
  func.func @gpu_exp(%arg_f32 : f32, %arg_f64 : f64) -> (f32, f64, f32) {
    %result32 = math.exp %arg_f32 : f32
    %result64 = math.exp %arg_f64 : f64
    %result32Fast = math.exp %arg_f32 fastmath<fast> : f32
    func.return %result32, %result64, %result32Fast : f32, f64, f32
  }
}


gpu.module @test_module_12 {
  func.func @gpu_exp2(%arg_f32 : f32, %arg_f64 : f64) -> (f32, f64) {
    %result32 = math.exp2 %arg_f32 : f32
    %result64 = math.exp2 %arg_f64 : f64
    func.return %result32, %result64 : f32, f64
  }
}



gpu.module @test_module_13 {
  func.func @gpu_log(%arg_f32 : f32, %arg_f64 : f64) -> (f32, f64, f32) {
    %result32 = math.log %arg_f32 : f32
    %result64 = math.log %arg_f64 : f64
    %result32Fast = math.log %arg_f32 fastmath<afn> : f32
    func.return %result32, %result64, %result32Fast : f32, f64, f32
  }
}



gpu.module @test_module_14 {
  func.func @gpu_log10(%arg_f32 : f32, %arg_f64 : f64) -> (f32, f64, f32) {
    %result32 = math.log10 %arg_f32 : f32
    %result64 = math.log10 %arg_f64 : f64
    %result32Fast = math.log10 %arg_f32 fastmath<afn> : f32
    func.return %result32, %result64, %result32Fast : f32, f64, f32
  }
}



gpu.module @test_module_15 {
  func.func @gpu_log1p(%arg_f32 : f32, %arg_f64 : f64) -> (f32, f64) {
    %result32 = math.log1p %arg_f32 : f32
    %result64 = math.log1p %arg_f64 : f64
    func.return %result32, %result64 : f32, f64
  }
}



gpu.module @test_module_16 {
  func.func @gpu_log2(%arg_f32 : f32, %arg_f64 : f64) -> (f32, f64, f32) {
    %result32 = math.log2 %arg_f32 : f32
    %result64 = math.log2 %arg_f64 : f64
    %result32Fast = math.log2 %arg_f32 fastmath<fast> : f32
    func.return %result32, %result64, %result32Fast : f32, f64, f32
  }
}



gpu.module @test_module_17 {
  func.func @gpu_sin(%arg_f32 : f32, %arg_f64 : f64) -> (f32, f64, f32) {
    %result32 = math.sin %arg_f32 : f32
    %result64 = math.sin %arg_f64 : f64
    %result32Fast = math.sin %arg_f32 fastmath<fast> : f32
    func.return %result32, %result64, %result32Fast : f32, f64, f32
  }
}



gpu.module @test_module_18 {
  func.func @gpu_tan(%arg_f16 : f16, %arg_f32 : f32, %arg_f64 : f64) -> (f16, f32, f64, f32) {
    %result16 = math.tan %arg_f16 : f16
    %result32 = math.tan %arg_f32 : f32
    %result64 = math.tan %arg_f64 : f64
    %result32Fast = math.tan %arg_f32 fastmath<fast> : f32
    func.return %result16, %result32, %result64, %result32Fast : f16, f32, f64, f32
  }
}



gpu.module @test_module_19 {
  func.func @gpu_tanh(%arg_f16 : f16, %arg_f32 : f32, %arg_f64 : f64) -> (f16, f32, f64) {
    %result16 = math.tanh %arg_f16 : f16
    %result32 = math.tanh %arg_f32 : f32
    %result64 = math.tanh %arg_f64 : f64
    func.return %result16, %result32, %result64 : f16, f32, f64
  }
}



gpu.module @test_module_20 {
  func.func @gpu_rsqrt(%arg_f16 : f16, %arg_f32 : f32, %arg_f64 : f64)
      -> (f16, f32, f64) {
    %result16 = math.rsqrt %arg_f16 : f16
    %result32 = math.rsqrt %arg_f32 : f32
    %result64 = math.rsqrt %arg_f64 : f64
    func.return %result16, %result32, %result64 : f16, f32, f64
  }
}



gpu.module @test_module_21 {
  func.func @gpu_sqrt(%arg_f16 : f16, %arg_f32 : f32, %arg_f64 : f64)
      -> (f16, f32, f64) {
    %result16 = math.sqrt %arg_f16 : f16
    %result32 = math.sqrt %arg_f32 : f32
    %result64 = math.sqrt %arg_f64 : f64
    func.return %result16, %result32, %result64 : f16, f32, f64
  }
}



gpu.module @test_module_22 {
  func.func @gpu_atan(%arg_f16 : f16, %arg_f32 : f32, %arg_f64 : f64)
      -> (f16, f32, f64) {
    %result16 = math.atan %arg_f16 : f16
    %result32 = math.atan %arg_f32 : f32
    %result64 = math.atan %arg_f64 : f64
    func.return %result16, %result32, %result64 : f16, f32, f64
  }
}



gpu.module @test_module_23 {
  func.func @gpu_atan2(%arg_f16 : f16, %arg_f32 : f32, %arg_f64 : f64)
      -> (f16, f32, f64) {
    %result16 = math.atan2 %arg_f16, %arg_f16 : f16
    %result32 = math.atan2 %arg_f32, %arg_f32 : f32
    %result64 = math.atan2 %arg_f64, %arg_f64 : f64
    func.return %result16, %result32, %result64 : f16, f32, f64
  }
}



// Test that we handled properly operation with SymbolTable other than module op
gpu.module @test_module_24 {
  "test.symbol_scope"() ({
    func.func @gpu_exp(%arg_f32 : f32, %arg_f64 : f64) -> (f32, f64, f32) {
      %result32 = math.exp %arg_f32 : f32
      %result64 = math.exp %arg_f64 : f64
      %result32Fast = math.exp %arg_f32 fastmath<afn> : f32
      func.return %result32, %result64, %result32Fast : f32, f64, f32
    }
    "test.finish" () : () -> ()
  }) : () -> ()
}



gpu.module @test_module_25 {
  func.func @gpu_expm1(%arg_f32 : f32, %arg_f64 : f64) -> (f32, f64) {
    %result32 = math.expm1 %arg_f32 : f32
    %result64 = math.expm1 %arg_f64 : f64
    func.return %result32, %result64 : f32, f64
  }
}



gpu.module @test_module_26 {
  func.func @gpu_pow(%arg_f32 : f32, %arg_f64 : f64) -> (f32, f64, f32) {
    %result32 = math.powf %arg_f32, %arg_f32 : f32
    %result64 = math.powf %arg_f64, %arg_f64 : f64
    %result32Fast = math.powf %arg_f32, %arg_f32 fastmath<fast> : f32
    func.return %result32, %result64, %result32Fast : f32, f64, f32
  }
}



gpu.module @test_module_27 {
  func.func @gpu_unroll(%arg0 : vector<4xf32>) -> vector<4xf32> {
    %result = math.exp %arg0 : vector<4xf32>
    func.return %result : vector<4xf32>
  }
}



gpu.module @test_module_28 {
  gpu.func @kernel_func() kernel {
    gpu.return
  }
}



gpu.module @test_module_29 {

  gpu.func @test_const_printf() {
    gpu.printf "Hello, world\n"

    // Make sure that the same global is reused.
    gpu.printf "Hello, world\n"

    gpu.return
  }

  gpu.func @test_printf(%arg0: i32, %arg1: f32) {
    gpu.printf "Hello: %d\n", %arg0, %arg1 : i32, f32
    gpu.return
  }
}



gpu.module @test_module_30 {
  gpu.func @subgroup_reduce_add(%arg0 : i32, %buf : memref<i32>) {
    %result = gpu.subgroup_reduce add %arg0 uniform {} : (i32) -> (i32)
    memref.store %result, %buf[] : memref<i32>
    gpu.return
  }
  gpu.func @subgroup_reduce_minsi(%arg0 : i32, %buf : memref<i32>) {
    %result = gpu.subgroup_reduce minsi %arg0 uniform {} : (i32) -> (i32)
    memref.store %result, %buf[] : memref<i32>
    gpu.return
  }
  gpu.func @subgroup_reduce_maxsi(%arg0 : i32, %buf : memref<i32>) {
    %result = gpu.subgroup_reduce maxsi %arg0 uniform {} : (i32) -> (i32)
    memref.store %result, %buf[] : memref<i32>
    gpu.return
  }
  gpu.func @subgroup_reduce_and(%arg0 : i32, %buf : memref<i32>) {
    %result = gpu.subgroup_reduce and %arg0 uniform {} : (i32) -> (i32)
    memref.store %result, %buf[] : memref<i32>
    gpu.return
  }
  gpu.func @subgroup_reduce_or(%arg0 : i32, %buf : memref<i32>) {
    %result = gpu.subgroup_reduce or %arg0 uniform {} : (i32) -> (i32)
    memref.store %result, %buf[] : memref<i32>
    gpu.return
  }
  gpu.func @subgroup_reduce_xor(%arg0 : i32, %buf : memref<i32>) {
    %result = gpu.subgroup_reduce xor %arg0 uniform {} : (i32) -> (i32)
    memref.store %result, %buf[] : memref<i32>
    gpu.return
  }
}

gpu.module @test_module_31 {
  func.func @gpu_fmod(%arg_f32 : f32, %arg_f64 : f64) -> (f32, f64) {
    %result32 = arith.remf %arg_f32, %arg_f32 : f32
    %result64 = arith.remf %arg_f64, %arg_f64 : f64
    func.return %result32, %result64 : f32, f64
  }
}

gpu.module @test_module_32 {
  func.func @gpu_erf(%arg_f32 : f32, %arg_f64 : f64) -> (f32, f64) {
    %result32 = math.erf %arg_f32 : f32
    %result64 = math.erf %arg_f64 : f64
    func.return %result32, %result64 : f32, f64
  }
}

gpu.module @test_module_33 {
  gpu.func @kernel_with_block_size(%arg0: !llvm.ptr) kernel attributes {known_block_size = array<i32: 32, 4, 2>} {
    %0 = gpu.thread_id x
    %1 = gpu.thread_id y
    %2 = gpu.thread_id z

    // Fake usage to prevent dead code elimination
    %3 = arith.addi %0, %1 : index
    %4 = arith.addi %3, %2 : index
    %5 = arith.index_cast %4 : index to i64
    llvm.store %5, %arg0 : i64, !llvm.ptr
    gpu.return
  }
}


gpu.module @test_module_34 {

  gpu.func @memref_signature(%m: memref<2xf32>, %f: f32) -> (memref<2xf32>, f32) {
    gpu.return %m, %f : memref<2xf32>, f32
  }
}

gpu.module @test_module_35 {
  func.func @gpu_acos(%arg_f32 : f32, %arg_f64 : f64) -> (f32, f64) {
    %result32 = math.acos %arg_f32 : f32
    %result64 = math.acos %arg_f64 : f64
    func.return %result32, %result64 : f32, f64
  }
}

gpu.module @test_module_36 {
  func.func @gpu_acosh(%arg_f32 : f32, %arg_f64 : f64) -> (f32, f64) {
    %result32 = math.acosh %arg_f32 : f32
    %result64 = math.acosh %arg_f64 : f64
    func.return %result32, %result64 : f32, f64
  }
}

gpu.module @test_module_37 {
  func.func @gpu_asin(%arg_f32 : f32, %arg_f64 : f64) -> (f32, f64) {
    %result32 = math.asin %arg_f32 : f32
    %result64 = math.asin %arg_f64 : f64
    func.return %result32, %result64 : f32, f64
  }
}

gpu.module @test_module_38 {
  func.func @gpu_asinh(%arg_f32 : f32, %arg_f64 : f64) -> (f32, f64) {
    %result32 = math.asinh %arg_f32 : f32
    %result64 = math.asinh %arg_f64 : f64
    func.return %result32, %result64 : f32, f64
  }
}

gpu.module @test_module_39 {
  func.func @gpu_atanh(%arg_f16 : f16, %arg_f32 : f32, %arg_f64 : f64)
      -> (f16, f32, f64) {
    %result16 = math.atanh %arg_f16 : f16
    %result32 = math.atanh %arg_f32 : f32
    %result64 = math.atanh %arg_f64 : f64
    func.return %result16, %result32, %result64 : f16, f32, f64
  }
}

gpu.module @test_module_40 {
  func.func @gpu_copysign(%arg_f32 : f32, %arg_f64 : f64) -> (f32, f64) {
    %result32 = math.copysign %arg_f32, %arg_f32 : f32
    %result64 = math.copysign %arg_f64, %arg_f64 : f64
    func.return %result32, %result64 : f32, f64
  }
}

gpu.module @test_module_41 {
  func.func @gpu_cosh(%arg_f32 : f32, %arg_f64 : f64) -> (f32, f64) {
    %result32 = math.cosh %arg_f32 : f32
    %result64 = math.cosh %arg_f64 : f64
    func.return %result32, %result64 : f32, f64
  }
}

gpu.module @test_module_42 {
  func.func @gpu_fma(%arg_f32 : f32, %arg_f64 : f64) -> (f32, f64) {
    %result32 = math.fma %arg_f32, %arg_f32, %arg_f32 : f32
    %result64 = math.fma %arg_f64, %arg_f64, %arg_f64 : f64
    func.return %result32, %result64 : f32, f64
  }
}

gpu.module @test_module_43 {
  func.func @gpu_round(%arg_f32 : f32, %arg_f64 : f64) -> (f32, f64) {
    %result32 = math.round %arg_f32 : f32
    %result64 = math.round %arg_f64 : f64
    func.return %result32, %result64 : f32, f64
  }
}

gpu.module @test_module_44 {
  func.func @gpu_roundeven(%arg_f32 : f32, %arg_f64 : f64) -> (f32, f64) {
    %result32 = math.roundeven %arg_f32 : f32
    %result64 = math.roundeven %arg_f64 : f64
    func.return %result32, %result64 : f32, f64
  }
}

gpu.module @test_module_45 {
  func.func @gpu_sinh(%arg_f32 : f32, %arg_f64 : f64) -> (f32, f64) {
    %result32 = math.sinh %arg_f32 : f32
    %result64 = math.sinh %arg_f64 : f64
    func.return %result32, %result64 : f32, f64
  }
}

gpu.module @test_module_46 {
  func.func @gpu_cosh_with_fastmath(%arg_f32 : f32, %arg_f64 : f64) -> (f32, f64) {
    %result32 = math.cosh %arg_f32 fastmath<fast> : f32
    %result64 = math.cosh %arg_f64 fastmath<afn> : f64
    func.return %result32, %result64 : f32, f64
  }
}

gpu.module @test_module_47 {
  func.func @gpu_sinh_with_fastmath(%arg_f32 : f32, %arg_f64 : f64) -> (f32, f64) {
    %result32 = math.sinh %arg_f32 fastmath<contract> : f32
    %result64 = math.sinh %arg_f64 fastmath<none> : f64
    func.return %result32, %result64 : f32, f64
  }
}

gpu.module @test_module_48 {
  func.func @gpu_exp_with_fastmath(%arg_f32 : f32, %arg_f64 : f64) -> (f32, f64, f32) {
    %result32 = math.exp %arg_f32 fastmath<reassoc>: f32
    %result64 = math.exp %arg_f64 fastmath<contract>: f64
    %result32Fast = math.exp %arg_f32 fastmath<ninf> : f32
    func.return %result32, %result64, %result32Fast : f32, f64, f32
  }
}

gpu.module @test_module_49 {
  func.func @explicit_id_bounds() -> (index, index, index) {
    %0 = gpu.thread_id x upper_bound 32
    %1 = gpu.block_dim x upper_bound 32
    %2 = gpu.lane_id upper_bound 16

    return %0, %1, %2 : index, index, index
  }
}

gpu.module @test_module_50 {
  gpu.func @kernel_with_grid_size(%arg0: !llvm.ptr) kernel attributes {known_grid_size = array<i32: 32, 4, 2>} {
    %0 = gpu.block_id x
    %1 = gpu.block_id y
    %2 = gpu.block_id z

    // Fake usage to prevent dead code elimination
    %3 = arith.addi %0, %1 : index
    %4 = arith.addi %3, %2 : index
    %5 = arith.index_cast %4 : index to i64
    llvm.store %5, %arg0 : i64, !llvm.ptr
    gpu.return
  }
}


gpu.module @test_module_51 {
  gpu.func @test_assert(%arg0: i1) kernel {
    cf.assert %arg0, "assert message"
    gpu.return
  }
}

module attributes {transform.with_named_sequence} {
  transform.named_sequence @__transform_main(%toplevel_module: !transform.any_op {transform.readonly}) {
    %gpu_module = transform.structured.match ops{["gpu.module"]} in %toplevel_module
      : (!transform.any_op) -> !transform.any_op

    transform.apply_patterns to %gpu_module {
      transform.apply_patterns.gpu.gpu_rewrite_patterns
    } : !transform.any_op

    transform.apply_conversion_patterns to %gpu_module {
      transform.apply_conversion_patterns.dialect_to_llvm "arith"
      transform.apply_conversion_patterns.dialect_to_llvm "cf"
      transform.apply_conversion_patterns.vector.vector_to_llvm
      transform.apply_conversion_patterns.func.func_to_llvm
      transform.apply_conversion_patterns.dialect_to_llvm "memref"
      transform.apply_conversion_patterns.gpu.gpu_to_nvvm {benefit = 10 : i16}
      transform.apply_conversion_patterns.gpu.gpu_wmma_to_nvvm
      transform.apply_conversion_patterns.gpu.gpu_subgroup_reduce_to_nvvm
      transform.apply_conversion_patterns.nvgpu.nvgpu_to_nvvm
    } with type_converter {
      transform.apply_conversion_patterns.memref.memref_to_llvm_type_converter
        {index_bitwidth = 64,
        use_bare_ptr_call_conv = false}
    } {
      legal_dialects = ["llvm", "memref", "nvvm", "test"],
      legal_ops = ["gpu.module", "gpu.yield"],
      illegal_dialects = ["gpu"],
      illegal_ops = ["llvm.copysign", "llvm.cos", "llvm.exp", "llvm.exp2", "llvm.fabs", "llvm.fceil",
                    "llvm.ffloor", "llvm.frem", "llvm.log", "llvm.log10", "llvm.log2", "llvm.pow",
                    "llvm.roundeven", "llvm.round", "llvm.sin", "llvm.sqrt"],
      partial_conversion
    } : !transform.any_op
    transform.yield
  }
}


gpu.module @test_module_52 {
  func.func @gpu_abs(%arg_i32 : i32) -> (i32) {
    %result32 = math.absi %arg_i32 : i32
    func.return %result32 : i32
  }
}

gpu.module @test_module_53 {
  func.func @gpu_powi(%arg_f32 : f32, %arg_f64 : f64, %arg_i32 : i32) -> (f32, f64) {
    %result32 = math.fpowi %arg_f32, %arg_i32 : f32, i32
    %result64 = math.fpowi %arg_f64, %arg_i32 : f64, i32
    func.return %result32, %result64 : f32, f64
  }
}

gpu.module @test_module_54 {
  func.func @fpclassify(%f32: f32, %f64: f64) -> (i1, i1, i1, i1, i1, i1) {
    %0 = math.isinf %f32 : f32
    %1 = math.isinf %f64 : f64
    %2 = math.isnan %f32 : f32
    %3 = math.isnan %f64 : f64
    %4 = math.isfinite %f32 : f32
    %5 = math.isfinite %f64 : f64
    return %0, %1, %2, %3, %4, %5 : i1, i1, i1, i1, i1, i1
  }
}

gpu.module @test_module_55 {
  func.func @gpu_erfc(%arg_f32 : f32, %arg_f64 : f64) -> (f32, f64) {
    %result32 = math.erfc %arg_f32 : f32
    %result64 = math.erfc %arg_f64 : f64
    func.return %result32, %result64 : f32, f64
  }
}

gpu.module @test_module_56 {


  func.func @gpu_sincos(%arg_f16 : f16, %arg_f32 : f32, %arg_f64 : f64) -> (f16, f16, f32, f32, f64, f64) {
    %sin16, %cos16 = math.sincos %arg_f16 : f16
    %sin32, %cos32 = math.sincos %arg_f32 : f32
    %sin64, %cos64 = math.sincos %arg_f64 : f64
    func.return %sin16, %cos16, %sin32, %cos32, %sin64, %cos64 : f16, f16, f32, f32, f64, f64
  }


  func.func @gpu_sincos_fastmath(%arg_f16 : f16, %arg_f32 : f32, %arg_f64 : f64) -> (f16, f16, f32, f32, f64, f64) {
    %sin16, %cos16 = math.sincos %arg_f16 fastmath<afn> : f16
    %sin32, %cos32 = math.sincos %arg_f32 fastmath<afn> : f32
    %sin64, %cos64 = math.sincos %arg_f64 fastmath<afn> : f64
    func.return %sin16, %cos16, %sin32, %cos32, %sin64, %cos64 : f16, f16, f32, f32, f64, f64
  }
}

// -----

gpu.module @test_module_cluster_size {
  gpu.func @kernel_with_cluster_size() kernel attributes {known_cluster_size = array<i32: 8, 2, 4>} {
    gpu.return
  }
}

// -----

gpu.module @test_module_cluster_block_ops {
  gpu.func @kernel_with_cluster_size(%arg0: !llvm.ptr) kernel attributes {known_cluster_size = array<i32: 8, 4, 2>} {
    %0 = gpu.cluster_block_id x
    %1 = gpu.cluster_block_id y
    %2 = gpu.cluster_block_id z
    %3 = gpu.cluster_dim_blocks x
    %4 = gpu.cluster_dim_blocks y
    %5 = gpu.cluster_dim_blocks z

    %6 = arith.addi %0, %1 : index
    %7 = arith.addi %6, %2 : index
    %8 = arith.addi %7, %3 : index
    %9 = arith.addi %8, %4 : index
    %10 = arith.addi %9, %5 : index
    %11 = arith.index_cast %10 : index to i64
    llvm.store %11, %arg0 : i64, !llvm.ptr
    gpu.return
  }
}

// -----

module attributes {gpu.container_module} {
  gpu.module @kernels {
    gpu.func @gpu_ballot(%arg0: i1) -> (i32, i64) {
      %0 = gpu.ballot %arg0 : i32
      %1 = gpu.ballot %arg0 : i64
      gpu.return %0, %1 : i32, i64
    }
  }
}
