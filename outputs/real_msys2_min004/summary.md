# MSYS2/MinGW64 MIN-004 真实运行验证

- Tool: `%MLIRSHIELD_MLIR_OPT%`
- Version: `LLVM 22.1.8`
- Seed: `outputs\minimized\mlir22_memref_canonicalize_current.chunk.min.mlir`
- Args: `--canonicalize --cse --sccp --canonicalize -o -`
- Return code: `-1073741819`
- Classification: `memory/assertion`
- Exception: `0xC0000005`
- Elapsed: `146.8 ms`

## stderr 摘要

``text
PLEASE submit a bug report to https://github.com/llvm/llvm-project/issues/ and include the crash backtrace and instructions to reproduce the bug.
Stack dump:
0.	Program arguments: E:\\KiriTong\\msys64\\mingw64\\bin\\mlir-opt.exe outputs\\minimized\\mlir22_memref_canonicalize_current.chunk.min.mlir --canonicalize --cse --sccp --canonicalize -o -
Exception Code: 0xC0000005
0x00007FF7B61E2BFA, %MLIRSHIELD_MLIR_OPT%(0x00007FF7B4F70000) + 0x1272BFA byte(s)
0x00007FF7B8585FE8, %MLIRSHIELD_MLIR_OPT%(0x00007FF7B4F70000) + 0x3615FE8 byte(s)
0x00007FF7B85861E2, %MLIRSHIELD_MLIR_OPT%(0x00007FF7B4F70000) + 0x36161E2 byte(s)
0x00007FF7B8F0F6D7, %MLIRSHIELD_MLIR_OPT%(0x00007FF7B4F70000) + 0x3F9F6D7 byte(s)
0x00007FF7B8F0D32F, %MLIRSHIELD_MLIR_OPT%(0x00007FF7B4F70000) + 0x3F9D32F byte(s)
0x00007FF7B786BD42, %MLIRSHIELD_MLIR_OPT%(0x00007FF7B4F70000) + 0x28FBD42 byte(s)
0x00007FF7B504C434, %MLIRSHIELD_MLIR_OPT%(0x00007FF7B4F70000) + 0xDC434 byte(s)
0x00007FF7B50501B9, %MLIRSHIELD_MLIR_OPT%(0x00007FF7B4F70000) + 0xE01B9 byte(s)
``
