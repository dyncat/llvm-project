; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -global-isel -mtriple=amdgcn-mesa-mesa3d -mcpu=gfx900 -o - %s | FileCheck -check-prefix=GFX9 %s
; RUN: llc -global-isel -mtriple=amdgcn-mesa-mesa3d -mcpu=gfx1010 -o - %s | FileCheck -check-prefix=GFX10 %s

define amdgpu_ps <4 x float> @sample_l_1d(<8 x i32> inreg %rsrc, <4 x i32> inreg %samp, half %s, half %lod) {
; GFX9-LABEL: sample_l_1d:
; GFX9:       ; %bb.0: ; %main_body
; GFX9-NEXT:    s_mov_b32 s0, s2
; GFX9-NEXT:    s_mov_b32 s1, s3
; GFX9-NEXT:    s_mov_b32 s2, s4
; GFX9-NEXT:    s_mov_b32 s3, s5
; GFX9-NEXT:    s_mov_b32 s4, s6
; GFX9-NEXT:    s_mov_b32 s5, s7
; GFX9-NEXT:    s_mov_b32 s6, s8
; GFX9-NEXT:    s_mov_b32 s7, s9
; GFX9-NEXT:    s_mov_b32 s8, s10
; GFX9-NEXT:    s_mov_b32 s9, s11
; GFX9-NEXT:    s_mov_b32 s10, s12
; GFX9-NEXT:    s_mov_b32 s11, s13
; GFX9-NEXT:    image_sample_lz v[0:3], v0, s[0:7], s[8:11] dmask:0xf a16
; GFX9-NEXT:    s_waitcnt vmcnt(0)
; GFX9-NEXT:    ; return to shader part epilog
;
; GFX10-LABEL: sample_l_1d:
; GFX10:       ; %bb.0: ; %main_body
; GFX10-NEXT:    s_mov_b32 s0, s2
; GFX10-NEXT:    s_mov_b32 s1, s3
; GFX10-NEXT:    s_mov_b32 s2, s4
; GFX10-NEXT:    s_mov_b32 s3, s5
; GFX10-NEXT:    s_mov_b32 s4, s6
; GFX10-NEXT:    s_mov_b32 s5, s7
; GFX10-NEXT:    s_mov_b32 s6, s8
; GFX10-NEXT:    s_mov_b32 s7, s9
; GFX10-NEXT:    s_mov_b32 s8, s10
; GFX10-NEXT:    s_mov_b32 s9, s11
; GFX10-NEXT:    s_mov_b32 s10, s12
; GFX10-NEXT:    s_mov_b32 s11, s13
; GFX10-NEXT:    ; implicit-def: $vcc_hi
; GFX10-NEXT:    image_sample_lz v[0:3], v0, s[0:7], s[8:11] dmask:0xf dim:SQ_RSRC_IMG_1D a16
; GFX10-NEXT:    s_waitcnt vmcnt(0)
; GFX10-NEXT:    ; return to shader part epilog
main_body:
  %v = call <4 x float> @llvm.amdgcn.image.sample.l.1d.v4f32.f16(i32 15, half %s, half 0.000000e+00, <8 x i32> %rsrc, <4 x i32> %samp, i1 false, i32 0, i32 0)
  ret <4 x float> %v
}

define amdgpu_ps <4 x float> @sample_l_2d(<8 x i32> inreg %rsrc, <4 x i32> inreg %samp, half %s, half %t, half %lod) {
; GFX9-LABEL: sample_l_2d:
; GFX9:       ; %bb.0: ; %main_body
; GFX9-NEXT:    v_mov_b32_e32 v2, 0xffff
; GFX9-NEXT:    v_lshlrev_b32_e32 v1, 16, v1
; GFX9-NEXT:    s_mov_b32 s0, s2
; GFX9-NEXT:    s_mov_b32 s1, s3
; GFX9-NEXT:    s_mov_b32 s2, s4
; GFX9-NEXT:    s_mov_b32 s3, s5
; GFX9-NEXT:    s_mov_b32 s4, s6
; GFX9-NEXT:    s_mov_b32 s5, s7
; GFX9-NEXT:    s_mov_b32 s6, s8
; GFX9-NEXT:    s_mov_b32 s7, s9
; GFX9-NEXT:    s_mov_b32 s8, s10
; GFX9-NEXT:    s_mov_b32 s9, s11
; GFX9-NEXT:    s_mov_b32 s10, s12
; GFX9-NEXT:    s_mov_b32 s11, s13
; GFX9-NEXT:    v_and_or_b32 v0, v0, v2, v1
; GFX9-NEXT:    image_sample_lz v[0:3], v0, s[0:7], s[8:11] dmask:0xf a16
; GFX9-NEXT:    s_waitcnt vmcnt(0)
; GFX9-NEXT:    ; return to shader part epilog
;
; GFX10-LABEL: sample_l_2d:
; GFX10:       ; %bb.0: ; %main_body
; GFX10-NEXT:    v_lshlrev_b32_e32 v1, 16, v1
; GFX10-NEXT:    s_mov_b32 s0, s2
; GFX10-NEXT:    s_mov_b32 s1, s3
; GFX10-NEXT:    s_mov_b32 s2, s4
; GFX10-NEXT:    s_mov_b32 s3, s5
; GFX10-NEXT:    v_and_or_b32 v0, v0, 0xffff, v1
; GFX10-NEXT:    s_mov_b32 s4, s6
; GFX10-NEXT:    s_mov_b32 s5, s7
; GFX10-NEXT:    s_mov_b32 s6, s8
; GFX10-NEXT:    s_mov_b32 s7, s9
; GFX10-NEXT:    s_mov_b32 s8, s10
; GFX10-NEXT:    s_mov_b32 s9, s11
; GFX10-NEXT:    s_mov_b32 s10, s12
; GFX10-NEXT:    s_mov_b32 s11, s13
; GFX10-NEXT:    ; implicit-def: $vcc_hi
; GFX10-NEXT:    image_sample_lz v[0:3], v0, s[0:7], s[8:11] dmask:0xf dim:SQ_RSRC_IMG_2D a16
; GFX10-NEXT:    s_waitcnt vmcnt(0)
; GFX10-NEXT:    ; return to shader part epilog
main_body:
  %v = call <4 x float> @llvm.amdgcn.image.sample.l.2d.v4f32.f16(i32 15, half %s, half %t, half -0.000000e+00, <8 x i32> %rsrc, <4 x i32> %samp, i1 false, i32 0, i32 0)
  ret <4 x float> %v
}

