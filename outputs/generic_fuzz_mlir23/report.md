# Generic MLIR 23 Fuzz Report

- Tool: `mlir-opt-23`
- Seeds: 80
- Runs: 400
- Hard failures: 40

## Hard failure

- Seed: `seeds/generic_fuzz_mlir23/generic_custom_region_0000.mlir`
- Pipeline: `inline_allow_unregistered`
- Family: `custom_region`

```text
PLEASE submit a bug report to https://github.com/llvm/llvm-project/issues/ and include the crash backtrace and instructions to reproduce the bug.
Stack dump:
0.	Program arguments: mlir-opt-23 --allow-unregistered-dialect --inline -o -
Stack dump without symbol names (ensure you have llvm-symbolizer in your PATH or set the environment var `LLVM_SYMBOLIZER_PATH` to point to it):
0  libLLVM.so.23.0 0x0000757b1efc11fc llvm::sys::PrintStackTrace(llvm::raw_ostream&, int) + 60
1  libLLVM.so.23.0 0x0000757b1efbeb63 llvm::sys::RunSignalHandlers() + 131
2  libLLVM.so.23.0 0x0000757b1efc1fd4
3  libc.so.6       0x0000757b19642520
4  libMLIR.so.23.0 0x0000757b29f847cd
5  libMLIR.so.23.0 0x0000757b29f844c3
6  libMLIR.so.23.0 0x0000757b29f839a0 mlir::Inliner::doInlining() + 832
7  libMLIR.so.23.0 0x0000757b29f9e265
8  libMLIR.so.23.0 0x0000757b29cab6a3 mlir::detail::OpToOpPassAdaptor::run(mlir::Pass*, mlir::Operation*, mlir::AnalysisManager, bool, unsigned int) + 979
9  libMLIR.so.23.0 0x0000757b29cabcc7 mlir::detail::OpToOpPassAdaptor::runPipeline(mlir::OpPassManager&, mlir::Operation*, mlir::AnalysisManager, bool, unsigned int, mlir::PassInstrumentor*, mlir::PassInstrumentation::PipelineParentI
```

## Hard failure

- Seed: `seeds/generic_fuzz_mlir23/generic_graph_region_0001.mlir`
- Pipeline: `inline_allow_unregistered`
- Family: `custom_graph_region`

```text
PLEASE submit a bug report to https://github.com/llvm/llvm-project/issues/ and include the crash backtrace and instructions to reproduce the bug.
Stack dump:
0.	Program arguments: mlir-opt-23 --allow-unregistered-dialect --inline -o -
Stack dump without symbol names (ensure you have llvm-symbolizer in your PATH or set the environment var `LLVM_SYMBOLIZER_PATH` to point to it):
0  libLLVM.so.23.0 0x0000749a3e1c11fc llvm::sys::PrintStackTrace(llvm::raw_ostream&, int) + 60
1  libLLVM.so.23.0 0x0000749a3e1beb63 llvm::sys::RunSignalHandlers() + 131
2  libLLVM.so.23.0 0x0000749a3e1c1fd4
3  libc.so.6       0x0000749a38842520
4  libMLIR.so.23.0 0x0000749a491847cd
5  libMLIR.so.23.0 0x0000749a491845dd
6  libMLIR.so.23.0 0x0000749a49183826 mlir::Inliner::doInlining() + 454
7  libMLIR.so.23.0 0x0000749a4919e265
8  libMLIR.so.23.0 0x0000749a48eab6a3 mlir::detail::OpToOpPassAdaptor::run(mlir::Pass*, mlir::Operation*, mlir::AnalysisManager, bool, unsigned int) + 979
9  libMLIR.so.23.0 0x0000749a48eabcc7 mlir::detail::OpToOpPassAdaptor::runPipeline(mlir::OpPassManager&, mlir::Operation*, mlir::AnalysisManager, bool, unsigned int, mlir::PassInstrumentor*, mlir::PassInstrumentation::PipelineParentI
```

## Hard failure

- Seed: `seeds/generic_fuzz_mlir23/generic_custom_region_0004.mlir`
- Pipeline: `inline_allow_unregistered`
- Family: `custom_region`

