; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mcpu=nehalem < %s | FileCheck %s

target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128"
target triple = "x86_64-apple-darwin8"

define i32 @foo() nounwind uwtable "xray-instruction-threshold"="3" {
; CHECK-LABEL: foo:
; CHECK:       ## %bb.0: ## %entry
; CHECK-NEXT:    xorl %eax, %eax
; CHECK-NEXT:    retq
entry:
  ret i32 0
}