define amdgpu_ps <4 x float> @sample_c_l_1d(<8 x i32> inreg %rsrc, <4 x i32> inreg %samp, float %zcompare, half %s, half %lod) {
; GFX9-LABEL: sample_c_l_1d:
; GFX9:       ; %bb.0: ; %main_body
; GFX9-NEXT:    s_mov_b32 s0, s2
; GFX9-NEXT:    s_mov_b32 s2, s4
; GFX9-NEXT:    s_mov_b32 s4, s6
; GFX9-NEXT:    s_mov_b32 s6, s8
; GFX9-NEXT:    s_mov_b32 s8, s10
; GFX9-NEXT:    s_mov_b32 s10, s12
; GFX9-NEXT:    v_mov_b32_e32 v2, 0xffff
; GFX9-NEXT:    s_lshl_b32 s12, s0, 16
; GFX9-NEXT:    s_mov_b32 s1, s3
; GFX9-NEXT:    s_mov_b32 s3, s5
; GFX9-NEXT:    s_mov_b32 s5, s7
; GFX9-NEXT:    s_mov_b32 s7, s9
; GFX9-NEXT:    s_mov_b32 s9, s11
; GFX9-NEXT:    s_mov_b32 s11, s13
; GFX9-NEXT:    v_and_or_b32 v1, v1, v2, s12
; GFX9-NEXT:    image_sample_c_lz v[0:3], v[0:1], s[0:7], s[8:11] dmask:0xf a16
; GFX9-NEXT:    s_waitcnt vmcnt(0)
; GFX9-NEXT:    ; return to shader part epilog
;
; GFX10-LABEL: sample_c_l_1d:
; GFX10:       ; %bb.0: ; %main_body
; GFX10-NEXT:    s_mov_b32 s0, s2
; GFX10-NEXT:    s_mov_b32 s2, s4
; GFX10-NEXT:    s_mov_b32 s4, s6
; GFX10-NEXT:    s_mov_b32 s6, s8
; GFX10-NEXT:    s_mov_b32 s8, s10
; GFX10-NEXT:    s_mov_b32 s10, s12
; GFX10-NEXT:    s_lshl_b32 s12, s0, 16
; GFX10-NEXT:    s_mov_b32 s1, s3
; GFX10-NEXT:    v_and_or_b32 v1, v1, 0xffff, s12
; GFX10-NEXT:    s_mov_b32 s3, s5
; GFX10-NEXT:    s_mov_b32 s5, s7
; GFX10-NEXT:    s_mov_b32 s7, s9
; GFX10-NEXT:    s_mov_b32 s9, s11
; GFX10-NEXT:    s_mov_b32 s11, s13
; GFX10-NEXT:    ; implicit-def: $vcc_hi
; GFX10-NEXT:    image_sample_c_lz v[0:3], v[0:1], s[0:7], s[8:11] dmask:0xf dim:SQ_RSRC_IMG_1D a16
; GFX10-NEXT:    s_waitcnt vmcnt(0)
; GFX10-NEXT:    ; return to shader part epilog
main_body:
  %v = call <4 x float> @llvm.amdgcn.image.sample.c.l.1d.v4f32.f16(i32 15, float %zcompare, half %s, half -2.000000e+00, <8 x i32> %rsrc, <4 x i32> %samp, i1 false, i32 0, i32 0)
  ret <4 x float> %v
}