```text
PLEASE submit a bug report to https://github.com/llvm/llvm-project/issues/ and include the crash backtrace and instructions to reproduce the bug.
Stack dump:
0.	Program arguments: mlir-opt-23 --allow-unregistered-dialect --inline -o -
Stack dump without symbol names (ensure you have llvm-symbolizer in your PATH or set the environment var `LLVM_SYMBOLIZER_PATH` to point to it):
0  libLLVM.so.23.0 0x0000718551dc11fc llvm::sys::PrintStackTrace(llvm::raw_ostream&, int) + 60
1  libLLVM.so.23.0 0x0000718551dbeb63 llvm::sys::RunSignalHandlers() + 131
2  libLLVM.so.23.0 0x0000718551dc1fd4
3  libc.so.6       0x000071854c442520
4  libMLIR.so.23.0 0x000071855cd847cd
5  libMLIR.so.23.0 0x000071855cd844c3
6  libMLIR.so.23.0 0x000071855cd839a0 mlir::Inliner::doInlining() + 832
7  libMLIR.so.23.0 0x000071855cd9e265
8  libMLIR.so.23.0 0x000071855caab6a3 mlir::detail::OpToOpPassAdaptor::run(mlir::Pass*, mlir::Operation*, mlir::AnalysisManager, bool, unsigned int) + 979
9  libMLIR.so.23.0 0x000071855caabcc7 mlir::detail::OpToOpPassAdaptor::runPipeline(mlir::OpPassManager&, mlir::Operation*, mlir::AnalysisManager, bool, unsigned int, mlir::PassInstrumentor*, mlir::PassInstrumentation::PipelineParentI
```

## Hard failure

- Seed: `seeds/generic_fuzz_mlir23/generic_graph_region_0005.mlir`
- Pipeline: `inline_allow_unregistered`
- Family: `custom_graph_region`

```text
PLEASE submit a bug report to https://github.com/llvm/llvm-project/issues/ and include the crash backtrace and instructions to reproduce the bug.
Stack dump:
0.	Program arguments: mlir-opt-23 --allow-unregistered-dialect --inline -o -
Stack dump without symbol names (ensure you have llvm-symbolizer in your PATH or set the environment var `LLVM_SYMBOLIZER_PATH` to point to it):
0  libLLVM.so.23.0 0x00007b2c483c11fc llvm::sys::PrintStackTrace(llvm::raw_ostream&, int) + 60
1  libLLVM.so.23.0 0x00007b2c483beb63 llvm::sys::RunSignalHandlers() + 131
2  libLLVM.so.23.0 0x00007b2c483c1fd4
3  libc.so.6       0x00007b2c42a42520
4  libMLIR.so.23.0 0x00007b2c533847cd
5  libMLIR.so.23.0 0x00007b2c533845dd
6  libMLIR.so.23.0 0x00007b2c53383826 mlir::Inliner::doInlining() + 454
7  libMLIR.so.23.0 0x00007b2c5339e265
8  libMLIR.so.23.0 0x00007b2c530ab6a3 mlir::detail::OpToOpPassAdaptor::run(mlir::Pass*, mlir::Operation*, mlir::AnalysisManager, bool, unsigned int) + 979
9  libMLIR.so.23.0 0x00007b2c530abcc7 mlir::detail::OpToOpPassAdaptor::runPipeline(mlir::OpPassManager&, mlir::Operation*, mlir::AnalysisManager, bool, unsigned int, mlir::PassInstrumentor*, mlir::PassInstrumentation::PipelineParentI
```

## Hard failure

- Seed: `seeds/generic_fuzz_mlir23/generic_custom_region_0008.mlir`
- Pipeline: `inline_allow_unregistered`
- Family: `custom_region`

```text
PLEASE submit a bug report to https://github.com/llvm/llvm-project/issues/ and include the crash backtrace and instructions to reproduce the bug.
Stack dump:
0.	Program arguments: mlir-opt-23 --allow-unregistered-dialect --inline -o -
Stack dump without symbol names (ensure you have llvm-symbolizer in your PATH or set the environment var `LLVM_SYMBOLIZER_PATH` to point to it):
0  libLLVM.so.23.0 0x00007512433c11fc llvm::sys::PrintStackTrace(llvm::raw_ostream&, int) + 60
1  libLLVM.so.23.0 0x00007512433beb63 llvm::sys::RunSignalHandlers() + 131
2  libLLVM.so.23.0 0x00007512433c1fd4
3  libc.so.6       0x000075123da42520
4  libMLIR.so.23.0 0x000075124e3847cd
5  libMLIR.so.23.0 0x000075124e3844c3
6  libMLIR.so.23.0 0x000075124e3839a0 mlir::Inliner::doInlining() + 832
7  libMLIR.so.23.0 0x000075124e39e265
8  libMLIR.so.23.0 0x000075124e0ab6a3 mlir::detail::OpToOpPassAdaptor::run(mlir::Pass*, mlir::Operation*, mlir::AnalysisManager, bool, unsigned int) + 979
9  libMLIR.so.23.0 0x000075124e0abcc7 mlir::detail::OpToOpPassAdaptor::runPipeline(mlir::OpPassManager&, mlir::Operation*, mlir::AnalysisManager, bool, unsigned int, mlir::PassInstrumentor*, mlir::PassInstrumentation::PipelineParentI
```

