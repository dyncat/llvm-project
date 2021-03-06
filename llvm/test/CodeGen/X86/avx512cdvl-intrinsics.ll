; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=i686-unknown -mattr=+avx512cd,+avx512vl | FileCheck %s --check-prefixes=CHECK,X86
; RUN: llc < %s -mtriple=x86_64-unknown -mattr=+avx512cd,+avx512vl | FileCheck %s --check-prefixes=CHECK,X64

define <4 x i32> @test_int_x86_avx512_mask_vplzcnt_d_128(<4 x i32> %x0, <4 x i32> %x1, i8 %x2) {
; X86-LABEL: test_int_x86_avx512_mask_vplzcnt_d_128:
; X86:       # %bb.0:
; X86-NEXT:    movzbl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    kmovw %eax, %k1
; X86-NEXT:    vplzcntd %xmm0, %xmm1 {%k1}
; X86-NEXT:    vmovdqa %xmm1, %xmm0
; X86-NEXT:    retl
;
; X64-LABEL: test_int_x86_avx512_mask_vplzcnt_d_128:
; X64:       # %bb.0:
; X64-NEXT:    kmovw %edi, %k1
; X64-NEXT:    vplzcntd %xmm0, %xmm1 {%k1}
; X64-NEXT:    vmovdqa %xmm1, %xmm0
; X64-NEXT:    retq
  %1 = call <4 x i32> @llvm.ctlz.v4i32(<4 x i32> %x0, i1 false)
  %2 = bitcast i8 %x2 to <8 x i1>
  %extract1 = shufflevector <8 x i1> %2, <8 x i1> %2, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %3 = select <4 x i1> %extract1, <4 x i32> %1, <4 x i32> %x1
  ret <4 x i32> %3
}

define <4 x i32> @test_int_x86_avx512_maskz_vplzcnt_d_128(<4 x i32> %x0, i8 %x2) {
; X86-LABEL: test_int_x86_avx512_maskz_vplzcnt_d_128:
; X86:       # %bb.0:
; X86-NEXT:    movzbl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    kmovw %eax, %k1
; X86-NEXT:    vplzcntd %xmm0, %xmm0 {%k1} {z}
; X86-NEXT:    retl
;
; X64-LABEL: test_int_x86_avx512_maskz_vplzcnt_d_128:
; X64:       # %bb.0:
; X64-NEXT:    kmovw %edi, %k1
; X64-NEXT:    vplzcntd %xmm0, %xmm0 {%k1} {z}
; X64-NEXT:    retq
  %1 = call <4 x i32> @llvm.ctlz.v4i32(<4 x i32> %x0, i1 false)
  %2 = bitcast i8 %x2 to <8 x i1>
  %extract1 = shufflevector <8 x i1> %2, <8 x i1> %2, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %3 = select <4 x i1> %extract1, <4 x i32> %1, <4 x i32> zeroinitializer
  ret <4 x i32> %3
}
declare <4 x i32> @llvm.ctlz.v4i32(<4 x i32>, i1) #0

define <8 x i32> @test_int_x86_avx512_mask_vplzcnt_d_256(<8 x i32> %x0, <8 x i32> %x1, i8 %x2) {
; X86-LABEL: test_int_x86_avx512_mask_vplzcnt_d_256:
; X86:       # %bb.0:
; X86-NEXT:    movzbl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    kmovw %eax, %k1
; X86-NEXT:    vplzcntd %ymm0, %ymm1 {%k1}
; X86-NEXT:    vmovdqa %ymm1, %ymm0
; X86-NEXT:    retl
;
; X64-LABEL: test_int_x86_avx512_mask_vplzcnt_d_256:
; X64:       # %bb.0:
; X64-NEXT:    kmovw %edi, %k1
; X64-NEXT:    vplzcntd %ymm0, %ymm1 {%k1}
; X64-NEXT:    vmovdqa %ymm1, %ymm0
; X64-NEXT:    retq
  %1 = call <8 x i32> @llvm.ctlz.v8i32(<8 x i32> %x0, i1 false)
  %2 = bitcast i8 %x2 to <8 x i1>
  %3 = select <8 x i1> %2, <8 x i32> %1, <8 x i32> %x1
  ret <8 x i32> %3
}
declare <8 x i32> @llvm.ctlz.v8i32(<8 x i32>, i1) #0