define amdgpu_ps <4 x float> @sample_c_l_2d(<8 x i32> inreg %rsrc, <4 x i32> inreg %samp, float %zcompare, half %s, half %t, half %lod) {
; GFX9-LABEL: sample_c_l_2d:
; GFX9:       ; %bb.0: ; %main_body
; GFX9-NEXT:    v_mov_b32_e32 v3, 0xffff
; GFX9-NEXT:    v_lshlrev_b32_e32 v2, 16, v2
; GFX9-NEXT:    s_mov_b32 s0, s2
; GFX9-NEXT:    s_mov_b32 s1, s3
; GFX9-NEXT:    s_mov_b32 s2, s4
; GFX9-NEXT:    s_mov_b32 s3, s5
; GFX9-NEXT:    s_mov_b32 s4, s6
; GFX9-NEXT:    s_mov_b32 s5, s7
; GFX9-NEXT:    s_mov_b32 s6, s8
; GFX9-NEXT:    s_mov_b32 s7, s9
; GFX9-NEXT:    s_mov_b32 s8, s10
; GFX9-NEXT:    s_mov_b32 s9, s11
; GFX9-NEXT:    s_mov_b32 s10, s12
; GFX9-NEXT:    s_mov_b32 s11, s13
; GFX9-NEXT:    v_and_or_b32 v1, v1, v3, v2
; GFX9-NEXT:    image_sample_c_lz v[0:3], v[0:1], s[0:7], s[8:11] dmask:0xf a16
; GFX9-NEXT:    s_waitcnt vmcnt(0)
; GFX9-NEXT:    ; return to shader part epilog
;
; GFX10-LABEL: sample_c_l_2d:
; GFX10:       ; %bb.0: ; %main_body
; GFX10-NEXT:    v_lshlrev_b32_e32 v2, 16, v2
; GFX10-NEXT:    s_mov_b32 s0, s2
; GFX10-NEXT:    s_mov_b32 s1, s3
; GFX10-NEXT:    s_mov_b32 s2, s4
; GFX10-NEXT:    s_mov_b32 s3, s5
; GFX10-NEXT:    v_and_or_b32 v1, v1, 0xffff, v2
; GFX10-NEXT:    s_mov_b32 s4, s6
; GFX10-NEXT:    s_mov_b32 s5, s7
; GFX10-NEXT:    s_mov_b32 s6, s8
; GFX10-NEXT:    s_mov_b32 s7, s9
; GFX10-NEXT:    s_mov_b32 s8, s10
; GFX10-NEXT:    s_mov_b32 s9, s11
; GFX10-NEXT:    s_mov_b32 s10, s12
; GFX10-NEXT:    s_mov_b32 s11, s13
; GFX10-NEXT:    ; implicit-def: $vcc_hi
; GFX10-NEXT:    image_sample_c_lz v[0:3], v[0:1], s[0:7], s[8:11] dmask:0xf dim:SQ_RSRC_IMG_2D a16
; GFX10-NEXT:    s_waitcnt vmcnt(0)
; GFX10-NEXT:    ; return to shader part epilog
main_body:
  %v = call <4 x float> @llvm.amdgcn.image.sample.c.l.2d.v4f32.f16(i32 15, float %zcompare, half %s, half %t, half 0.000000e+00, <8 x i32> %rsrc, <4 x i32> %samp, i1 false, i32 0, i32 0)
  ret <4 x float> %v
}

define amdgpu_ps <4 x float> @sample_l_o_1d(<8 x i32> inreg %rsrc, <4 x i32> inreg %samp, i32 %offset, half %s, half %lod) {
; GFX9-LABEL: sample_l_o_1d:
; GFX9:       ; %bb.0: ; %main_body
; GFX9-NEXT:    s_mov_b32 s0, s2
; GFX9-NEXT:    s_mov_b32 s2, s4
; GFX9-NEXT:    s_mov_b32 s4, s6
; GFX9-NEXT:    s_mov_b32 s6, s8
; GFX9-NEXT:    s_mov_b32 s8, s10
; GFX9-NEXT:    s_mov_b32 s10, s12
; GFX9-NEXT:    v_mov_b32_e32 v2, 0xffff
; GFX9-NEXT:    s_lshl_b32 s12, s0, 16
; GFX9-NEXT:    s_mov_b32 s1, s3
; GFX9-NEXT:    s_mov_b32 s3, s5
; GFX9-NEXT:    s_mov_b32 s5, s7
; GFX9-NEXT:    s_mov_b32 s7, s9
; GFX9-NEXT:    s_mov_b32 s9, s11
; GFX9-NEXT:    s_mov_b32 s11, s13
; GFX9-NEXT:    v_and_or_b32 v1, v1, v2, s12
; GFX9-NEXT:    image_sample_lz_o v[0:3], v[0:1], s[0:7], s[8:11] dmask:0xf a16
; GFX9-NEXT:    s_waitcnt vmcnt(0)
; GFX9-NEXT:    ; return to shader part epilog
;
; GFX10-LABEL: sample_l_o_1d:
; GFX10:       ; %bb.0: ; %main_body
; GFX10-NEXT:    s_mov_b32 s0, s2
; GFX10-NEXT:    s_mov_b32 s2, s4
; GFX10-NEXT:    s_mov_b32 s4, s6
; GFX10-NEXT:    s_mov_b32 s6, s8
; GFX10-NEXT:    s_mov_b32 s8, s10
; GFX10-NEXT:    s_mov_b32 s10, s12
; GFX10-NEXT:    s_lshl_b32 s12, s0, 16
; GFX10-NEXT:    s_mov_b32 s1, s3
; GFX10-NEXT:    v_and_or_b32 v1, v1, 0xffff, s12
; GFX10-NEXT:    s_mov_b32 s3, s5
; GFX10-NEXT:    s_mov_b32 s5, s7
; GFX10-NEXT:    s_mov_b32 s7, s9
; GFX10-NEXT:    s_mov_b32 s9, s11
; GFX10-NEXT:    s_mov_b32 s11, s13
; GFX10-NEXT:    ; implicit-def: $vcc_hi
; GFX10-NEXT:    image_sample_lz_o v[0:3], v[0:1], s[0:7], s[8:11] dmask:0xf dim:SQ_RSRC_IMG_1D a16
; GFX10-NEXT:    s_waitcnt vmcnt(0)
; GFX10-NEXT:    ; return to shader part epilog
main_body:
  %v = call <4 x float> @llvm.amdgcn.image.sample.l.o.1d.v4f32.f16(i32 15, i32 %offset, half %s, half 0.000000e+00, <8 x i32> %rsrc, <4 x i32> %samp, i1 false, i32 0, i32 0)
  ret <4 x float> %v
}

