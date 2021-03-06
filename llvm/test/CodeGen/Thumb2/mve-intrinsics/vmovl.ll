; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=thumbv8.1m.main -mattr=+mve -verify-machineinstrs -o - %s | FileCheck --check-prefix=LE %s
; RUN: llc -mtriple=thumbebv8.1m.main -mattr=+mve -verify-machineinstrs -o - %s | FileCheck --check-prefix=BE %s

define arm_aapcs_vfpcc <8 x i16> @test_vmovlbq_s8(<16 x i8> %a) {
; LE-LABEL: test_vmovlbq_s8:
; LE:       @ %bb.0: @ %entry
; LE-NEXT:    vmovlb.s8 q0, q0
; LE-NEXT:    bx lr
;
; BE-LABEL: test_vmovlbq_s8:
; BE:       @ %bb.0: @ %entry
; BE-NEXT:    vrev64.8 q1, q0
; BE-NEXT:    vmovlb.s8 q1, q1
; BE-NEXT:    vrev64.16 q0, q1
; BE-NEXT:    bx lr
entry:
  %0 = shufflevector <16 x i8> %a, <16 x i8> undef, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 8, i32 10, i32 12, i32 14>
  %1 = sext <8 x i8> %0 to <8 x i16>
  ret <8 x i16> %1
}

define arm_aapcs_vfpcc <4 x i32> @test_vmovlbq_s16(<8 x i16> %a) {
; LE-LABEL: test_vmovlbq_s16:
; LE:       @ %bb.0: @ %entry
; LE-NEXT:    vmovlb.s16 q0, q0
; LE-NEXT:    bx lr
;
; BE-LABEL: test_vmovlbq_s16:
; BE:       @ %bb.0: @ %entry
; BE-NEXT:    vrev64.16 q1, q0
; BE-NEXT:    vmovlb.s16 q1, q1
; BE-NEXT:    vrev64.32 q0, q1
; BE-NEXT:    bx lr
entry:
  %0 = shufflevector <8 x i16> %a, <8 x i16> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %1 = sext <4 x i16> %0 to <4 x i32>
  ret <4 x i32> %1
}

define arm_aapcs_vfpcc <8 x i16> @test_vmovlbq_u8(<16 x i8> %a) {
; LE-LABEL: test_vmovlbq_u8:
; LE:       @ %bb.0: @ %entry
; LE-NEXT:    vmovlb.u8 q0, q0
; LE-NEXT:    bx lr
;
; BE-LABEL: test_vmovlbq_u8:
; BE:       @ %bb.0: @ %entry
; BE-NEXT:    vrev64.8 q1, q0
; BE-NEXT:    vmovlb.u8 q1, q1
; BE-NEXT:    vrev64.16 q0, q1
; BE-NEXT:    bx lr
entry:
  %0 = shufflevector <16 x i8> %a, <16 x i8> undef, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 8, i32 10, i32 12, i32 14>
  %1 = zext <8 x i8> %0 to <8 x i16>
  ret <8 x i16> %1
}

define arm_aapcs_vfpcc <4 x i32> @test_vmovlbq_u16(<8 x i16> %a) {
; LE-LABEL: test_vmovlbq_u16:
; LE:       @ %bb.0: @ %entry
; LE-NEXT:    vmovlb.u16 q0, q0
; LE-NEXT:    bx lr
;
; BE-LABEL: test_vmovlbq_u16:
; BE:       @ %bb.0: @ %entry
; BE-NEXT:    vrev64.16 q1, q0
; BE-NEXT:    vmovlb.u16 q1, q1
; BE-NEXT:    vrev64.32 q0, q1
; BE-NEXT:    bx lr
entry:
  %0 = shufflevector <8 x i16> %a, <8 x i16> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %1 = zext <4 x i16> %0 to <4 x i32>
  ret <4 x i32> %1
}

define arm_aapcs_vfpcc <8 x i16> @test_vmovltq_s8(<16 x i8> %a) {
; LE-LABEL: test_vmovltq_s8:
; LE:       @ %bb.0: @ %entry
; LE-NEXT:    vmovlt.s8 q0, q0
; LE-NEXT:    bx lr
;
; BE-LABEL: test_vmovltq_s8:
; BE:       @ %bb.0: @ %entry
; BE-NEXT:    vrev64.8 q1, q0
; BE-NEXT:    vmovlt.s8 q1, q1
; BE-NEXT:    vrev64.16 q0, q1
; BE-NEXT:    bx lr
entry:
  %0 = shufflevector <16 x i8> %a, <16 x i8> undef, <8 x i32> <i32 1, i32 3, i32 5, i32 7, i32 9, i32 11, i32 13, i32 15>
  %1 = sext <8 x i8> %0 to <8 x i16>
  ret <8 x i16> %1
}