define <2 x i64> @test_int_x86_avx512_mask_vplzcnt_q_128(<2 x i64> %x0, <2 x i64> %x1, i8 %x2) {
; X86-LABEL: test_int_x86_avx512_mask_vplzcnt_q_128:
; X86:       # %bb.0:
; X86-NEXT:    movzbl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    kmovw %eax, %k1
; X86-NEXT:    vplzcntq %xmm0, %xmm1 {%k1}
; X86-NEXT:    vmovdqa %xmm1, %xmm0
; X86-NEXT:    retl
;
; X64-LABEL: test_int_x86_avx512_mask_vplzcnt_q_128:
; X64:       # %bb.0:
; X64-NEXT:    kmovw %edi, %k1
; X64-NEXT:    vplzcntq %xmm0, %xmm1 {%k1}
; X64-NEXT:    vmovdqa %xmm1, %xmm0
; X64-NEXT:    retq
  %1 = call <2 x i64> @llvm.ctlz.v2i64(<2 x i64> %x0, i1 false)
  %2 = bitcast i8 %x2 to <8 x i1>
  %extract = shufflevector <8 x i1> %2, <8 x i1> %2, <2 x i32> <i32 0, i32 1>
  %3 = select <2 x i1> %extract, <2 x i64> %1, <2 x i64> %x1
  ret <2 x i64> %3
}
declare <2 x i64> @llvm.ctlz.v2i64(<2 x i64>, i1) #0

define <4 x i64> @test_int_x86_avx512_mask_vplzcnt_q_256(<4 x i64> %x0, <4 x i64> %x1, i8 %x2) {
; X86-LABEL: test_int_x86_avx512_mask_vplzcnt_q_256:
; X86:       # %bb.0:
; X86-NEXT:    movzbl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    kmovw %eax, %k1
; X86-NEXT:    vplzcntq %ymm0, %ymm1 {%k1}
; X86-NEXT:    vmovdqa %ymm1, %ymm0
; X86-NEXT:    retl
;
; X64-LABEL: test_int_x86_avx512_mask_vplzcnt_q_256:
; X64:       # %bb.0:
; X64-NEXT:    kmovw %edi, %k1
; X64-NEXT:    vplzcntq %ymm0, %ymm1 {%k1}
; X64-NEXT:    vmovdqa %ymm1, %ymm0
; X64-NEXT:    retq
  %1 = call <4 x i64> @llvm.ctlz.v4i64(<4 x i64> %x0, i1 false)
  %2 = bitcast i8 %x2 to <8 x i1>
  %extract = shufflevector <8 x i1> %2, <8 x i1> %2, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %3 = select <4 x i1> %extract, <4 x i64> %1, <4 x i64> %x1
  ret <4 x i64> %3
}
declare <4 x i64> @llvm.ctlz.v4i64(<4 x i64>, i1) #0

define <4 x i32> @test_int_x86_avx512_vpconflict_d_128(<4 x i32> %x0, <4 x i32> %x1) {
; CHECK-LABEL: test_int_x86_avx512_vpconflict_d_128:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vpconflictd %xmm0, %xmm0
; CHECK-NEXT:    ret{{[l|q]}}
  %1 = call <4 x i32> @llvm.x86.avx512.conflict.d.128(<4 x i32> %x0)
  ret <4 x i32> %1
}

define <4 x i32> @test_int_x86_avx512_mask_vpconflict_d_128(<4 x i32> %x0, <4 x i32> %x1, i8 %x2) {
; X86-LABEL: test_int_x86_avx512_mask_vpconflict_d_128:
; X86:       # %bb.0:
; X86-NEXT:    movzbl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    kmovw %eax, %k1
; X86-NEXT:    vpconflictd %xmm0, %xmm1 {%k1}
; X86-NEXT:    vmovdqa %xmm1, %xmm0
; X86-NEXT:    retl
;
; X64-LABEL: test_int_x86_avx512_mask_vpconflict_d_128:
; X64:       # %bb.0:
; X64-NEXT:    kmovw %edi, %k1
; X64-NEXT:    vpconflictd %xmm0, %xmm1 {%k1}
; X64-NEXT:    vmovdqa %xmm1, %xmm0
; X64-NEXT:    retq
  %1 = call <4 x i32> @llvm.x86.avx512.conflict.d.128(<4 x i32> %x0)
  %2 = bitcast i8 %x2 to <8 x i1>
  %extract1 = shufflevector <8 x i1> %2, <8 x i1> %2, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %3 = select <4 x i1> %extract1, <4 x i32> %1, <4 x i32> %x1
  ret <4 x i32> %3
}

define <4 x i32> @test_int_x86_avx512_maskz_vpconflict_d_128(<4 x i32> %x0, i8 %x2) {
; X86-LABEL: test_int_x86_avx512_maskz_vpconflict_d_128:
; X86:       # %bb.0:
; X86-NEXT:    movzbl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    kmovw %eax, %k1
; X86-NEXT:    vpconflictd %xmm0, %xmm0 {%k1} {z}
; X86-NEXT:    retl
;
; X64-LABEL: test_int_x86_avx512_maskz_vpconflict_d_128:
; X64:       # %bb.0:
; X64-NEXT:    kmovw %edi, %k1
; X64-NEXT:    vpconflictd %xmm0, %xmm0 {%k1} {z}
; X64-NEXT:    retq
  %1 = call <4 x i32> @llvm.x86.avx512.conflict.d.128(<4 x i32> %x0)
  %2 = bitcast i8 %x2 to <8 x i1>
  %extract1 = shufflevector <8 x i1> %2, <8 x i1> %2, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %3 = select <4 x i1> %extract1, <4 x i32> %1, <4 x i32> zeroinitializer
  ret <4 x i32> %3
}