## Hard failure

- Seed: `seeds/generic_fuzz_mlir23/generic_graph_region_0009.mlir`
- Pipeline: `inline_allow_unregistered`
- Family: `custom_graph_region`

```text
PLEASE submit a bug report to https://github.com/llvm/llvm-project/issues/ and include the crash backtrace and instructions to reproduce the bug.
Stack dump:
0.	Program arguments: mlir-opt-23 --allow-unregistered-dialect --inline -o -
Stack dump without symbol names (ensure you have llvm-symbolizer in your PATH or set the environment var `LLVM_SYMBOLIZER_PATH` to point to it):
0  libLLVM.so.23.0 0x0000717ed25c11fc llvm::sys::PrintStackTrace(llvm::raw_ostream&, int) + 60
1  libLLVM.so.23.0 0x0000717ed25beb63 llvm::sys::RunSignalHandlers() + 131
2  libLLVM.so.23.0 0x0000717ed25c1fd4
3  libc.so.6       0x0000717eccc42520
4  libMLIR.so.23.0 0x0000717edd5847cd
5  libMLIR.so.23.0 0x0000717edd5845dd
6  libMLIR.so.23.0 0x0000717edd583826 mlir::Inliner::doInlining() + 454
7  libMLIR.so.23.0 0x0000717edd59e265
8  libMLIR.so.23.0 0x0000717edd2ab6a3 mlir::detail::OpToOpPassAdaptor::run(mlir::Pass*, mlir::Operation*, mlir::AnalysisManager, bool, unsigned int) + 979
9  libMLIR.so.23.0 0x0000717edd2abcc7 mlir::detail::OpToOpPassAdaptor::runPipeline(mlir::OpPassManager&, mlir::Operation*, mlir::AnalysisManager, bool, unsigned int, mlir::PassInstrumentor*, mlir::PassInstrumentation::PipelineParentI
```

## Hard failure

- Seed: `seeds/generic_fuzz_mlir23/generic_custom_region_0012.mlir`
- Pipeline: `inline_allow_unregistered`
- Family: `custom_region`

```text
PLEASE submit a bug report to https://github.com/llvm/llvm-project/issues/ and include the crash backtrace and instructions to reproduce the bug.
Stack dump:
0.	Program arguments: mlir-opt-23 --allow-unregistered-dialect --inline -o -
Stack dump without symbol names (ensure you have llvm-symbolizer in your PATH or set the environment var `LLVM_SYMBOLIZER_PATH` to point to it):
0  libLLVM.so.23.0 0x00007df1ac1c11fc llvm::sys::PrintStackTrace(llvm::raw_ostream&, int) + 60
1  libLLVM.so.23.0 0x00007df1ac1beb63 llvm::sys::RunSignalHandlers() + 131
2  libLLVM.so.23.0 0x00007df1ac1c1fd4
3  libc.so.6       0x00007df1a6842520
4  libMLIR.so.23.0 0x00007df1b71847cd
5  libMLIR.so.23.0 0x00007df1b71844c3
6  libMLIR.so.23.0 0x00007df1b71839a0 mlir::Inliner::doInlining() + 832
7  libMLIR.so.23.0 0x00007df1b719e265
8  libMLIR.so.23.0 0x00007df1b6eab6a3 mlir::detail::OpToOpPassAdaptor::run(mlir::Pass*, mlir::Operation*, mlir::AnalysisManager, bool, unsigned int) + 979
9  libMLIR.so.23.0 0x00007df1b6eabcc7 mlir::detail::OpToOpPassAdaptor::runPipeline(mlir::OpPassManager&, mlir::Operation*, mlir::AnalysisManager, bool, unsigned int, mlir::PassInstrumentor*, mlir::PassInstrumentation::PipelineParentI
```

## Hard failure

- Seed: `seeds/generic_fuzz_mlir23/generic_graph_region_0013.mlir`
- Pipeline: `inline_allow_unregistered`
- Family: `custom_graph_region`

