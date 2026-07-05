# 原创性证明材料

## 结论

本项目当前有三类可展示成果，需要分层表达：

| 类型 | 代表案例 | 原创性结论 | 建议表述 |
| --- | --- | --- | --- |
| A. 当前版本公开问题复核 | LLVM #197158 | 公开 issue，项目复现和工程化验证 | “真实问题复核与检测链路验证” |
| B. 历史/版本差分重点 | MIN-004 | 与公开旧 bug 可能同源，MLIR 22 上有强证据 | “MLIR 22 hard failure 重点案例” |
| C. 原创候选 / 影响范围扩展 | ORIG-CAND-001 | 本项目 fuzz 得到，和 #197960 高度相关但触发边界不同 | “原创候选，已知问题影响范围扩展” |

## 已检查的公开参照

截至 2026-06-01 复核：

- LLVM #197960：Open。标题和正文显示其触发形态是 `func.func` 无 return terminator，并包含带 region 的未注册 op，命令为 `mlir-opt --allow-unregistered-dialect --inline`。
- LLVM #197158：Open。MLIR mem2reg 在 dbg.declare 场景下出现 deleted SSA value use，本项目已作为 MLIR 23 当前公开问题复核。
- LLVM #159675：Open。dialect conversion 在 circular SSA dependencies 下 stack overflow，本项目 generic fuzz 中的部分 timeout 类候选与该方向相近，因此不作为原创漏洞宣称。
- LLVM bug 111244 邮件归档：MIN-004 与其相似，故 MIN-004 不应表述为严格未公开原创漏洞。

## ORIG-CAND-001 的新增价值

ORIG-CAND-001 的核心价值不在于复现 #197960，而在于证明触发边界更宽。

公开 #197960 的关键描述：

```mlir
module {
  func.func @f() {
    "a.b"() ({}) : () -> ()
  }
}
```

本项目候选：

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

差异：

- 公开 issue：父 `func.func` 没有 terminator。
- 本项目候选：父 `func.func` 有正常 `return`。
- 两者：均在 `--allow-unregistered-dialect --inline` 下触发 inliner hard failure。

变体验证进一步显示：

- unknown nested region 是关键触发条件。
- unknown op 没有 region 时不触发。
- 注册 dialect 的正常 region/call control 不触发。
- 公开 no-return 形态和本项目 returned-parent 形态都触发。

## 答辩时的安全表述

推荐说法：

> 我们没有把所有 crash 都直接包装成原创漏洞，而是按公开 issue、版本差分问题、原创候选三类管理。ORIG-CAND-001 是我们通过 MLIR 23 fuzzing 得到的变体族，它和公开 #197960 共享 inliner assertion，但我们的变体验证发现该问题不依赖父函数缺少 return terminator，正常返回的函数中只要出现特定 unknown nested region 也会触发。这体现了系统发现新问题边界和做根因归纳的能力。

不推荐说法：

> 我们已经确认发现了一个全新的 MLIR 23 0-day。

原因：目前还没有上游维护者确认 ORIG-CAND-001 与 #197960 根因不同。

## 后续确认路径

1. 在 #197960 下补充 ORIG-CAND-001 returned-parent 变体，询问维护者是否同根因。
2. 如果 #197960 修复后 ORIG-CAND-001 仍触发，则升级为更强原创候选。
3. 如果维护者认为同根因，则在作品中定位为“公开问题影响范围扩展 + 自动化发现证据”。
4. 如果维护者认为不同根因，则单独整理为 upstream issue。