define amdgpu_ps <4 x float> @sample_l_o_2d(<8 x i32> inreg %rsrc, <4 x i32> inreg %samp, i32 %offset, half %s, half %t, half %lod) {
; GFX9-LABEL: sample_l_o_2d:
; GFX9:       ; %bb.0: ; %main_body
; GFX9-NEXT:    v_mov_b32_e32 v3, 0xffff
; GFX9-NEXT:    v_lshlrev_b32_e32 v2, 16, v2
; GFX9-NEXT:    s_mov_b32 s0, s2
; GFX9-NEXT:    s_mov_b32 s1, s3
; GFX9-NEXT:    s_mov_b32 s2, s4
; GFX9-NEXT:    s_mov_b32 s3, s5
; GFX9-NEXT:    s_mov_b32 s4, s6
; GFX9-NEXT:    s_mov_b32 s5, s7
; GFX9-NEXT:    s_mov_b32 s6, s8
; GFX9-NEXT:    s_mov_b32 s7, s9
; GFX9-NEXT:    s_mov_b32 s8, s10
; GFX9-NEXT:    s_mov_b32 s9, s11
; GFX9-NEXT:    s_mov_b32 s10, s12
; GFX9-NEXT:    s_mov_b32 s11, s13
; GFX9-NEXT:    v_and_or_b32 v1, v1, v3, v2
; GFX9-NEXT:    image_sample_lz_o v[0:3], v[0:1], s[0:7], s[8:11] dmask:0xf a16
; GFX9-NEXT:    s_waitcnt vmcnt(0)
; GFX9-NEXT:    ; return to shader part epilog
;
; GFX10-LABEL: sample_l_o_2d:
; GFX10:       ; %bb.0: ; %main_body
; GFX10-NEXT:    v_lshlrev_b32_e32 v2, 16, v2
; GFX10-NEXT:    s_mov_b32 s0, s2
; GFX10-NEXT:    s_mov_b32 s1, s3
; GFX10-NEXT:    s_mov_b32 s2, s4
; GFX10-NEXT:    s_mov_b32 s3, s5
; GFX10-NEXT:    v_and_or_b32 v1, v1, 0xffff, v2
; GFX10-NEXT:    s_mov_b32 s4, s6
; GFX10-NEXT:    s_mov_b32 s5, s7
; GFX10-NEXT:    s_mov_b32 s6, s8
; GFX10-NEXT:    s_mov_b32 s7, s9
; GFX10-NEXT:    s_mov_b32 s8, s10
; GFX10-NEXT:    s_mov_b32 s9, s11
; GFX10-NEXT:    s_mov_b32 s10, s12
; GFX10-NEXT:    s_mov_b32 s11, s13
; GFX10-NEXT:    ; implicit-def: $vcc_hi
; GFX10-NEXT:    image_sample_lz_o v[0:3], v[0:1], s[0:7], s[8:11] dmask:0xf dim:SQ_RSRC_IMG_2D a16
; GFX10-NEXT:    s_waitcnt vmcnt(0)
; GFX10-NEXT:    ; return to shader part epilog
main_body:
  %v = call <4 x float> @llvm.amdgcn.image.sample.l.o.2d.v4f32.f16(i32 15, i32 %offset, half %s, half %t, half 0.000000e+00, <8 x i32> %rsrc, <4 x i32> %samp, i1 false, i32 0, i32 0)
  ret <4 x float> %v
}