define <8 x i32> @test_int_x86_avx512_vpconflict_d_256(<8 x i32> %x0, <8 x i32> %x1) {
; CHECK-LABEL: test_int_x86_avx512_vpconflict_d_256:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vpconflictd %ymm0, %ymm0
; CHECK-NEXT:    ret{{[l|q]}}
  %1 = call <8 x i32> @llvm.x86.avx512.conflict.d.256(<8 x i32> %x0)
  ret <8 x i32> %1
}

define <8 x i32> @test_int_x86_avx512_mask_vpconflict_d_256(<8 x i32> %x0, <8 x i32> %x1, i8 %x2) {
; X86-LABEL: test_int_x86_avx512_mask_vpconflict_d_256:
; X86:       # %bb.0:
; X86-NEXT:    movzbl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    kmovw %eax, %k1
; X86-NEXT:    vpconflictd %ymm0, %ymm1 {%k1}
; X86-NEXT:    vmovdqa %ymm1, %ymm0
; X86-NEXT:    retl
;
; X64-LABEL: test_int_x86_avx512_mask_vpconflict_d_256:
; X64:       # %bb.0:
; X64-NEXT:    kmovw %edi, %k1
; X64-NEXT:    vpconflictd %ymm0, %ymm1 {%k1}
; X64-NEXT:    vmovdqa %ymm1, %ymm0
; X64-NEXT:    retq
  %1 = call <8 x i32> @llvm.x86.avx512.conflict.d.256(<8 x i32> %x0)
  %2 = bitcast i8 %x2 to <8 x i1>
  %3 = select <8 x i1> %2, <8 x i32> %1, <8 x i32> %x1
  ret <8 x i32> %3
}

define <8 x i32> @test_int_x86_avx512_maskz_vpconflict_d_256(<8 x i32> %x0, i8 %x2) {
; X86-LABEL: test_int_x86_avx512_maskz_vpconflict_d_256:
; X86:       # %bb.0:
; X86-NEXT:    movzbl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    kmovw %eax, %k1
; X86-NEXT:    vpconflictd %ymm0, %ymm0 {%k1} {z}
; X86-NEXT:    retl
;
; X64-LABEL: test_int_x86_avx512_maskz_vpconflict_d_256:
; X64:       # %bb.0:
; X64-NEXT:    kmovw %edi, %k1
; X64-NEXT:    vpconflictd %ymm0, %ymm0 {%k1} {z}
; X64-NEXT:    retq
  %1 = call <8 x i32> @llvm.x86.avx512.conflict.d.256(<8 x i32> %x0)
  %2 = bitcast i8 %x2 to <8 x i1>
  %3 = select <8 x i1> %2, <8 x i32> %1, <8 x i32> zeroinitializer
  ret <8 x i32> %3
}

define <2 x i64> @test_int_x86_avx512_vpconflict_q_128(<2 x i64> %x0, <2 x i64> %x1) {
; CHECK-LABEL: test_int_x86_avx512_vpconflict_q_128:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vpconflictq %xmm0, %xmm0
; CHECK-NEXT:    ret{{[l|q]}}
  %1 = call <2 x i64> @llvm.x86.avx512.conflict.q.128(<2 x i64> %x0)
  ret <2 x i64> %1
}

define <2 x i64> @test_int_x86_avx512_mask_vpconflict_q_128(<2 x i64> %x0, <2 x i64> %x1, i8 %x2) {
; X86-LABEL: test_int_x86_avx512_mask_vpconflict_q_128:
; X86:       # %bb.0:
; X86-NEXT:    movzbl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    kmovw %eax, %k1
; X86-NEXT:    vpconflictq %xmm0, %xmm1 {%k1}
; X86-NEXT:    vmovdqa %xmm1, %xmm0
; X86-NEXT:    retl
;
; X64-LABEL: test_int_x86_avx512_mask_vpconflict_q_128:
; X64:       # %bb.0:
; X64-NEXT:    kmovw %edi, %k1
; X64-NEXT:    vpconflictq %xmm0, %xmm1 {%k1}
; X64-NEXT:    vmovdqa %xmm1, %xmm0
; X64-NEXT:    retq
  %1 = call <2 x i64> @llvm.x86.avx512.conflict.q.128(<2 x i64> %x0)
  %2 = bitcast i8 %x2 to <8 x i1>
  %extract1 = shufflevector <8 x i1> %2, <8 x i1> %2, <2 x i32> <i32 0, i32 1>
  %3 = select <2 x i1> %extract1, <2 x i64> %1, <2 x i64> %x1
  ret <2 x i64> %3
}

