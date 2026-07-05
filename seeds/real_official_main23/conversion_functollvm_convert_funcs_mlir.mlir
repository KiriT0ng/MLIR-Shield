func.func private @second_order_arg(%arg0 : () -> ())

func.func private @second_order_result() -> (() -> ())

func.func private @second_order_multi_result() -> (() -> (i32), () -> (i64), () -> (f32))

// Check that memrefs are converted to argument packs if appear as function arguments.
func.func private @memref_call_conv(%arg0: memref<?xf32>)

// Same in nested functions.
func.func private @memref_call_conv_nested(%arg0: (memref<?xf32>) -> ())

func.func @pass_through(%arg0: () -> ()) -> (() -> ()) {
  cf.br ^bb1(%arg0 : () -> ())

^bb1(%bbarg: () -> ()):
  return %bbarg : () -> ()
}

func.func private @llvmlinkage(i32) attributes { "llvm.linkage" = #llvm.linkage<extern_weak> }

func.func private @llvmreadnone(i32) attributes { llvm.readnone }

func.func private @body(i32)

func.func @indirect_const_call(%arg0: i32) {
  %0 = constant @body : (i32) -> ()
  call_indirect %0(%arg0) : (i32) -> ()
  return
}

func.func @indirect_call(%arg0: (f32) -> i32, %arg1: f32) -> i32 {
  %0 = call_indirect %arg0(%arg1) : (f32) -> i32
  return %0 : i32
}

func.func @variadic_func(%arg0: i32) attributes { "func.varargs" = true } {
  return
}

func.func private @target_cpu() attributes { "llvm.target_cpu" = "gfx90a" }

func.func private @target_features() attributes {
  "llvm.target_features" = #llvm.target_features<["+sme", "+sve"]>
}

func.func private @passthrough_attr() attributes {
  "llvm.passthrough" = ["presplitcoroutine"]
}

// -----

func.func private @private_callee(%arg1: f32) -> i32 {
  %0 = arith.constant 0 : i32
  return %0 : i32
}

func.func @caller_private_callee(%arg1: f32) -> i32 {
  %0 = call @private_callee(%arg1) : (f32) -> i32
  return %0 : i32
}

// -----

// expected-error@+1{{'func.func' op invalid llvm.func propertyInvalid attribute `linkage` in property conversion: 3 : i64}}
func.func private @badllvmlinkage(i32) attributes { "llvm.linkage" = 3 : i64 }

// -----

// expected-error@+1{{C interface for variadic functions is not supported yet.}}
func.func @variadic_func(%arg0: i32) attributes { "func.varargs" = true, "llvm.emit_c_interface" } {
  return
}

// -----

func.func @empty_res_attrs() attributes {res_attrs = []} {
  return
}

// -----

// Internal `llvm.linkage` must lower correctly
func.func @host_next_to_gpu_module() attributes { llvm.linkage = #llvm.linkage<internal> } {
  return
}
gpu.module @gpu_mod {
  gpu.func @gpu_kernel() kernel {
    gpu.return
  }
}
