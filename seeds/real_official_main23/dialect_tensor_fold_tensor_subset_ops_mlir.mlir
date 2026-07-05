func.func @fold_vector_transfer_read_with_rank_reduced_extract_slice(
    %arg0 : tensor<?x?x?xf32>,
    %arg1: index, %arg2 : index, %arg3 : index, %arg4: index, %arg5 : index,
    %arg6 : index) -> vector<4xf32> {
  %cst = arith.constant 0.0 : f32
  %0 = tensor.extract_slice %arg0[0, %arg1, %arg2] [1, %arg3, %arg4] [1, 1, 1]
      : tensor<?x?x?xf32> to
        tensor<?x?xf32>
  %1 = vector.transfer_read %0[%arg5, %arg6], %cst {in_bounds = [true]}
      : tensor<?x?xf32>, vector<4xf32>
  return %1 : vector<4xf32>
}

// -----

func.func @transfer_read_from_rank_reducing_extract_slice_failure(
    %src: tensor<1x8x8x8xf32>,
    %i1: index, %i2: index, %i3: index, %i4: index) -> vector<4xf32> {
  %c0 = arith.constant 0 : index
  %c1 = arith.constant 1 : index
  %c2 = arith.constant 2 : index
  %f0 = arith.constant 0.000000e+00 : f32

  // Can't fold this atm since we don' emit the proper vector.extract_strided_slice.
  %0 = tensor.extract_slice %src[0, %i1, %i2, %i3] [1, 4, 1, 4] [2, 3, 4, 5] : tensor<1x8x8x8xf32> to tensor<1x4x4xf32>
  %1 = vector.transfer_read %0[%c1, %i4, %c2], %f0 {in_bounds = [true]} : tensor<1x4x4xf32>, vector<4xf32>
  return %1 : vector<4xf32>
}

// -----


func.func @transfer_read_of_extract_slice(%t : tensor<?x?xf32>, %s1 : index, %s2 : index) -> vector<5x6xf32> {
  %c3 = arith.constant 3 : index
  %c4 = arith.constant 4 : index
  %cst = arith.constant 0.0 : f32
  %0 = tensor.extract_slice %t[5, %s1] [10, %s2] [1, 1] : tensor<?x?xf32> to tensor<10x?xf32>
  %1 = vector.transfer_read %0[%c3, %c4], %cst {in_bounds = [true, true]} : tensor<10x?xf32>, vector<5x6xf32>
  return %1 : vector<5x6xf32>
}
// -----

func.func @fold_extract_slice_with_transfer_read_0d(
  %arg0 : tensor<12x32xf32>, %arg1 : index, %arg2 : index, %arg3 : index)
    -> vector<f32> {
  %f1 = arith.constant 1.0 : f32
  %0 = tensor.extract_slice %arg0[%arg1, %arg2][1, 1][1, 1] : tensor<12x32xf32> to tensor<f32>
  %1 = vector.transfer_read %0[], %f1 : tensor<f32>, vector<f32>
  return %1 : vector<f32>
}

// -----


func.func @transfer_read_of_extract_slice(%t : tensor<?x?xf32>, %s1 : index, %s2 : index) -> vector<6xf32> {
  %c3 = arith.constant 3 : index
  %c4 = arith.constant 4 : index
  %cst = arith.constant 0.0 : f32
  %0 = tensor.extract_slice %t[5, %s1] [10, %s2] [1, 1] : tensor<?x?xf32> to tensor<10x?xf32>
  %1 = vector.transfer_read %0[%c3, %c4], %cst {in_bounds = [true]} : tensor<10x?xf32>, vector<6xf32>
  return %1 : vector<6xf32>
}

// -----


func.func @transfer_read_of_extract_slice_rank_reducing(%t : tensor<?x?x?xf32>, %s1 : index, %s2 : index) -> vector<5x6xf32> {
  %c3 = arith.constant 3 : index
  %c4 = arith.constant 4 : index
  %cst = arith.constant 0.0 : f32
  %0 = tensor.extract_slice %t[5, %s1, 6] [1, %s2, 12] [1, 1, 1] : tensor<?x?x?xf32> to tensor<?x12xf32>
  %1 = vector.transfer_read %0[%c3, %c4], %cst {in_bounds = [true, true]} : tensor<?x12xf32>, vector<5x6xf32>
  return %1 : vector<5x6xf32>
}