define arm_aapcs_vfpcc <4 x i32> @test_vmovltq_s16(<8 x i16> %a) {
; LE-LABEL: test_vmovltq_s16:
; LE:       @ %bb.0: @ %entry
; LE-NEXT:    vmovlt.s16 q0, q0
; LE-NEXT:    bx lr
;
; BE-LABEL: test_vmovltq_s16:
; BE:       @ %bb.0: @ %entry
; BE-NEXT:    vrev64.16 q1, q0
; BE-NEXT:    vmovlt.s16 q1, q1
; BE-NEXT:    vrev64.32 q0, q1
; BE-NEXT:    bx lr
entry:
  %0 = shufflevector <8 x i16> %a, <8 x i16> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %1 = sext <4 x i16> %0 to <4 x i32>
  ret <4 x i32> %1
}

define arm_aapcs_vfpcc <8 x i16> @test_vmovltq_u8(<16 x i8> %a) {
; LE-LABEL: test_vmovltq_u8:
; LE:       @ %bb.0: @ %entry
; LE-NEXT:    vmovlt.u8 q0, q0
; LE-NEXT:    bx lr
;
; BE-LABEL: test_vmovltq_u8:
; BE:       @ %bb.0: @ %entry
; BE-NEXT:    vrev64.8 q1, q0
; BE-NEXT:    vmovlt.u8 q1, q1
; BE-NEXT:    vrev64.16 q0, q1
; BE-NEXT:    bx lr
entry:
  %0 = shufflevector <16 x i8> %a, <16 x i8> undef, <8 x i32> <i32 1, i32 3, i32 5, i32 7, i32 9, i32 11, i32 13, i32 15>
  %1 = zext <8 x i8> %0 to <8 x i16>
  ret <8 x i16> %1
}

define arm_aapcs_vfpcc <4 x i32> @test_vmovltq_u16(<8 x i16> %a) {
; LE-LABEL: test_vmovltq_u16:
; LE:       @ %bb.0: @ %entry
; LE-NEXT:    vmovlt.u16 q0, q0
; LE-NEXT:    bx lr
;
; BE-LABEL: test_vmovltq_u16:
; BE:       @ %bb.0: @ %entry
; BE-NEXT:    vrev64.16 q1, q0
; BE-NEXT:    vmovlt.u16 q1, q1
; BE-NEXT:    vrev64.32 q0, q1
; BE-NEXT:    bx lr
entry:
  %0 = shufflevector <8 x i16> %a, <8 x i16> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %1 = zext <4 x i16> %0 to <4 x i32>
  ret <4 x i32> %1
}

define arm_aapcs_vfpcc <8 x i16> @test_vmovlbq_m_s8(<8 x i16> %inactive, <16 x i8> %a, i16 zeroext %p) {
; LE-LABEL: test_vmovlbq_m_s8:
; LE:       @ %bb.0: @ %entry
; LE-NEXT:    vmsr p0, r0
; LE-NEXT:    vpst
; LE-NEXT:    vmovlbt.s8 q0, q1
; LE-NEXT:    bx lr
;
; BE-LABEL: test_vmovlbq_m_s8:
; BE:       @ %bb.0: @ %entry
; BE-NEXT:    vrev64.16 q2, q0
; BE-NEXT:    vrev64.8 q0, q1
; BE-NEXT:    vmsr p0, r0
; BE-NEXT:    vpst
; BE-NEXT:    vmovlbt.s8 q2, q0
; BE-NEXT:    vrev64.16 q0, q2
; BE-NEXT:    bx lr
entry:
  %0 = zext i16 %p to i32
  %1 = tail call <8 x i1> @llvm.arm.mve.pred.i2v.v8i1(i32 %0)
  %2 = tail call <8 x i16> @llvm.arm.mve.vmovl.predicated.v8i16.v16i8.v8i1(<16 x i8> %a, i32 0, i32 0, <8 x i1> %1, <8 x i16> %inactive)
  ret <8 x i16> %2
}

define arm_aapcs_vfpcc <4 x i32> @test_vmovlbq_m_s16(<4 x i32> %inactive, <8 x i16> %a, i16 zeroext %p) {
; LE-LABEL: test_vmovlbq_m_s16:
; LE:       @ %bb.0: @ %entry
; LE-NEXT:    vmsr p0, r0
; LE-NEXT:    vpst
; LE-NEXT:    vmovlbt.s16 q0, q1
; LE-NEXT:    bx lr
;
; BE-LABEL: test_vmovlbq_m_s16:
; BE:       @ %bb.0: @ %entry
; BE-NEXT:    vrev64.32 q2, q0
; BE-NEXT:    vrev64.16 q0, q1
; BE-NEXT:    vmsr p0, r0
; BE-NEXT:    vpst
; BE-NEXT:    vmovlbt.s16 q2, q0
; BE-NEXT:    vrev64.32 q0, q2
; BE-NEXT:    bx lr
entry:
  %0 = zext i16 %p to i32
  %1 = tail call <4 x i1> @llvm.arm.mve.pred.i2v.v4i1(i32 %0)
  %2 = tail call <4 x i32> @llvm.arm.mve.vmovl.predicated.v4i32.v8i16.v4i1(<8 x i16> %a, i32 0, i32 0, <4 x i1> %1, <4 x i32> %inactive)
  ret <4 x i32> %2
}