```text
PLEASE submit a bug report to https://github.com/llvm/llvm-project/issues/ and include the crash backtrace and instructions to reproduce the bug.
Stack dump:
0.	Program arguments: mlir-opt-23 --allow-unregistered-dialect --inline -o -
Stack dump without symbol names (ensure you have llvm-symbolizer in your PATH or set the environment var `LLVM_SYMBOLIZER_PATH` to point to it):
0  libLLVM.so.23.0 0x000073450f7c11fc llvm::sys::PrintStackTrace(llvm::raw_ostream&, int) + 60
1  libLLVM.so.23.0 0x000073450f7beb63 llvm::sys::RunSignalHandlers() + 131
2  libLLVM.so.23.0 0x000073450f7c1fd4
3  libc.so.6       0x0000734509e42520
4  libMLIR.so.23.0 0x000073451a7847cd
5  libMLIR.so.23.0 0x000073451a7845dd
6  libMLIR.so.23.0 0x000073451a783826 mlir::Inliner::doInlining() + 454
7  libMLIR.so.23.0 0x000073451a79e265
8  libMLIR.so.23.0 0x000073451a4ab6a3 mlir::detail::OpToOpPassAdaptor::run(mlir::Pass*, mlir::Operation*, mlir::AnalysisManager, bool, unsigned int) + 979
9  libMLIR.so.23.0 0x000073451a4abcc7 mlir::detail::OpToOpPassAdaptor::runPipeline(mlir::OpPassManager&, mlir::Operation*, mlir::AnalysisManager, bool, unsigned int, mlir::PassInstrumentor*, mlir::PassInstrumentation::PipelineParentI
```

## Hard failure

- Seed: `seeds/generic_fuzz_mlir23/generic_custom_region_0016.mlir`
- Pipeline: `inline_allow_unregistered`
- Family: `custom_region`

```text
PLEASE submit a bug report to https://github.com/llvm/llvm-project/issues/ and include the crash backtrace and instructions to reproduce the bug.
Stack dump:
0.	Program arguments: mlir-opt-23 --allow-unregistered-dialect --inline -o -
Stack dump without symbol names (ensure you have llvm-symbolizer in your PATH or set the environment var `LLVM_SYMBOLIZER_PATH` to point to it):
0  libLLVM.so.23.0 0x00007072621c11fc llvm::sys::PrintStackTrace(llvm::raw_ostream&, int) + 60
1  libLLVM.so.23.0 0x00007072621beb63 llvm::sys::RunSignalHandlers() + 131
2  libLLVM.so.23.0 0x00007072621c1fd4
3  libc.so.6       0x000070725c842520
4  libMLIR.so.23.0 0x000070726d1847cd
5  libMLIR.so.23.0 0x000070726d1844c3
6  libMLIR.so.23.0 0x000070726d1839a0 mlir::Inliner::doInlining() + 832
7  libMLIR.so.23.0 0x000070726d19e265
8  libMLIR.so.23.0 0x000070726ceab6a3 mlir::detail::OpToOpPassAdaptor::run(mlir::Pass*, mlir::Operation*, mlir::AnalysisManager, bool, unsigned int) + 979
9  libMLIR.so.23.0 0x000070726ceabcc7 mlir::detail::OpToOpPassAdaptor::runPipeline(mlir::OpPassManager&, mlir::Operation*, mlir::AnalysisManager, bool, unsigned int, mlir::PassInstrumentor*, mlir::PassInstrumentation::PipelineParentI
```

## Hard failure

- Seed: `seeds/generic_fuzz_mlir23/generic_graph_region_0017.mlir`
- Pipeline: `inline_allow_unregistered`
- Family: `custom_graph_region`

```text
PLEASE submit a bug report to https://github.com/llvm/llvm-project/issues/ and include the crash backtrace and instructions to reproduce the bug.
Stack dump:
0.	Program arguments: mlir-opt-23 --allow-unregistered-dialect --inline -o -
Stack dump without symbol names (ensure you have llvm-symbolizer in your PATH or set the environment var `LLVM_SYMBOLIZER_PATH` to point to it):
0  libLLVM.so.23.0 0x00007af4517c11fc llvm::sys::PrintStackTrace(llvm::raw_ostream&, int) + 60
1  libLLVM.so.23.0 0x00007af4517beb63 llvm::sys::RunSignalHandlers() + 131
2  libLLVM.so.23.0 0x00007af4517c1fd4
3  libc.so.6       0x00007af44be42520
4  libMLIR.so.23.0 0x00007af45c7847cd
5  libMLIR.so.23.0 0x00007af45c7845dd
6  libMLIR.so.23.0 0x00007af45c783826 mlir::Inliner::doInlining() + 454
7  libMLIR.so.23.0 0x00007af45c79e265
8  libMLIR.so.23.0 0x00007af45c4ab6a3 mlir::detail::OpToOpPassAdaptor::run(mlir::Pass*, mlir::Operation*, mlir::AnalysisManager, bool, unsigned int) + 979
9  libMLIR.so.23.0 0x00007af45c4abcc7 mlir::detail::OpToOpPassAdaptor::runPipeline(mlir::OpPassManager&, mlir::Operation*, mlir::AnalysisManager, bool, unsigned int, mlir::PassInstrumentor*, mlir::PassInstrumentation::PipelineParentI
```