define amdgpu_ps <4 x float> @sample_c_l_o_1d(<8 x i32> inreg %rsrc, <4 x i32> inreg %samp, i32 %offset, float %zcompare, half %s, half %lod) {
; GFX9-LABEL: sample_c_l_o_1d:
; GFX9:       ; %bb.0: ; %main_body
; GFX9-NEXT:    s_mov_b32 s0, s2
; GFX9-NEXT:    s_mov_b32 s2, s4
; GFX9-NEXT:    s_mov_b32 s4, s6
; GFX9-NEXT:    s_mov_b32 s6, s8
; GFX9-NEXT:    s_mov_b32 s8, s10
; GFX9-NEXT:    s_mov_b32 s10, s12
; GFX9-NEXT:    v_mov_b32_e32 v3, 0xffff
; GFX9-NEXT:    s_lshl_b32 s12, s0, 16
; GFX9-NEXT:    s_mov_b32 s1, s3
; GFX9-NEXT:    s_mov_b32 s3, s5
; GFX9-NEXT:    s_mov_b32 s5, s7
; GFX9-NEXT:    s_mov_b32 s7, s9
; GFX9-NEXT:    s_mov_b32 s9, s11
; GFX9-NEXT:    s_mov_b32 s11, s13
; GFX9-NEXT:    v_and_or_b32 v2, v2, v3, s12
; GFX9-NEXT:    image_sample_c_lz_o v[0:3], v[0:2], s[0:7], s[8:11] dmask:0xf a16
; GFX9-NEXT:    s_waitcnt vmcnt(0)
; GFX9-NEXT:    ; return to shader part epilog
;
; GFX10-LABEL: sample_c_l_o_1d:
; GFX10:       ; %bb.0: ; %main_body
; GFX10-NEXT:    s_mov_b32 s0, s2
; GFX10-NEXT:    s_mov_b32 s2, s4
; GFX10-NEXT:    s_mov_b32 s4, s6
; GFX10-NEXT:    s_mov_b32 s6, s8
; GFX10-NEXT:    s_mov_b32 s8, s10
; GFX10-NEXT:    s_mov_b32 s10, s12
; GFX10-NEXT:    s_lshl_b32 s12, s0, 16
; GFX10-NEXT:    s_mov_b32 s1, s3
; GFX10-NEXT:    v_and_or_b32 v2, v2, 0xffff, s12
; GFX10-NEXT:    s_mov_b32 s3, s5
; GFX10-NEXT:    s_mov_b32 s5, s7
; GFX10-NEXT:    s_mov_b32 s7, s9
; GFX10-NEXT:    s_mov_b32 s9, s11
; GFX10-NEXT:    s_mov_b32 s11, s13
; GFX10-NEXT:    ; implicit-def: $vcc_hi
; GFX10-NEXT:    image_sample_c_lz_o v[0:3], v[0:2], s[0:7], s[8:11] dmask:0xf dim:SQ_RSRC_IMG_1D a16
; GFX10-NEXT:    s_waitcnt vmcnt(0)
; GFX10-NEXT:    ; return to shader part epilog
main_body:
  %v = call <4 x float> @llvm.amdgcn.image.sample.c.l.o.1d.v4f32.f16(i32 15, i32 %offset, float %zcompare, half %s, half 0.000000e+00, <8 x i32> %rsrc, <4 x i32> %samp, i1 false, i32 0, i32 0)
  ret <4 x float> %v
}

define amdgpu_ps <4 x float> @sample_c_l_o_2d(<8 x i32> inreg %rsrc, <4 x i32> inreg %samp, i32 %offset, float %zcompare, half %s, half %t, half %lod) {
; GFX9-LABEL: sample_c_l_o_2d:
; GFX9:       ; %bb.0: ; %main_body
; GFX9-NEXT:    v_mov_b32_e32 v4, 0xffff
; GFX9-NEXT:    v_lshlrev_b32_e32 v3, 16, v3
; GFX9-NEXT:    s_mov_b32 s0, s2
; GFX9-NEXT:    s_mov_b32 s1, s3
; GFX9-NEXT:    s_mov_b32 s2, s4
; GFX9-NEXT:    s_mov_b32 s3, s5
; GFX9-NEXT:    s_mov_b32 s4, s6
; GFX9-NEXT:    s_mov_b32 s5, s7
; GFX9-NEXT:    s_mov_b32 s6, s8
; GFX9-NEXT:    s_mov_b32 s7, s9
; GFX9-NEXT:    s_mov_b32 s8, s10
; GFX9-NEXT:    s_mov_b32 s9, s11
; GFX9-NEXT:    s_mov_b32 s10, s12
; GFX9-NEXT:    s_mov_b32 s11, s13
; GFX9-NEXT:    v_and_or_b32 v2, v2, v4, v3
; GFX9-NEXT:    image_sample_c_lz_o v[0:3], v[0:2], s[0:7], s[8:11] dmask:0xf a16
; GFX9-NEXT:    s_waitcnt vmcnt(0)
; GFX9-NEXT:    ; return to shader part epilog
;
; GFX10-LABEL: sample_c_l_o_2d:
; GFX10:       ; %bb.0: ; %main_body
; GFX10-NEXT:    v_lshlrev_b32_e32 v3, 16, v3
; GFX10-NEXT:    s_mov_b32 s0, s2
; GFX10-NEXT:    s_mov_b32 s1, s3
; GFX10-NEXT:    s_mov_b32 s2, s4
; GFX10-NEXT:    s_mov_b32 s3, s5
; GFX10-NEXT:    v_and_or_b32 v2, v2, 0xffff, v3
; GFX10-NEXT:    s_mov_b32 s4, s6
; GFX10-NEXT:    s_mov_b32 s5, s7
; GFX10-NEXT:    s_mov_b32 s6, s8
; GFX10-NEXT:    s_mov_b32 s7, s9
; GFX10-NEXT:    s_mov_b32 s8, s10
; GFX10-NEXT:    s_mov_b32 s9, s11
; GFX10-NEXT:    s_mov_b32 s10, s12
; GFX10-NEXT:    s_mov_b32 s11, s13
; GFX10-NEXT:    ; implicit-def: $vcc_hi
; GFX10-NEXT:    image_sample_c_lz_o v[0:3], v[0:2], s[0:7], s[8:11] dmask:0xf dim:SQ_RSRC_IMG_2D a16
; GFX10-NEXT:    s_waitcnt vmcnt(0)
; GFX10-NEXT:    ; return to shader part epilog
main_body:
  %v = call <4 x float> @llvm.amdgcn.image.sample.c.l.o.2d.v4f32.f16(i32 15, i32 %offset, float %zcompare, half %s, half %t, half 0.000000e+00, <8 x i32> %rsrc, <4 x i32> %samp, i1 false, i32 0, i32 0)
  ret <4 x float> %v
}