// -----


func.func @transfer_read_of_extract_slice_swappy_rank_reducing(%t : tensor<?x?x?xf32>, %s1 : index, %s2 : index) -> vector<5x6xf32> {
  %c3 = arith.constant 3 : index
  %c4 = arith.constant 4 : index
  %cst = arith.constant 0.0 : f32

  %0 = tensor.extract_slice %t[5, %s1, %s2] [%s2, 1, 12] [1, 1, 1] : tensor<?x?x?xf32> to tensor<?x12xf32>
  %1 = vector.transfer_read %0[%c3, %c4], %cst {in_bounds = [true, true]} : tensor<?x12xf32>, vector<5x6xf32>

  return %1 : vector<5x6xf32>
}

// -----

func.func @fold_vector_transfer_write_with_rank_reduced_insert_slice(
    %arg0 : tensor<?x?x?xf32>,
    %arg1 : vector<4xf32>, %arg2: index, %arg3 : index, %arg4 : index,
    %arg5: index, %arg6 : index, %arg7 : index,
    %st : tensor<?x?xf32>) -> tensor<?x?x?xf32> {
  %cst = arith.constant 0.0 : f32

  %0 = vector.transfer_write %arg1, %st[%arg6, %arg7] {in_bounds = [true]}
      : vector<4xf32>, tensor<?x?xf32>
  %1 = tensor.insert_slice %0 into %arg0[0, %arg2, %arg3] [1, %arg4, %arg5] [1, 1, 1]
      : tensor<?x?xf32> into tensor<?x?x?xf32>
  return %1 : tensor<?x?x?xf32>
}

// -----

func.func @fold_vector_transfer_write_with_inner_rank_reduced_insert_slice(
    %arg0 : tensor<?x?x?xf32>,
    %arg1 : vector<4xf32>, %arg2: index, %arg3 : index, %arg4 : index,
    %arg5: index, %arg6 : index, %arg7 : index,
    %st : tensor<?x?xf32>) -> tensor<?x?x?xf32> {
  %cst = arith.constant 0.0 : f32

  %0 = vector.transfer_write %arg1, %st[%arg6, %arg7] {in_bounds = [true]}
      : vector<4xf32>, tensor<?x?xf32>
  %1 = tensor.insert_slice %0 into %arg0[%arg2, %arg3, 0] [%arg4, %arg5, 1] [1, 1, 1]
      : tensor<?x?xf32> into tensor<?x?x?xf32>
  return %1 : tensor<?x?x?xf32>
}

// -----

func.func @insert_slice_of_transfer_write(%t1 : tensor<?x12xf32>, %v : vector<5x6xf32>, %s : index, %t2 : tensor<5x6xf32>) -> tensor<?x12xf32> {
  %c0 = arith.constant 0 : index

  %0 = vector.transfer_write %v, %t2[%c0, %c0] {in_bounds = [true, true]} : vector<5x6xf32>, tensor<5x6xf32>
  %1 = tensor.insert_slice %0 into %t1[3, %s] [5, 6] [1, 1] : tensor<5x6xf32> into tensor<?x12xf32>
  return %1 : tensor<?x12xf32>
}

// -----

// This test is negative since `transfer_write` only
// writes to `5x6` of the `100x100` elements of `%arg3`
func.func @insert_slice_of_transfer_write_overwrite_all(%arg0: tensor<1000x1000xf32>, %arg1: vector<5x6xf32>, %arg2: index, %arg3: tensor<100x100xf32>) -> tensor<1000x1000xf32> {
  %c0 = arith.constant 0 : index

  %0 = vector.transfer_write %arg1, %arg3[%c0, %c0] {in_bounds = [true, true]} : vector<5x6xf32>, tensor<100x100xf32>
  %inserted_slice = tensor.insert_slice %0 into %arg0[3, %arg2] [100, 100] [1, 1] : tensor<100x100xf32> into tensor<1000x1000xf32>
  return %inserted_slice : tensor<1000x1000xf32>
}

// -----