## Hard failure

- Seed: `seeds/generic_fuzz_mlir23/generic_custom_region_0020.mlir`
- Pipeline: `inline_allow_unregistered`
- Family: `custom_region`

```text
PLEASE submit a bug report to https://github.com/llvm/llvm-project/issues/ and include the crash backtrace and instructions to reproduce the bug.
Stack dump:
0.	Program arguments: mlir-opt-23 --allow-unregistered-dialect --inline -o -
Stack dump without symbol names (ensure you have llvm-symbolizer in your PATH or set the environment var `LLVM_SYMBOLIZER_PATH` to point to it):
0  libLLVM.so.23.0 0x000077b9431c11fc llvm::sys::PrintStackTrace(llvm::raw_ostream&, int) + 60
1  libLLVM.so.23.0 0x000077b9431beb63 llvm::sys::RunSignalHandlers() + 131
2  libLLVM.so.23.0 0x000077b9431c1fd4
3  libc.so.6       0x000077b93d842520
4  libMLIR.so.23.0 0x000077b94e1847cd
5  libMLIR.so.23.0 0x000077b94e1844c3
6  libMLIR.so.23.0 0x000077b94e1839a0 mlir::Inliner::doInlining() + 832
7  libMLIR.so.23.0 0x000077b94e19e265
8  libMLIR.so.23.0 0x000077b94deab6a3 mlir::detail::OpToOpPassAdaptor::run(mlir::Pass*, mlir::Operation*, mlir::AnalysisManager, bool, unsigned int) + 979
9  libMLIR.so.23.0 0x000077b94deabcc7 mlir::detail::OpToOpPassAdaptor::runPipeline(mlir::OpPassManager&, mlir::Operation*, mlir::AnalysisManager, bool, unsigned int, mlir::PassInstrumentor*, mlir::PassInstrumentation::PipelineParentI
```

## Hard failure

- Seed: `seeds/generic_fuzz_mlir23/generic_graph_region_0021.mlir`
- Pipeline: `inline_allow_unregistered`
- Family: `custom_graph_region`

```text
PLEASE submit a bug report to https://github.com/llvm/llvm-project/issues/ and include the crash backtrace and instructions to reproduce the bug.
Stack dump:
0.	Program arguments: mlir-opt-23 --allow-unregistered-dialect --inline -o -
Stack dump without symbol names (ensure you have llvm-symbolizer in your PATH or set the environment var `LLVM_SYMBOLIZER_PATH` to point to it):
0  libLLVM.so.23.0 0x000076312c1c11fc llvm::sys::PrintStackTrace(llvm::raw_ostream&, int) + 60
1  libLLVM.so.23.0 0x000076312c1beb63 llvm::sys::RunSignalHandlers() + 131
2  libLLVM.so.23.0 0x000076312c1c1fd4
3  libc.so.6       0x0000763126842520
4  libMLIR.so.23.0 0x0000763136da6ccb mlir::SymbolRefAttr::getRootReference() const + 3
5  libMLIR.so.23.0 0x0000763136e56447
6  libMLIR.so.23.0 0x0000763136e58d84 mlir::SymbolTableCollection::lookupSymbolIn(mlir::Operation*, mlir::SymbolRefAttr, llvm::SmallVectorImpl<mlir::Operation*>&) + 52
7  libMLIR.so.23.0 0x0000763136e58d06 mlir::SymbolTableCollection::lookupSymbolIn(mlir::Operation*, mlir::SymbolRefAttr) + 54
8  libMLIR.so.23.0 0x0000763137184800
9  libMLIR.so.23.0 0x00007631371845dd
10 libMLIR.so.23.0 0x0000763137183826 mlir::Inliner::doInlining() + 454
11 lib
```

## Hard failure

- Seed: `seeds/generic_fuzz_mlir23/generic_custom_region_0024.mlir`
- Pipeline: `inline_allow_unregistered`
- Family: `custom_region`

