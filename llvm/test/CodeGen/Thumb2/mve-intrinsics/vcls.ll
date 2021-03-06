; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=thumbv8.1m.main -mattr=+mve.fp -verify-machineinstrs -o - %s | FileCheck %s

define arm_aapcs_vfpcc <16 x i8> @test_vclsq_s8(<16 x i8> %a) {
; CHECK-LABEL: test_vclsq_s8:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vcls.s8 q0, q0
; CHECK-NEXT:    bx lr
entry:
  %0 = tail call <16 x i8> @llvm.arm.mve.vcls.v16i8(<16 x i8> %a)
  ret <16 x i8> %0
}

define arm_aapcs_vfpcc <8 x i16> @test_vclsq_s16(<8 x i16> %a) {
; CHECK-LABEL: test_vclsq_s16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vcls.s16 q0, q0
; CHECK-NEXT:    bx lr
entry:
  %0 = tail call <8 x i16> @llvm.arm.mve.vcls.v8i16(<8 x i16> %a)
  ret <8 x i16> %0
}

define arm_aapcs_vfpcc <4 x i32> @test_vclsq_s32(<4 x i32> %a) {
; CHECK-LABEL: test_vclsq_s32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vcls.s32 q0, q0
; CHECK-NEXT:    bx lr
entry:
  %0 = tail call <4 x i32> @llvm.arm.mve.vcls.v4i32(<4 x i32> %a)
  ret <4 x i32> %0
}

declare <16 x i8> @llvm.arm.mve.vcls.v16i8(<16 x i8>)
declare <8 x i16> @llvm.arm.mve.vcls.v8i16(<8 x i16>)
declare <4 x i32> @llvm.arm.mve.vcls.v4i32(<4 x i32>)