define amdgpu_ps <4 x float> @gather4_l_2d(<8 x i32> inreg %rsrc, <4 x i32> inreg %samp, half %s, half %t, half %lod) {
; GFX9-LABEL: gather4_l_2d:
; GFX9:       ; %bb.0: ; %main_body
; GFX9-NEXT:    v_mov_b32_e32 v2, 0xffff
; GFX9-NEXT:    v_lshlrev_b32_e32 v1, 16, v1
; GFX9-NEXT:    s_mov_b32 s0, s2
; GFX9-NEXT:    s_mov_b32 s1, s3
; GFX9-NEXT:    s_mov_b32 s2, s4
; GFX9-NEXT:    s_mov_b32 s3, s5
; GFX9-NEXT:    s_mov_b32 s4, s6
; GFX9-NEXT:    s_mov_b32 s5, s7
; GFX9-NEXT:    s_mov_b32 s6, s8
; GFX9-NEXT:    s_mov_b32 s7, s9
; GFX9-NEXT:    s_mov_b32 s8, s10
; GFX9-NEXT:    s_mov_b32 s9, s11
; GFX9-NEXT:    s_mov_b32 s10, s12
; GFX9-NEXT:    s_mov_b32 s11, s13
; GFX9-NEXT:    v_and_or_b32 v0, v0, v2, v1
; GFX9-NEXT:    image_gather4_lz v[0:3], v0, s[0:7], s[8:11] dmask:0xf a16
; GFX9-NEXT:    s_waitcnt vmcnt(0)
; GFX9-NEXT:    ; return to shader part epilog
;
; GFX10-LABEL: gather4_l_2d:
; GFX10:       ; %bb.0: ; %main_body
; GFX10-NEXT:    v_lshlrev_b32_e32 v1, 16, v1
; GFX10-NEXT:    s_mov_b32 s0, s2
; GFX10-NEXT:    s_mov_b32 s1, s3
; GFX10-NEXT:    s_mov_b32 s2, s4
; GFX10-NEXT:    s_mov_b32 s3, s5
; GFX10-NEXT:    v_and_or_b32 v0, v0, 0xffff, v1
; GFX10-NEXT:    s_mov_b32 s4, s6
; GFX10-NEXT:    s_mov_b32 s5, s7
; GFX10-NEXT:    s_mov_b32 s6, s8
; GFX10-NEXT:    s_mov_b32 s7, s9
; GFX10-NEXT:    s_mov_b32 s8, s10
; GFX10-NEXT:    s_mov_b32 s9, s11
; GFX10-NEXT:    s_mov_b32 s10, s12
; GFX10-NEXT:    s_mov_b32 s11, s13
; GFX10-NEXT:    ; implicit-def: $vcc_hi
; GFX10-NEXT:    image_gather4_lz v[0:3], v0, s[0:7], s[8:11] dmask:0xf dim:SQ_RSRC_IMG_2D a16
; GFX10-NEXT:    s_waitcnt vmcnt(0)
; GFX10-NEXT:    ; return to shader part epilog
main_body:
  %v = call <4 x float> @llvm.amdgcn.image.gather4.l.2d.v4f32.f16(i32 15, half %s, half %t, half 0.000000e+00, <8 x i32> %rsrc, <4 x i32> %samp, i1 false, i32 0, i32 0)
  ret <4 x float> %v
}

define amdgpu_ps <4 x float> @gather4_c_l_2d(<8 x i32> inreg %rsrc, <4 x i32> inreg %samp, float %zcompare, half %s, half %t, half %lod) {
; GFX9-LABEL: gather4_c_l_2d:
; GFX9:       ; %bb.0: ; %main_body
; GFX9-NEXT:    v_mov_b32_e32 v3, 0xffff
; GFX9-NEXT:    v_lshlrev_b32_e32 v2, 16, v2
; GFX9-NEXT:    s_mov_b32 s0, s2
; GFX9-NEXT:    s_mov_b32 s1, s3
; GFX9-NEXT:    s_mov_b32 s2, s4
; GFX9-NEXT:    s_mov_b32 s3, s5
; GFX9-NEXT:    s_mov_b32 s4, s6
; GFX9-NEXT:    s_mov_b32 s5, s7
; GFX9-NEXT:    s_mov_b32 s6, s8
; GFX9-NEXT:    s_mov_b32 s7, s9
; GFX9-NEXT:    s_mov_b32 s8, s10
; GFX9-NEXT:    s_mov_b32 s9, s11
; GFX9-NEXT:    s_mov_b32 s10, s12
; GFX9-NEXT:    s_mov_b32 s11, s13
; GFX9-NEXT:    v_and_or_b32 v1, v1, v3, v2
; GFX9-NEXT:    image_gather4_c_lz v[0:3], v[0:1], s[0:7], s[8:11] dmask:0xf a16
; GFX9-NEXT:    s_waitcnt vmcnt(0)
; GFX9-NEXT:    ; return to shader part epilog
;
; GFX10-LABEL: gather4_c_l_2d:
; GFX10:       ; %bb.0: ; %main_body
; GFX10-NEXT:    v_lshlrev_b32_e32 v2, 16, v2
; GFX10-NEXT:    s_mov_b32 s0, s2
; GFX10-NEXT:    s_mov_b32 s1, s3
; GFX10-NEXT:    s_mov_b32 s2, s4
; GFX10-NEXT:    s_mov_b32 s3, s5
; GFX10-NEXT:    v_and_or_b32 v1, v1, 0xffff, v2
; GFX10-NEXT:    s_mov_b32 s4, s6
; GFX10-NEXT:    s_mov_b32 s5, s7
; GFX10-NEXT:    s_mov_b32 s6, s8
; GFX10-NEXT:    s_mov_b32 s7, s9
; GFX10-NEXT:    s_mov_b32 s8, s10
; GFX10-NEXT:    s_mov_b32 s9, s11
; GFX10-NEXT:    s_mov_b32 s10, s12
; GFX10-NEXT:    s_mov_b32 s11, s13
; GFX10-NEXT:    ; implicit-def: $vcc_hi
; GFX10-NEXT:    image_gather4_c_lz v[0:3], v[0:1], s[0:7], s[8:11] dmask:0xf dim:SQ_RSRC_IMG_2D a16
; GFX10-NEXT:    s_waitcnt vmcnt(0)
; GFX10-NEXT:    ; return to shader part epilog
main_body:
  %v = call <4 x float> @llvm.amdgcn.image.gather4.c.l.2d.v4f32.f16(i32 15, float %zcompare, half %s, half %t, half 0.000000e+00, <8 x i32> %rsrc, <4 x i32> %samp, i1 false, i32 0, i32 0)
  ret <4 x float> %v
}