```text
PLEASE submit a bug report to https://github.com/llvm/llvm-project/issues/ and include the crash backtrace and instructions to reproduce the bug.
Stack dump:
0.	Program arguments: mlir-opt-23 --allow-unregistered-dialect --inline -o -
Stack dump without symbol names (ensure you have llvm-symbolizer in your PATH or set the environment var `LLVM_SYMBOLIZER_PATH` to point to it):
0  libLLVM.so.23.0 0x00007fecc4fc11fc llvm::sys::PrintStackTrace(llvm::raw_ostream&, int) + 60
1  libLLVM.so.23.0 0x00007fecc4fbeb63 llvm::sys::RunSignalHandlers() + 131
2  libLLVM.so.23.0 0x00007fecc4fc1fd4
3  libc.so.6       0x00007fecbf642520
4  libMLIR.so.23.0 0x00007feccff847cd
5  libMLIR.so.23.0 0x00007feccff844c3
6  libMLIR.so.23.0 0x00007feccff839a0 mlir::Inliner::doInlining() + 832
7  libMLIR.so.23.0 0x00007feccff9e265
8  libMLIR.so.23.0 0x00007feccfcab6a3 mlir::detail::OpToOpPassAdaptor::run(mlir::Pass*, mlir::Operation*, mlir::AnalysisManager, bool, unsigned int) + 979
9  libMLIR.so.23.0 0x00007feccfcabcc7 mlir::detail::OpToOpPassAdaptor::runPipeline(mlir::OpPassManager&, mlir::Operation*, mlir::AnalysisManager, bool, unsigned int, mlir::PassInstrumentor*, mlir::PassInstrumentation::PipelineParentI
```

## Hard failure

- Seed: `seeds/generic_fuzz_mlir23/generic_graph_region_0025.mlir`
- Pipeline: `inline_allow_unregistered`
- Family: `custom_graph_region`

```text
PLEASE submit a bug report to https://github.com/llvm/llvm-project/issues/ and include the crash backtrace and instructions to reproduce the bug.
Stack dump:
0.	Program arguments: mlir-opt-23 --allow-unregistered-dialect --inline -o -
Stack dump without symbol names (ensure you have llvm-symbolizer in your PATH or set the environment var `LLVM_SYMBOLIZER_PATH` to point to it):
0  libLLVM.so.23.0 0x00007990331c11fc llvm::sys::PrintStackTrace(llvm::raw_ostream&, int) + 60
1  libLLVM.so.23.0 0x00007990331beb63 llvm::sys::RunSignalHandlers() + 131
2  libLLVM.so.23.0 0x00007990331c1fd4
3  libc.so.6       0x000079902d842520
4  libMLIR.so.23.0 0x000079903dda6ccb mlir::SymbolRefAttr::getRootReference() const + 3
5  libMLIR.so.23.0 0x000079903de56447
6  libMLIR.so.23.0 0x000079903de58d84 mlir::SymbolTableCollection::lookupSymbolIn(mlir::Operation*, mlir::SymbolRefAttr, llvm::SmallVectorImpl<mlir::Operation*>&) + 52
7  libMLIR.so.23.0 0x000079903de58d06 mlir::SymbolTableCollection::lookupSymbolIn(mlir::Operation*, mlir::SymbolRefAttr) + 54
8  libMLIR.so.23.0 0x000079903e184800
9  libMLIR.so.23.0 0x000079903e1845dd
10 libMLIR.so.23.0 0x000079903e183826 mlir::Inliner::doInlining() + 454
11 lib
```

## Hard failure

- Seed: `seeds/generic_fuzz_mlir23/generic_custom_region_0028.mlir`
- Pipeline: `inline_allow_unregistered`
- Family: `custom_region`

```text
PLEASE submit a bug report to https://github.com/llvm/llvm-project/issues/ and include the crash backtrace and instructions to reproduce the bug.
Stack dump:
0.	Program arguments: mlir-opt-23 --allow-unregistered-dialect --inline -o -
Stack dump without symbol names (ensure you have llvm-symbolizer in your PATH or set the environment var `LLVM_SYMBOLIZER_PATH` to point to it):
0  libLLVM.so.23.0 0x00007367b31c11fc llvm::sys::PrintStackTrace(llvm::raw_ostream&, int) + 60
1  libLLVM.so.23.0 0x00007367b31beb63 llvm::sys::RunSignalHandlers() + 131
2  libLLVM.so.23.0 0x00007367b31c1fd4
3  libc.so.6       0x00007367ad842520
4  libMLIR.so.23.0 0x00007367be1847cd
5  libMLIR.so.23.0 0x00007367be1844c3
6  libMLIR.so.23.0 0x00007367be1839a0 mlir::Inliner::doInlining() + 832
7  libMLIR.so.23.0 0x00007367be19e265
8  libMLIR.so.23.0 0x00007367bdeab6a3 mlir::detail::OpToOpPassAdaptor::run(mlir::Pass*, mlir::Operation*, mlir::AnalysisManager, bool, unsigned int) + 979
9  libMLIR.so.23.0 0x00007367bdeabcc7 mlir::detail::OpToOpPassAdaptor::runPipeline(mlir::OpPassManager&, mlir::Operation*, mlir::AnalysisManager, bool, unsigned int, mlir::PassInstrumentor*, mlir::PassInstrumentation::PipelineParentI
```