define arm_aapcs_vfpcc <8 x i16> @test_vmovlbq_m_u8(<8 x i16> %inactive, <16 x i8> %a, i16 zeroext %p) {
; LE-LABEL: test_vmovlbq_m_u8:
; LE:       @ %bb.0: @ %entry
; LE-NEXT:    vmsr p0, r0
; LE-NEXT:    vpst
; LE-NEXT:    vmovlbt.u8 q0, q1
; LE-NEXT:    bx lr
;
; BE-LABEL: test_vmovlbq_m_u8:
; BE:       @ %bb.0: @ %entry
; BE-NEXT:    vrev64.16 q2, q0
; BE-NEXT:    vrev64.8 q0, q1
; BE-NEXT:    vmsr p0, r0
; BE-NEXT:    vpst
; BE-NEXT:    vmovlbt.u8 q2, q0
; BE-NEXT:    vrev64.16 q0, q2
; BE-NEXT:    bx lr
entry:
  %0 = zext i16 %p to i32
  %1 = tail call <8 x i1> @llvm.arm.mve.pred.i2v.v8i1(i32 %0)
  %2 = tail call <8 x i16> @llvm.arm.mve.vmovl.predicated.v8i16.v16i8.v8i1(<16 x i8> %a, i32 1, i32 0, <8 x i1> %1, <8 x i16> %inactive)
  ret <8 x i16> %2
}

define arm_aapcs_vfpcc <4 x i32> @test_vmovlbq_m_u16(<4 x i32> %inactive, <8 x i16> %a, i16 zeroext %p) {
; LE-LABEL: test_vmovlbq_m_u16:
; LE:       @ %bb.0: @ %entry
; LE-NEXT:    vmsr p0, r0
; LE-NEXT:    vpst
; LE-NEXT:    vmovlbt.u16 q0, q1
; LE-NEXT:    bx lr
;
; BE-LABEL: test_vmovlbq_m_u16:
; BE:       @ %bb.0: @ %entry
; BE-NEXT:    vrev64.32 q2, q0
; BE-NEXT:    vrev64.16 q0, q1
; BE-NEXT:    vmsr p0, r0
; BE-NEXT:    vpst
; BE-NEXT:    vmovlbt.u16 q2, q0
; BE-NEXT:    vrev64.32 q0, q2
; BE-NEXT:    bx lr
entry:
  %0 = zext i16 %p to i32
  %1 = tail call <4 x i1> @llvm.arm.mve.pred.i2v.v4i1(i32 %0)
  %2 = tail call <4 x i32> @llvm.arm.mve.vmovl.predicated.v4i32.v8i16.v4i1(<8 x i16> %a, i32 1, i32 0, <4 x i1> %1, <4 x i32> %inactive)
  ret <4 x i32> %2
}

define arm_aapcs_vfpcc <8 x i16> @test_vmovltq_m_s8(<8 x i16> %inactive, <16 x i8> %a, i16 zeroext %p) {
; LE-LABEL: test_vmovltq_m_s8:
; LE:       @ %bb.0: @ %entry
; LE-NEXT:    vmsr p0, r0
; LE-NEXT:    vpst
; LE-NEXT:    vmovltt.s8 q0, q1
; LE-NEXT:    bx lr
;
; BE-LABEL: test_vmovltq_m_s8:
; BE:       @ %bb.0: @ %entry
; BE-NEXT:    vrev64.16 q2, q0
; BE-NEXT:    vrev64.8 q0, q1
; BE-NEXT:    vmsr p0, r0
; BE-NEXT:    vpst
; BE-NEXT:    vmovltt.s8 q2, q0
; BE-NEXT:    vrev64.16 q0, q2
; BE-NEXT:    bx lr
entry:
  %0 = zext i16 %p to i32
  %1 = tail call <8 x i1> @llvm.arm.mve.pred.i2v.v8i1(i32 %0)
  %2 = tail call <8 x i16> @llvm.arm.mve.vmovl.predicated.v8i16.v16i8.v8i1(<16 x i8> %a, i32 0, i32 1, <8 x i1> %1, <8 x i16> %inactive)
  ret <8 x i16> %2
}

