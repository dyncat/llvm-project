; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=x86_64-- -mattr=-avx | FileCheck %s

define i64 @test1(double %A) {
; CHECK-LABEL: test1:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movq %xmm0, %rax
; CHECK-NEXT:    retq
   %B = bitcast double %A to i64
   ret i64 %B
}

define double @test2(i64 %A) {
; CHECK-LABEL: test2:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movq %rdi, %xmm0
; CHECK-NEXT:    retq
   %B = bitcast i64 %A to double
   ret double %B
}