## Hard failure

- Seed: `seeds/generic_fuzz_mlir23/generic_graph_region_0029.mlir`
- Pipeline: `inline_allow_unregistered`
- Family: `custom_graph_region`

```text
PLEASE submit a bug report to https://github.com/llvm/llvm-project/issues/ and include the crash backtrace and instructions to reproduce the bug.
Stack dump:
0.	Program arguments: mlir-opt-23 --allow-unregistered-dialect --inline -o -
Stack dump without symbol names (ensure you have llvm-symbolizer in your PATH or set the environment var `LLVM_SYMBOLIZER_PATH` to point to it):
0  libLLVM.so.23.0 0x0000795206fc11fc llvm::sys::PrintStackTrace(llvm::raw_ostream&, int) + 60
1  libLLVM.so.23.0 0x0000795206fbeb63 llvm::sys::RunSignalHandlers() + 131
2  libLLVM.so.23.0 0x0000795206fc1fd4
3  libc.so.6       0x0000795201642520
4  libMLIR.so.23.0 0x0000795211f847cd
5  libMLIR.so.23.0 0x0000795211f845dd
6  libMLIR.so.23.0 0x0000795211f83826 mlir::Inliner::doInlining() + 454
7  libMLIR.so.23.0 0x0000795211f9e265
8  libMLIR.so.23.0 0x0000795211cab6a3 mlir::detail::OpToOpPassAdaptor::run(mlir::Pass*, mlir::Operation*, mlir::AnalysisManager, bool, unsigned int) + 979
9  libMLIR.so.23.0 0x0000795211cabcc7 mlir::detail::OpToOpPassAdaptor::runPipeline(mlir::OpPassManager&, mlir::Operation*, mlir::AnalysisManager, bool, unsigned int, mlir::PassInstrumentor*, mlir::PassInstrumentation::PipelineParentI
```

## Hard failure

- Seed: `seeds/generic_fuzz_mlir23/generic_custom_region_0032.mlir`
- Pipeline: `inline_allow_unregistered`
- Family: `custom_region`

```text
PLEASE submit a bug report to https://github.com/llvm/llvm-project/issues/ and include the crash backtrace and instructions to reproduce the bug.
Stack dump:
0.	Program arguments: mlir-opt-23 --allow-unregistered-dialect --inline -o -
Stack dump without symbol names (ensure you have llvm-symbolizer in your PATH or set the environment var `LLVM_SYMBOLIZER_PATH` to point to it):
0  libLLVM.so.23.0 0x00007b4c571c11fc llvm::sys::PrintStackTrace(llvm::raw_ostream&, int) + 60
1  libLLVM.so.23.0 0x00007b4c571beb63 llvm::sys::RunSignalHandlers() + 131
2  libLLVM.so.23.0 0x00007b4c571c1fd4
3  libc.so.6       0x00007b4c51842520
4  libMLIR.so.23.0 0x00007b4c621847cd
5  libMLIR.so.23.0 0x00007b4c621844c3
6  libMLIR.so.23.0 0x00007b4c621839a0 mlir::Inliner::doInlining() + 832
7  libMLIR.so.23.0 0x00007b4c6219e265
8  libMLIR.so.23.0 0x00007b4c61eab6a3 mlir::detail::OpToOpPassAdaptor::run(mlir::Pass*, mlir::Operation*, mlir::AnalysisManager, bool, unsigned int) + 979
9  libMLIR.so.23.0 0x00007b4c61eabcc7 mlir::detail::OpToOpPassAdaptor::runPipeline(mlir::OpPassManager&, mlir::Operation*, mlir::AnalysisManager, bool, unsigned int, mlir::PassInstrumentor*, mlir::PassInstrumentation::PipelineParentI
```

## Hard failure

- Seed: `seeds/generic_fuzz_mlir23/generic_graph_region_0033.mlir`
- Pipeline: `inline_allow_unregistered`
- Family: `custom_graph_region`