define amdgpu_ps <4 x float> @gather4_l_o_2d(<8 x i32> inreg %rsrc, <4 x i32> inreg %samp, i32 %offset, half %s, half %t, half %lod) {
; GFX9-LABEL: gather4_l_o_2d:
; GFX9:       ; %bb.0: ; %main_body
; GFX9-NEXT:    v_mov_b32_e32 v3, 0xffff
; GFX9-NEXT:    v_lshlrev_b32_e32 v2, 16, v2
; GFX9-NEXT:    s_mov_b32 s0, s2
; GFX9-NEXT:    s_mov_b32 s1, s3
; GFX9-NEXT:    s_mov_b32 s2, s4
; GFX9-NEXT:    s_mov_b32 s3, s5
; GFX9-NEXT:    s_mov_b32 s4, s6
; GFX9-NEXT:    s_mov_b32 s5, s7
; GFX9-NEXT:    s_mov_b32 s6, s8
; GFX9-NEXT:    s_mov_b32 s7, s9
; GFX9-NEXT:    s_mov_b32 s8, s10
; GFX9-NEXT:    s_mov_b32 s9, s11
; GFX9-NEXT:    s_mov_b32 s10, s12
; GFX9-NEXT:    s_mov_b32 s11, s13
; GFX9-NEXT:    v_and_or_b32 v1, v1, v3, v2
; GFX9-NEXT:    image_gather4_lz_o v[0:3], v[0:1], s[0:7], s[8:11] dmask:0xf a16
; GFX9-NEXT:    s_waitcnt vmcnt(0)
; GFX9-NEXT:    ; return to shader part epilog
;
; GFX10-LABEL: gather4_l_o_2d:
; GFX10:       ; %bb.0: ; %main_body
; GFX10-NEXT:    v_lshlrev_b32_e32 v2, 16, v2
; GFX10-NEXT:    s_mov_b32 s0, s2
; GFX10-NEXT:    s_mov_b32 s1, s3
; GFX10-NEXT:    s_mov_b32 s2, s4
; GFX10-NEXT:    s_mov_b32 s3, s5
; GFX10-NEXT:    v_and_or_b32 v1, v1, 0xffff, v2
; GFX10-NEXT:    s_mov_b32 s4, s6
; GFX10-NEXT:    s_mov_b32 s5, s7
; GFX10-NEXT:    s_mov_b32 s6, s8
; GFX10-NEXT:    s_mov_b32 s7, s9
; GFX10-NEXT:    s_mov_b32 s8, s10
; GFX10-NEXT:    s_mov_b32 s9, s11
; GFX10-NEXT:    s_mov_b32 s10, s12
; GFX10-NEXT:    s_mov_b32 s11, s13
; GFX10-NEXT:    ; implicit-def: $vcc_hi
; GFX10-NEXT:    image_gather4_lz_o v[0:3], v[0:1], s[0:7], s[8:11] dmask:0xf dim:SQ_RSRC_IMG_2D a16
; GFX10-NEXT:    s_waitcnt vmcnt(0)
; GFX10-NEXT:    ; return to shader part epilog
main_body:
  %v = call <4 x float> @llvm.amdgcn.image.gather4.l.o.2d.v4f32.f16(i32 15, i32 %offset, half %s, half %t, half 0.000000e+00, <8 x i32> %rsrc, <4 x i32> %samp, i1 false, i32 0, i32 0)
  ret <4 x float> %v
}