func.func @insert_slice_of_transfer_write_swappy_rank_extending(
    %t1 : tensor<?x?x12xf32>, %v : vector<5x6xf32>, 
    %s : index, %t2 : tensor<5x6xf32>) -> tensor<?x?x12xf32> {
  %c0 = arith.constant 0 : index

  %0 = vector.transfer_write %v, %t2[%c0, %c0] {in_bounds = [true, true]} : vector<5x6xf32>, tensor<5x6xf32>
  %1 = tensor.insert_slice %0 into %t1[4, 3, %s] [5, 1, 6] [1, 1, 1] : tensor<5x6xf32> into tensor<?x?x12xf32>
  return %1 : tensor<?x?x12xf32>
}

// -----

func.func @insert_slice_of_transfer_write_rank_extending(%t1 : tensor<?x?x12xf32>, %v : vector<5x6xf32>, %s : index, %t2 : tensor<5x6xf32>) -> tensor<?x?x12xf32> {
  %c0 = arith.constant 0 : index
  %0 = vector.transfer_write %v, %t2[%c0, %c0] {in_bounds = [true, true]} : vector<5x6xf32>, tensor<5x6xf32>
  %1 = tensor.insert_slice %0 into %t1[4, 3, %s] [1, 5, 6] [1, 1, 1] : tensor<5x6xf32> into tensor<?x?x12xf32>
  return %1 : tensor<?x?x12xf32>
}

// -----

func.func @insert_slice_of_insert_slice(%t: tensor<f32>, %r0: tensor<1x1xf32>, %r1: tensor<1x14xf32>, %pos: index)
    -> tensor<1x14xf32> 
{
  %0 = tensor.insert_slice %t into %r0[0, 0] [1, 1] [1, 1] 
    : tensor<f32> into tensor<1x1xf32>
  %1 = tensor.insert_slice %0 into %r1[0, %pos] [1, 1] [1, 1] 
    : tensor<1x1xf32> into tensor<1x14xf32>
  return %1 : tensor<1x14xf32>
}

// -----

func.func @insert_slice_of_insert_slice(%t: tensor<f32>, %r0: tensor<1xf32>, %r1: tensor<1x14xf32>, %pos: index)
    -> tensor<1x14xf32> 
{
  %0 = tensor.insert_slice %t into %r0[0] [1] [1] 
    : tensor<f32> into tensor<1xf32>
  %1 = tensor.insert_slice %0 into %r1[0, %pos] [1, 1] [1, 1] 
    : tensor<1xf32> into tensor<1x14xf32>
  return %1 : tensor<1x14xf32>
}

// -----

func.func @insert_slice_of_insert_slice_non_unit_stride(
  %t: tensor<f32>, %r0: tensor<1xf32>, %r1: tensor<1x14xf32>, %pos: index)
    -> tensor<1x14xf32> 
{
  %0 = tensor.insert_slice %t into %r0[0] [1] [1] 
    : tensor<f32> into tensor<1xf32>
  %1 = tensor.insert_slice %0 into %r1[0, %pos] [1, 1] [1, 2] 
    : tensor<1xf32> into tensor<1x14xf32>
  return %1 : tensor<1x14xf32>
}

// -----

// This test fails to fold because the size `4` and `%pos` do not match: 
// this requires a copy
func.func @fail_insert_slice_of_insert_slice(
  %t: tensor<4xf32>, %r0: tensor<?xf32>, %r1: tensor<?x?xf32>, %pos: index)
    -> tensor<?x?xf32> 
{
  %0 = tensor.insert_slice %t into %r0[%pos] [4] [1] 
    : tensor<4xf32> into tensor<?xf32>
  %1 = tensor.insert_slice %0 into %r1[%pos, 423] [%pos, 1] [1, 1] 
    : tensor<?xf32> into tensor<?x?xf32>
  return %1 : tensor<?x?xf32>
}

// -----

// Here the sizes are the same and the folding occurs properly.
func.func @insert_slice_of_insert_slice_dynamic(
  %t: tensor<?xf32>, %r0: tensor<?xf32>, %r1: tensor<?x?xf32>, %pos: index)
    -> tensor<?x?xf32> 
{
  %0 = tensor.insert_slice %t into %r0[%pos] [%pos] [1] 
    : tensor<?xf32> into tensor<?xf32>
  %1 = tensor.insert_slice %0 into %r1[%pos, 423] [%pos, 1] [%pos, 1] 
    : tensor<?xf32> into tensor<?x?xf32>
  return %1 : tensor<?x?xf32>
}