define arm_aapcs_vfpcc <4 x i32> @test_vmovltq_m_s16(<4 x i32> %inactive, <8 x i16> %a, i16 zeroext %p) {
; LE-LABEL: test_vmovltq_m_s16:
; LE:       @ %bb.0: @ %entry
; LE-NEXT:    vmsr p0, r0
; LE-NEXT:    vpst
; LE-NEXT:    vmovltt.s16 q0, q1
; LE-NEXT:    bx lr
;
; BE-LABEL: test_vmovltq_m_s16:
; BE:       @ %bb.0: @ %entry
; BE-NEXT:    vrev64.32 q2, q0
; BE-NEXT:    vrev64.16 q0, q1
; BE-NEXT:    vmsr p0, r0
; BE-NEXT:    vpst
; BE-NEXT:    vmovltt.s16 q2, q0
; BE-NEXT:    vrev64.32 q0, q2
; BE-NEXT:    bx lr
entry:
  %0 = zext i16 %p to i32
  %1 = tail call <4 x i1> @llvm.arm.mve.pred.i2v.v4i1(i32 %0)
  %2 = tail call <4 x i32> @llvm.arm.mve.vmovl.predicated.v4i32.v8i16.v4i1(<8 x i16> %a, i32 0, i32 1, <4 x i1> %1, <4 x i32> %inactive)
  ret <4 x i32> %2
}

define arm_aapcs_vfpcc <8 x i16> @test_vmovltq_m_u8(<8 x i16> %inactive, <16 x i8> %a, i16 zeroext %p) {
; LE-LABEL: test_vmovltq_m_u8:
; LE:       @ %bb.0: @ %entry
; LE-NEXT:    vmsr p0, r0
; LE-NEXT:    vpst
; LE-NEXT:    vmovltt.u8 q0, q1
; LE-NEXT:    bx lr
;
; BE-LABEL: test_vmovltq_m_u8:
; BE:       @ %bb.0: @ %entry
; BE-NEXT:    vrev64.16 q2, q0
; BE-NEXT:    vrev64.8 q0, q1
; BE-NEXT:    vmsr p0, r0
; BE-NEXT:    vpst
; BE-NEXT:    vmovltt.u8 q2, q0
; BE-NEXT:    vrev64.16 q0, q2
; BE-NEXT:    bx lr
entry:
  %0 = zext i16 %p to i32
  %1 = tail call <8 x i1> @llvm.arm.mve.pred.i2v.v8i1(i32 %0)
  %2 = tail call <8 x i16> @llvm.arm.mve.vmovl.predicated.v8i16.v16i8.v8i1(<16 x i8> %a, i32 1, i32 1, <8 x i1> %1, <8 x i16> %inactive)
  ret <8 x i16> %2
}

define arm_aapcs_vfpcc <4 x i32> @test_vmovltq_m_u16(<4 x i32> %inactive, <8 x i16> %a, i16 zeroext %p) {
; LE-LABEL: test_vmovltq_m_u16:
; LE:       @ %bb.0: @ %entry
; LE-NEXT:    vmsr p0, r0
; LE-NEXT:    vpst
; LE-NEXT:    vmovltt.u16 q0, q1
; LE-NEXT:    bx lr
;
; BE-LABEL: test_vmovltq_m_u16:
; BE:       @ %bb.0: @ %entry
; BE-NEXT:    vrev64.32 q2, q0
; BE-NEXT:    vrev64.16 q0, q1
; BE-NEXT:    vmsr p0, r0
; BE-NEXT:    vpst
; BE-NEXT:    vmovltt.u16 q2, q0
; BE-NEXT:    vrev64.32 q0, q2
; BE-NEXT:    bx lr
entry:
  %0 = zext i16 %p to i32
  %1 = tail call <4 x i1> @llvm.arm.mve.pred.i2v.v4i1(i32 %0)
  %2 = tail call <4 x i32> @llvm.arm.mve.vmovl.predicated.v4i32.v8i16.v4i1(<8 x i16> %a, i32 1, i32 1, <4 x i1> %1, <4 x i32> %inactive)
  ret <4 x i32> %2
}

declare <8 x i1> @llvm.arm.mve.pred.i2v.v8i1(i32)
declare <4 x i1> @llvm.arm.mve.pred.i2v.v4i1(i32)
declare <8 x i16> @llvm.arm.mve.vmovl.predicated.v8i16.v16i8.v8i1(<16 x i8>, i32, i32, <8 x i1>, <8 x i16>)
declare <4 x i32> @llvm.arm.mve.vmovl.predicated.v4i32.v8i16.v4i1(<8 x i16>, i32, i32, <4 x i1>, <4 x i32>)