define <2 x i64> @test_int_x86_avx512_maskz_vpconflict_q_128(<2 x i64> %x0, i8 %x2) {
; X86-LABEL: test_int_x86_avx512_maskz_vpconflict_q_128:
; X86:       # %bb.0:
; X86-NEXT:    movzbl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    kmovw %eax, %k1
; X86-NEXT:    vpconflictq %xmm0, %xmm0 {%k1} {z}
; X86-NEXT:    retl
;
; X64-LABEL: test_int_x86_avx512_maskz_vpconflict_q_128:
; X64:       # %bb.0:
; X64-NEXT:    kmovw %edi, %k1
; X64-NEXT:    vpconflictq %xmm0, %xmm0 {%k1} {z}
; X64-NEXT:    retq
  %1 = call <2 x i64> @llvm.x86.avx512.conflict.q.128(<2 x i64> %x0)
  %2 = bitcast i8 %x2 to <8 x i1>
  %extract1 = shufflevector <8 x i1> %2, <8 x i1> %2, <2 x i32> <i32 0, i32 1>
  %3 = select <2 x i1> %extract1, <2 x i64> %1, <2 x i64> zeroinitializer
  ret <2 x i64> %3
}

define <4 x i64> @test_int_x86_avx512_vpconflict_q_256(<4 x i64> %x0, <4 x i64> %x1) {
; CHECK-LABEL: test_int_x86_avx512_vpconflict_q_256:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vpconflictq %ymm0, %ymm0
; CHECK-NEXT:    ret{{[l|q]}}
  %1 = call <4 x i64> @llvm.x86.avx512.conflict.q.256(<4 x i64> %x0)
  ret <4 x i64> %1
}

define <4 x i64> @test_int_x86_avx512_mask_vpconflict_q_256(<4 x i64> %x0, <4 x i64> %x1, i8 %x2) {
; X86-LABEL: test_int_x86_avx512_mask_vpconflict_q_256:
; X86:       # %bb.0:
; X86-NEXT:    movzbl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    kmovw %eax, %k1
; X86-NEXT:    vpconflictq %ymm0, %ymm1 {%k1}
; X86-NEXT:    vmovdqa %ymm1, %ymm0
; X86-NEXT:    retl
;
; X64-LABEL: test_int_x86_avx512_mask_vpconflict_q_256:
; X64:       # %bb.0:
; X64-NEXT:    kmovw %edi, %k1
; X64-NEXT:    vpconflictq %ymm0, %ymm1 {%k1}
; X64-NEXT:    vmovdqa %ymm1, %ymm0
; X64-NEXT:    retq
  %1 = call <4 x i64> @llvm.x86.avx512.conflict.q.256(<4 x i64> %x0)
  %2 = bitcast i8 %x2 to <8 x i1>
  %extract1 = shufflevector <8 x i1> %2, <8 x i1> %2, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %3 = select <4 x i1> %extract1, <4 x i64> %1, <4 x i64> %x1
  ret <4 x i64> %3
}

define <4 x i64> @test_int_x86_avx512_maskz_vpconflict_q_256(<4 x i64> %x0, i8 %x2) {
; X86-LABEL: test_int_x86_avx512_maskz_vpconflict_q_256:
; X86:       # %bb.0:
; X86-NEXT:    movzbl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    kmovw %eax, %k1
; X86-NEXT:    vpconflictq %ymm0, %ymm0 {%k1} {z}
; X86-NEXT:    retl
;
; X64-LABEL: test_int_x86_avx512_maskz_vpconflict_q_256:
; X64:       # %bb.0:
; X64-NEXT:    kmovw %edi, %k1
; X64-NEXT:    vpconflictq %ymm0, %ymm0 {%k1} {z}
; X64-NEXT:    retq
  %1 = call <4 x i64> @llvm.x86.avx512.conflict.q.256(<4 x i64> %x0)
  %2 = bitcast i8 %x2 to <8 x i1>
  %extract1 = shufflevector <8 x i1> %2, <8 x i1> %2, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %3 = select <4 x i1> %extract1, <4 x i64> %1, <4 x i64> zeroinitializer
  ret <4 x i64> %3
}

declare <4 x i32> @llvm.x86.avx512.conflict.d.128(<4 x i32>)
declare <8 x i32> @llvm.x86.avx512.conflict.d.256(<8 x i32>)
declare <2 x i64> @llvm.x86.avx512.conflict.q.128(<2 x i64>)
declare <4 x i64> @llvm.x86.avx512.conflict.q.256(<4 x i64>)