// -----

// Here the sizes are the same and the folding occurs properly.
func.func @insert_slice_of_insert_slice_dynamic(
  %t: tensor<?xf32>, %r0: tensor<?xf32>, %r1: tensor<?x?xf32>, %pos: index)
    -> tensor<?x?xf32> 
{
  %0 = tensor.insert_slice %t into %r0[%pos] [%pos] [1] 
    : tensor<?xf32> into tensor<?xf32>
  %1 = tensor.insert_slice %0 into %r1[%pos, 423] [%pos, 1] [1, 1] 
    : tensor<?xf32> into tensor<?x?xf32>
  return %1 : tensor<?x?xf32>
}

// -----

func.func @parallel_insert_slice_of_insert_slice_dynamic(
    %t: tensor<12x34xf32>, %o0: index, %o1: index, %sz0: index, %sz1: index) 
      -> tensor<12x34xf32>{

  %0 = scf.forall (%arg0, %arg1) in (27, 8) shared_outs(%arg2 = %t) -> (tensor<12x34xf32>) {
    %tt = "make_me_a_tensor"() : () -> tensor<?x?xf32>
    %tt2 = "make_me_another_tensor"() : () -> tensor<?x?xf32>
    %inserted_slice = tensor.insert_slice %tt into %tt2[%o1, 0] [%sz0, %sz1] [1, 1] : tensor<?x?xf32> into tensor<?x?xf32>

    scf.forall.in_parallel {
      tensor.parallel_insert_slice %inserted_slice into %arg2[%o0, %o1] [%sz0, %sz1] [1, 1]
        : tensor<?x?xf32> into tensor<12x34xf32>
    }
  }
  return %0: tensor<12x34xf32>
}

// -----

func.func @extract_slice_same_rank(
    %src: tensor<?x?x?x?xf32>, %offset0: index, %offset1: index, %size0: index, %size1: index) -> tensor<8x16x32x?xf32> {
  %0 = tensor.extract_slice %src[0, 1, 2, %offset0] [128, 128, 128, %size0] [1, 1, 1, 1] : tensor<?x?x?x?xf32> to tensor<128x128x128x?xf32>
  %1 = tensor.extract_slice %0[7, 8, 9, %offset1] [8, 16, 32, %size1] [1, 1, 1, 1] : tensor<128x128x128x?xf32> to tensor<8x16x32x?xf32>
  return %1: tensor<8x16x32x?xf32>
}

// -----

func.func @extract_slice_rank_reducing_consumer(
    %src: tensor<?x?x?x?xf32>, %offset0: index, %offset1: index, %size0: index, %size1: index) -> tensor<16x?xf32> {
  %0 = tensor.extract_slice %src[0, 1, 2, %offset0] [128, 128, 128, %size0] [1, 1, 1, 1] : tensor<?x?x?x?xf32> to tensor<128x128x128x?xf32>
  %1 = tensor.extract_slice %0[7, 8, 9, %offset1] [1, 16, 1, %size1] [1, 1, 1, 1] : tensor<128x128x128x?xf32> to tensor<16x?xf32>
  return %1: tensor<16x?xf32>
}

// -----

func.func @extract_slice_rank_reducing_producer(
    %src: tensor<?x?x?x?xf32>, %offset0: index, %offset1: index, %size0: index, %size1: index) -> tensor<8x?xf32> {
  %0 = tensor.extract_slice %src[0, 1, 2, %offset0] [1, 128, 1, %size0] [1, 1, 1, 1] : tensor<?x?x?x?xf32> to tensor<128x?xf32>
  %1 = tensor.extract_slice %0[7, %offset1] [8, %size1] [1, 1] : tensor<128x?xf32> to tensor<8x?xf32>
  return %1: tensor<8x?xf32>
}

// -----

func.func @extract_slice_non_one_stride(
    %src: tensor<?xf32>, %offset0: index, %offset1: index, %size0: index, %size1: index, %stride0: index, %stride1: index) -> tensor<?xf32> {
  %0 = tensor.extract_slice %src[%offset0] [%size0] [%stride0] : tensor<?xf32> to tensor<?xf32>
  %1 = tensor.extract_slice %0[%offset1] [%size1] [%stride1] : tensor<?xf32> to tensor<?xf32>
  return %1: tensor<?xf32>
}