define amdgpu_ps <4 x float> @gather4_c_l_o_2d(<8 x i32> inreg %rsrc, <4 x i32> inreg %samp, i32 %offset, float %zcompare, half %s, half %t, half %lod) {
; GFX9-LABEL: gather4_c_l_o_2d:
; GFX9:       ; %bb.0: ; %main_body
; GFX9-NEXT:    v_mov_b32_e32 v4, 0xffff
; GFX9-NEXT:    v_lshlrev_b32_e32 v3, 16, v3
; GFX9-NEXT:    s_mov_b32 s0, s2
; GFX9-NEXT:    s_mov_b32 s1, s3
; GFX9-NEXT:    s_mov_b32 s2, s4
; GFX9-NEXT:    s_mov_b32 s3, s5
; GFX9-NEXT:    s_mov_b32 s4, s6
; GFX9-NEXT:    s_mov_b32 s5, s7
; GFX9-NEXT:    s_mov_b32 s6, s8
; GFX9-NEXT:    s_mov_b32 s7, s9
; GFX9-NEXT:    s_mov_b32 s8, s10
; GFX9-NEXT:    s_mov_b32 s9, s11
; GFX9-NEXT:    s_mov_b32 s10, s12
; GFX9-NEXT:    s_mov_b32 s11, s13
; GFX9-NEXT:    v_and_or_b32 v2, v2, v4, v3
; GFX9-NEXT:    image_gather4_c_lz_o v[0:3], v[0:2], s[0:7], s[8:11] dmask:0xf a16
; GFX9-NEXT:    s_waitcnt vmcnt(0)
; GFX9-NEXT:    ; return to shader part epilog
;
; GFX10-LABEL: gather4_c_l_o_2d:
; GFX10:       ; %bb.0: ; %main_body
; GFX10-NEXT:    v_lshlrev_b32_e32 v3, 16, v3
; GFX10-NEXT:    s_mov_b32 s0, s2
; GFX10-NEXT:    s_mov_b32 s1, s3
; GFX10-NEXT:    s_mov_b32 s2, s4
; GFX10-NEXT:    s_mov_b32 s3, s5
; GFX10-NEXT:    v_and_or_b32 v2, v2, 0xffff, v3
; GFX10-NEXT:    s_mov_b32 s4, s6
; GFX10-NEXT:    s_mov_b32 s5, s7
; GFX10-NEXT:    s_mov_b32 s6, s8
; GFX10-NEXT:    s_mov_b32 s7, s9
; GFX10-NEXT:    s_mov_b32 s8, s10
; GFX10-NEXT:    s_mov_b32 s9, s11
; GFX10-NEXT:    s_mov_b32 s10, s12
; GFX10-NEXT:    s_mov_b32 s11, s13
; GFX10-NEXT:    ; implicit-def: $vcc_hi
; GFX10-NEXT:    image_gather4_c_lz_o v[0:3], v[0:2], s[0:7], s[8:11] dmask:0xf dim:SQ_RSRC_IMG_2D a16
; GFX10-NEXT:    s_waitcnt vmcnt(0)
; GFX10-NEXT:    ; return to shader part epilog
main_body:
  %v = call <4 x float> @llvm.amdgcn.image.gather4.c.l.o.2d.v4f32.f16(i32 15, i32 %offset, float %zcompare, half %s, half %t, half 0.000000e+00, <8 x i32> %rsrc, <4 x i32> %samp, i1 false, i32 0, i32 0)
  ret <4 x float> %v
}

declare <4 x float> @llvm.amdgcn.image.sample.l.1d.v4f32.f16(i32 immarg, half, half, <8 x i32>, <4 x i32>, i1 immarg, i32 immarg, i32 immarg) #0
declare <4 x float> @llvm.amdgcn.image.sample.l.2d.v4f32.f16(i32 immarg, half, half, half, <8 x i32>, <4 x i32>, i1 immarg, i32 immarg, i32 immarg) #0
declare <4 x float> @llvm.amdgcn.image.sample.c.l.1d.v4f32.f16(i32 immarg, float, half, half, <8 x i32>, <4 x i32>, i1 immarg, i32 immarg, i32 immarg) #0
declare <4 x float> @llvm.amdgcn.image.sample.c.l.2d.v4f32.f16(i32 immarg, float, half, half, half, <8 x i32>, <4 x i32>, i1 immarg, i32 immarg, i32 immarg) #0
declare <4 x float> @llvm.amdgcn.image.sample.l.o.1d.v4f32.f16(i32 immarg, i32, half, half, <8 x i32>, <4 x i32>, i1 immarg, i32 immarg, i32 immarg) #0
declare <4 x float> @llvm.amdgcn.image.sample.l.o.2d.v4f32.f16(i32 immarg, i32, half, half, half, <8 x i32>, <4 x i32>, i1 immarg, i32 immarg, i32 immarg) #0
declare <4 x float> @llvm.amdgcn.image.sample.c.l.o.1d.v4f32.f16(i32 immarg, i32, float, half, half, <8 x i32>, <4 x i32>, i1 immarg, i32 immarg, i32 immarg) #0
declare <4 x float> @llvm.amdgcn.image.sample.c.l.o.2d.v4f32.f16(i32 immarg, i32, float, half, half, half, <8 x i32>, <4 x i32>, i1 immarg, i32 immarg, i32 immarg) #0
declare <4 x float> @llvm.amdgcn.image.gather4.l.2d.v4f32.f16(i32 immarg, half, half, half, <8 x i32>, <4 x i32>, i1 immarg, i32 immarg, i32 immarg) #0
declare <4 x float> @llvm.amdgcn.image.gather4.c.l.2d.v4f32.f16(i32 immarg, float, half, half, half, <8 x i32>, <4 x i32>, i1 immarg, i32 immarg, i32 immarg) #0
declare <4 x float> @llvm.amdgcn.image.gather4.l.o.2d.v4f32.f16(i32 immarg, i32, half, half, half, <8 x i32>, <4 x i32>, i1 immarg, i32 immarg, i32 immarg) #0
declare <4 x float> @llvm.amdgcn.image.gather4.c.l.o.2d.v4f32.f16(i32 immarg, i32, float, half, half, half, <8 x i32>, <4 x i32>, i1 immarg, i32 immarg, i32 immarg) #0

attributes #0 = { nounwind readonly }