```text
PLEASE submit a bug report to https://github.com/llvm/llvm-project/issues/ and include the crash backtrace and instructions to reproduce the bug.
Stack dump:
0.	Program arguments: mlir-opt-23 --allow-unregistered-dialect --inline -o -
Stack dump without symbol names (ensure you have llvm-symbolizer in your PATH or set the environment var `LLVM_SYMBOLIZER_PATH` to point to it):
0  libLLVM.so.23.0 0x000077028bbc11fc llvm::sys::PrintStackTrace(llvm::raw_ostream&, int) + 60
1  libLLVM.so.23.0 0x000077028bbbeb63 llvm::sys::RunSignalHandlers() + 131
2  libLLVM.so.23.0 0x000077028bbc1fd4
3  libc.so.6       0x0000770286242520
4  libMLIR.so.23.0 0x0000770296b847cd
5  libMLIR.so.23.0 0x0000770296b845dd
6  libMLIR.so.23.0 0x0000770296b83826 mlir::Inliner::doInlining() + 454
7  libMLIR.so.23.0 0x0000770296b9e265
8  libMLIR.so.23.0 0x00007702968ab6a3 mlir::detail::OpToOpPassAdaptor::run(mlir::Pass*, mlir::Operation*, mlir::AnalysisManager, bool, unsigned int) + 979
9  libMLIR.so.23.0 0x00007702968abcc7 mlir::detail::OpToOpPassAdaptor::runPipeline(mlir::OpPassManager&, mlir::Operation*, mlir::AnalysisManager, bool, unsigned int, mlir::PassInstrumentor*, mlir::PassInstrumentation::PipelineParentI
```

## Hard failure

- Seed: `seeds/generic_fuzz_mlir23/generic_custom_region_0036.mlir`
- Pipeline: `inline_allow_unregistered`
- Family: `custom_region`

```text
PLEASE submit a bug report to https://github.com/llvm/llvm-project/issues/ and include the crash backtrace and instructions to reproduce the bug.
Stack dump:
0.	Program arguments: mlir-opt-23 --allow-unregistered-dialect --inline -o -
Stack dump without symbol names (ensure you have llvm-symbolizer in your PATH or set the environment var `LLVM_SYMBOLIZER_PATH` to point to it):
0  libLLVM.so.23.0 0x00007f73163c11fc llvm::sys::PrintStackTrace(llvm::raw_ostream&, int) + 60
1  libLLVM.so.23.0 0x00007f73163beb63 llvm::sys::RunSignalHandlers() + 131
2  libLLVM.so.23.0 0x00007f73163c1fd4
3  libc.so.6       0x00007f7310a42520
4  libMLIR.so.23.0 0x00007f73213847cd
5  libMLIR.so.23.0 0x00007f73213844c3
6  libMLIR.so.23.0 0x00007f73213839a0 mlir::Inliner::doInlining() + 832
7  libMLIR.so.23.0 0x00007f732139e265
8  libMLIR.so.23.0 0x00007f73210ab6a3 mlir::detail::OpToOpPassAdaptor::run(mlir::Pass*, mlir::Operation*, mlir::AnalysisManager, bool, unsigned int) + 979
9  libMLIR.so.23.0 0x00007f73210abcc7 mlir::detail::OpToOpPassAdaptor::runPipeline(mlir::OpPassManager&, mlir::Operation*, mlir::AnalysisManager, bool, unsigned int, mlir::PassInstrumentor*, mlir::PassInstrumentation::PipelineParentI
```

## Hard failure

- Seed: `seeds/generic_fuzz_mlir23/generic_graph_region_0037.mlir`
- Pipeline: `inline_allow_unregistered`
- Family: `custom_graph_region`

```text
PLEASE submit a bug report to https://github.com/llvm/llvm-project/issues/ and include the crash backtrace and instructions to reproduce the bug.
Stack dump:
0.	Program arguments: mlir-opt-23 --allow-unregistered-dialect --inline -o -
Stack dump without symbol names (ensure you have llvm-symbolizer in your PATH or set the environment var `LLVM_SYMBOLIZER_PATH` to point to it):
0  libLLVM.so.23.0 0x0000716de99c11fc llvm::sys::PrintStackTrace(llvm::raw_ostream&, int) + 60
1  libLLVM.so.23.0 0x0000716de99beb63 llvm::sys::RunSignalHandlers() + 131
2  libLLVM.so.23.0 0x0000716de99c1fd4
3  libc.so.6       0x0000716de4042520
4  libMLIR.so.23.0 0x0000716df49847cd
5  libMLIR.so.23.0 0x0000716df49845dd
6  libMLIR.so.23.0 0x0000716df4983826 mlir::Inliner::doInlining() + 454
7  libMLIR.so.23.0 0x0000716df499e265
8  libMLIR.so.23.0 0x0000716df46ab6a3 mlir::detail::OpToOpPassAdaptor::run(mlir::Pass*, mlir::Operation*, mlir::AnalysisManager, bool, unsigned int) + 979
9  libMLIR.so.23.0 0x0000716df46abcc7 mlir::detail::OpToOpPassAdaptor::runPipeline(mlir::OpPassManager&, mlir::Operation*, mlir::AnalysisManager, bool, unsigned int, mlir::PassInstrumentor*, mlir::PassInstrumentation::PipelineParentI
```
