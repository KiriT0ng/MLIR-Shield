# ORIG-CAND-001 GitHub 评论草稿

下面内容用于记录 ORIG-CAND-001 的上游沟通要点。若后续需要直接发到 LLVM GitHub issue，可再按目标讨论区语言翻译为英文。

## 复现结论

我可以在较新的 MLIR 23 development package 上复现相关问题，并发现了一个相近变体：父级 `func.func` 本身正常以 `return` 结束，但内部未注册 operation 的 region 中仍可触发异常。

## 环境

- 工具链：`mlir-opt-23`
- 包版本：`1:23~++20260530031447+f7d576010fc1-1~exp1~20260530151611.3159`
- 命令：

```bash
mlir-opt-23 --allow-unregistered-dialect --inline -o - repro.mlir
```

## 变体输入

```mlir
module {
  func.func @f() {
    "a.b"() ({
      "a.t"() : () -> ()
    }) : () -> ()
    return
  }
}
```

## 观察结果

该变体与已知问题高度相关，但触发边界略有不同：外层函数合法终止，异常集中在带 region 的未注册 operation 与 inline / region 处理路径之间。项目将其定位为“原创候选 / 已知问题影响范围扩展”，适合在上游讨论中说明其与已有 issue 的关系，而不直接宣称为完全独立漏洞。

## 建议表达

- 先说明这是相关变体，不直接断言为全新根因。
- 给出工具链版本、命令和最小输入。
- 强调父级 `func.func` 正常 `return`，以便维护者快速判断边界差异。
- 如维护者确认同根因，可作为已有 issue 的补充复现；如确认根因不同，再单独提交 issue。
