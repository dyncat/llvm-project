; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; Test the basic functionality of speculating around PHI nodes based on reduced
; cost of the constant operands to the PHI nodes using the x86 cost model.
;
; REQUIRES: x86-registered-target
; RUN: opt -S -passes=spec-phis < %s | FileCheck %s

target triple = "x86_64-unknown-unknown"

define i32 @test_basic(i1 %flag, i32 %arg) {
; CHECK-LABEL: @test_basic(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    br i1 [[FLAG:%.*]], label [[A:%.*]], label [[B:%.*]]
; CHECK:       a:
; CHECK-NEXT:    [[SUM_0:%.*]] = add i32 [[ARG:%.*]], 7
; CHECK-NEXT:    br label [[EXIT:%.*]]
; CHECK:       b:
; CHECK-NEXT:    [[SUM_1:%.*]] = add i32 [[ARG]], 11
; CHECK-NEXT:    br label [[EXIT]]
; CHECK:       exit:
; CHECK-NEXT:    [[SUM_PHI:%.*]] = phi i32 [ [[SUM_0]], [[A]] ], [ [[SUM_1]], [[B]] ]
; CHECK-NEXT:    ret i32 [[SUM_PHI]]
;
entry:
  br i1 %flag, label %a, label %b

a:
  br label %exit

b:
  br label %exit

exit:
  %p = phi i32 [ 7, %a ], [ 11, %b ]
  %sum = add i32 %arg, %p
  ret i32 %sum
}

; Check that we handle commuted operands and get the constant onto the RHS.
define i32 @test_commuted(i1 %flag, i32 %arg) {
; CHECK-LABEL: @test_commuted(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    br i1 [[FLAG:%.*]], label [[A:%.*]], label [[B:%.*]]
; CHECK:       a:
; CHECK-NEXT:    [[SUM_0:%.*]] = add i32 [[ARG:%.*]], 7
; CHECK-NEXT:    br label [[EXIT:%.*]]
; CHECK:       b:
; CHECK-NEXT:    [[SUM_1:%.*]] = add i32 [[ARG]], 11
; CHECK-NEXT:    br label [[EXIT]]
; CHECK:       exit:
; CHECK-NEXT:    [[SUM_PHI:%.*]] = phi i32 [ [[SUM_0]], [[A]] ], [ [[SUM_1]], [[B]] ]
; CHECK-NEXT:    ret i32 [[SUM_PHI]]
;
entry:
  br i1 %flag, label %a, label %b

a:
  br label %exit

b:
  br label %exit

exit:
  %p = phi i32 [ 7, %a ], [ 11, %b ]
  %sum = add i32 %p, %arg
  ret i32 %sum
}

define i32 @test_split_crit_edge(i1 %flag, i32 %arg) {
; CHECK-LABEL: @test_split_crit_edge(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    br i1 [[FLAG:%.*]], label [[ENTRY_EXIT_CRIT_EDGE:%.*]], label [[A:%.*]]
; CHECK:       entry.exit_crit_edge:
; CHECK-NEXT:    [[SUM_0:%.*]] = add i32 [[ARG:%.*]], 7
; CHECK-NEXT:    br label [[EXIT:%.*]]
; CHECK:       a:
; CHECK-NEXT:    [[SUM_1:%.*]] = add i32 [[ARG]], 11
; CHECK-NEXT:    br label [[EXIT]]
; CHECK:       exit:
; CHECK-NEXT:    [[SUM_PHI:%.*]] = phi i32 [ [[SUM_0]], [[ENTRY_EXIT_CRIT_EDGE]] ], [ [[SUM_1]], [[A]] ]
; CHECK-NEXT:    ret i32 [[SUM_PHI]]
;
entry:
  br i1 %flag, label %exit, label %a

a:
  br label %exit

exit:
  %p = phi i32 [ 7, %entry ], [ 11, %a ]
  %sum = add i32 %arg, %p
  ret i32 %sum
}

define i32 @test_no_spec_dominating_inst(i1 %flag, i32* %ptr) {
; CHECK-LABEL: @test_no_spec_dominating_inst(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[LOAD:%.*]] = load i32, i32* [[PTR:%.*]]
; CHECK-NEXT:    br i1 [[FLAG:%.*]], label [[A:%.*]], label [[B:%.*]]
; CHECK:       a:
; CHECK-NEXT:    [[SUM_0:%.*]] = add i32 [[LOAD]], 7
; CHECK-NEXT:    br label [[EXIT:%.*]]
; CHECK:       b:
; CHECK-NEXT:    [[SUM_1:%.*]] = add i32 [[LOAD]], 11
; CHECK-NEXT:    br label [[EXIT]]
; CHECK:       exit:
; CHECK-NEXT:    [[SUM_PHI:%.*]] = phi i32 [ [[SUM_0]], [[A]] ], [ [[SUM_1]], [[B]] ]
; CHECK-NEXT:    ret i32 [[SUM_PHI]]
;
entry:
  %load = load i32, i32* %ptr
  br i1 %flag, label %a, label %b

a:
  br label %exit

b:
  br label %exit

exit:
  %p = phi i32 [ 7, %a ], [ 11, %b ]
  %sum = add i32 %load, %p
  ret i32 %sum
}

; We have special logic handling PHI nodes, make sure it doesn't get confused
; by a dominating PHI.
define i32 @test_no_spec_dominating_phi(i1 %flag1, i1 %flag2, i32 %x, i32 %y) {
; CHECK-LABEL: @test_no_spec_dominating_phi(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    br i1 [[FLAG1:%.*]], label [[X_BLOCK:%.*]], label [[Y_BLOCK:%.*]]
; CHECK:       x.block:
; CHECK-NEXT:    br label [[MERGE:%.*]]
; CHECK:       y.block:
; CHECK-NEXT:    br label [[MERGE]]
; CHECK:       merge:
; CHECK-NEXT:    [[XY_PHI:%.*]] = phi i32 [ [[X:%.*]], [[X_BLOCK]] ], [ [[Y:%.*]], [[Y_BLOCK]] ]
; CHECK-NEXT:    br i1 [[FLAG2:%.*]], label [[A:%.*]], label [[B:%.*]]
; CHECK:       a:
; CHECK-NEXT:    [[SUM_0:%.*]] = add i32 [[XY_PHI]], 7
; CHECK-NEXT:    br label [[EXIT:%.*]]
; CHECK:       b:
; CHECK-NEXT:    [[SUM_1:%.*]] = add i32 [[XY_PHI]], 11
; CHECK-NEXT:    br label [[EXIT]]
; CHECK:       exit:
; CHECK-NEXT:    [[SUM_PHI:%.*]] = phi i32 [ [[SUM_0]], [[A]] ], [ [[SUM_1]], [[B]] ]
; CHECK-NEXT:    ret i32 [[SUM_PHI]]
;
entry:
  br i1 %flag1, label %x.block, label %y.block

x.block:
  br label %merge

y.block:
  br label %merge

merge:
  %xy.phi = phi i32 [ %x, %x.block ], [ %y, %y.block ]
  br i1 %flag2, label %a, label %b

a:
  br label %exit

b:
  br label %exit

exit:
  %p = phi i32 [ 7, %a ], [ 11, %b ]
  %sum = add i32 %xy.phi, %p
  ret i32 %sum
}

; Ensure that we will speculate some number of "free" instructions on the given
; architecture even though they are unrelated to the PHI itself.
define i32 @test_speculate_free_insts(i1 %flag, i64 %arg) {
; CHECK-LABEL: @test_speculate_free_insts(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    br i1 [[FLAG:%.*]], label [[A:%.*]], label [[B:%.*]]
; CHECK:       a:
; CHECK-NEXT:    [[T1_0:%.*]] = trunc i64 [[ARG:%.*]] to i48
; CHECK-NEXT:    [[T2_0:%.*]] = trunc i48 [[T1_0]] to i32
; CHECK-NEXT:    [[SUM_0:%.*]] = add i32 [[T2_0]], 7
; CHECK-NEXT:    br label [[EXIT:%.*]]
; CHECK:       b:
; CHECK-NEXT:    [[T1_1:%.*]] = trunc i64 [[ARG]] to i48
; CHECK-NEXT:    [[T2_1:%.*]] = trunc i48 [[T1_1]] to i32
; CHECK-NEXT:    [[SUM_1:%.*]] = add i32 [[T2_1]], 11
; CHECK-NEXT:    br label [[EXIT]]
; CHECK:       exit:
; CHECK-NEXT:    [[SUM_PHI:%.*]] = phi i32 [ [[SUM_0]], [[A]] ], [ [[SUM_1]], [[B]] ]
; CHECK-NEXT:    ret i32 [[SUM_PHI]]
;
entry:
  br i1 %flag, label %a, label %b

a:
  br label %exit

b:
  br label %exit

exit:
  %p = phi i32 [ 7, %a ], [ 11, %b ]
  %t1 = trunc i64 %arg to i48
  %t2 = trunc i48 %t1 to i32
  %sum = add i32 %t2, %p
  ret i32 %sum
}

define i32 @test_speculate_free_phis(i1 %flag, i32 %arg1, i32 %arg2) {
; CHECK-LABEL: @test_speculate_free_phis(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    br i1 [[FLAG:%.*]], label [[A:%.*]], label [[B:%.*]]
; CHECK:       a:
; CHECK-NEXT:    [[SUM_0:%.*]] = add i32 [[ARG1:%.*]], 7
; CHECK-NEXT:    br label [[EXIT:%.*]]
; CHECK:       b:
; CHECK-NEXT:    [[SUM_1:%.*]] = add i32 [[ARG2:%.*]], 11
; CHECK-NEXT:    br label [[EXIT]]
; CHECK:       exit:
; CHECK-NEXT:    [[SUM_PHI:%.*]] = phi i32 [ [[SUM_0]], [[A]] ], [ [[SUM_1]], [[B]] ]
; CHECK-NEXT:    [[P2:%.*]] = phi i32 [ [[ARG1]], [[A]] ], [ [[ARG2]], [[B]] ]
; CHECK-NEXT:    ret i32 [[SUM_PHI]]
;
entry:
  br i1 %flag, label %a, label %b

a:
  br label %exit

b:
  br label %exit

; We don't DCE the now unused PHI node...
exit:
  %p1 = phi i32 [ 7, %a ], [ 11, %b ]
  %p2 = phi i32 [ %arg1, %a ], [ %arg2, %b ]
  %sum = add i32 %p2, %p1
  ret i32 %sum
}

; We shouldn't speculate multiple uses even if each individually looks
; profitable because of the total cost.
define i32 @test_no_spec_multi_uses(i1 %flag, i32 %arg1, i32 %arg2, i32 %arg3) {
; CHECK-LABEL: @test_no_spec_multi_uses(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    br i1 [[FLAG:%.*]], label [[A:%.*]], label [[B:%.*]]
; CHECK:       a:
; CHECK-NEXT:    br label [[EXIT:%.*]]
; CHECK:       b:
; CHECK-NEXT:    br label [[EXIT]]
; CHECK:       exit:
; CHECK-NEXT:    [[P:%.*]] = phi i32 [ 7, [[A]] ], [ 11, [[B]] ]
; CHECK-NEXT:    [[ADD1:%.*]] = add i32 [[ARG1:%.*]], [[P]]
; CHECK-NEXT:    [[ADD2:%.*]] = add i32 [[ARG2:%.*]], [[P]]
; CHECK-NEXT:    [[ADD3:%.*]] = add i32 [[ARG3:%.*]], [[P]]
; CHECK-NEXT:    [[SUM1:%.*]] = add i32 [[ADD1]], [[ADD2]]
; CHECK-NEXT:    [[SUM2:%.*]] = add i32 [[SUM1]], [[ADD3]]
; CHECK-NEXT:    ret i32 [[SUM2]]
;
entry:
  br i1 %flag, label %a, label %b

a:
  br label %exit

b:
  br label %exit

exit:
  %p = phi i32 [ 7, %a ], [ 11, %b ]
  %add1 = add i32 %arg1, %p
  %add2 = add i32 %arg2, %p
  %add3 = add i32 %arg3, %p
  %sum1 = add i32 %add1, %add2
  %sum2 = add i32 %sum1, %add3
  ret i32 %sum2
}

define i32 @test_multi_phis1(i1 %flag, i32 %arg) {
; CHECK-LABEL: @test_multi_phis1(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    br i1 [[FLAG:%.*]], label [[A:%.*]], label [[B:%.*]]
; CHECK:       a:
; CHECK-NEXT:    [[SUM1_0:%.*]] = add i32 [[ARG:%.*]], 1
; CHECK-NEXT:    [[SUM2_0:%.*]] = add i32 [[SUM1_0]], 3
; CHECK-NEXT:    [[SUM3_0:%.*]] = add i32 [[SUM2_0]], 5
; CHECK-NEXT:    br label [[EXIT:%.*]]
; CHECK:       b:
; CHECK-NEXT:    [[SUM1_1:%.*]] = add i32 [[ARG]], 2
; CHECK-NEXT:    [[SUM2_1:%.*]] = add i32 [[SUM1_1]], 4
; CHECK-NEXT:    [[SUM3_1:%.*]] = add i32 [[SUM2_1]], 6
; CHECK-NEXT:    br label [[EXIT]]
; CHECK:       exit:
; CHECK-NEXT:    [[SUM3_PHI:%.*]] = phi i32 [ [[SUM3_0]], [[A]] ], [ [[SUM3_1]], [[B]] ]
; CHECK-NEXT:    ret i32 [[SUM3_PHI]]
;
entry:
  br i1 %flag, label %a, label %b

a:
  br label %exit

b:
  br label %exit

exit:
  %p1 = phi i32 [ 1, %a ], [ 2, %b ]
  %p2 = phi i32 [ 3, %a ], [ 4, %b ]
  %p3 = phi i32 [ 5, %a ], [ 6, %b ]
  %sum1 = add i32 %arg, %p1
  %sum2 = add i32 %sum1, %p2
  %sum3 = add i32 %sum2, %p3
  ret i32 %sum3
}

; Check that the order of the PHIs doesn't impact the behavior.
define i32 @test_multi_phis2(i1 %flag, i32 %arg) {
; CHECK-LABEL: @test_multi_phis2(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    br i1 [[FLAG:%.*]], label [[A:%.*]], label [[B:%.*]]
; CHECK:       a:
; CHECK-NEXT:    [[SUM1_0:%.*]] = add i32 [[ARG:%.*]], 1
; CHECK-NEXT:    [[SUM2_0:%.*]] = add i32 [[SUM1_0]], 3
; CHECK-NEXT:    [[SUM3_0:%.*]] = add i32 [[SUM2_0]], 5
; CHECK-NEXT:    br label [[EXIT:%.*]]
; CHECK:       b:
; CHECK-NEXT:    [[SUM1_1:%.*]] = add i32 [[ARG]], 2
; CHECK-NEXT:    [[SUM2_1:%.*]] = add i32 [[SUM1_1]], 4
; CHECK-NEXT:    [[SUM3_1:%.*]] = add i32 [[SUM2_1]], 6
; CHECK-NEXT:    br label [[EXIT]]
; CHECK:       exit:
; CHECK-NEXT:    [[SUM3_PHI:%.*]] = phi i32 [ [[SUM3_0]], [[A]] ], [ [[SUM3_1]], [[B]] ]
; CHECK-NEXT:    ret i32 [[SUM3_PHI]]
;
entry:
  br i1 %flag, label %a, label %b

a:
  br label %exit

b:
  br label %exit

exit:
  %p3 = phi i32 [ 5, %a ], [ 6, %b ]
  %p2 = phi i32 [ 3, %a ], [ 4, %b ]
  %p1 = phi i32 [ 1, %a ], [ 2, %b ]
  %sum1 = add i32 %arg, %p1
  %sum2 = add i32 %sum1, %p2
  %sum3 = add i32 %sum2, %p3
  ret i32 %sum3
}

define i32 @test_no_spec_indirectbr(i1 %flag, i32 %arg) {
; CHECK-LABEL: @test_no_spec_indirectbr(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    br i1 [[FLAG:%.*]], label [[A:%.*]], label [[B:%.*]]
; CHECK:       a:
; CHECK-NEXT:    indirectbr i8* undef, [label %exit]
; CHECK:       b:
; CHECK-NEXT:    indirectbr i8* undef, [label %exit]
; CHECK:       exit:
; CHECK-NEXT:    [[P:%.*]] = phi i32 [ 7, [[A]] ], [ 11, [[B]] ]
; CHECK-NEXT:    [[SUM:%.*]] = add i32 [[ARG:%.*]], [[P]]
; CHECK-NEXT:    ret i32 [[SUM]]
;
entry:
  br i1 %flag, label %a, label %b

a:
  indirectbr i8* undef, [label %exit]

b:
  indirectbr i8* undef, [label %exit]

exit:
  %p = phi i32 [ 7, %a ], [ 11, %b ]
  %sum = add i32 %arg, %p
  ret i32 %sum
}

declare void @g()

declare i32 @__gxx_personality_v0(...)

; FIXME: We should be able to handle this case -- only the exceptional edge is
; impossible to split.
define i32 @test_no_spec_invoke_continue(i1 %flag, i32 %arg) personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
; CHECK-LABEL: @test_no_spec_invoke_continue(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    br i1 [[FLAG:%.*]], label [[A:%.*]], label [[B:%.*]]
; CHECK:       a:
; CHECK-NEXT:    invoke void @g()
; CHECK-NEXT:    to label [[EXIT:%.*]] unwind label [[LPAD:%.*]]
; CHECK:       b:
; CHECK-NEXT:    invoke void @g()
; CHECK-NEXT:    to label [[EXIT]] unwind label [[LPAD]]
; CHECK:       exit:
; CHECK-NEXT:    [[P:%.*]] = phi i32 [ 7, [[A]] ], [ 11, [[B]] ]
; CHECK-NEXT:    [[SUM:%.*]] = add i32 [[ARG:%.*]], [[P]]
; CHECK-NEXT:    ret i32 [[SUM]]
; CHECK:       lpad:
; CHECK-NEXT:    [[LP:%.*]] = landingpad { i8*, i32 }
; CHECK-NEXT:    cleanup
; CHECK-NEXT:    resume { i8*, i32 } undef
;
entry:
  br i1 %flag, label %a, label %b

a:
  invoke void @g()
  to label %exit unwind label %lpad

b:
  invoke void @g()
  to label %exit unwind label %lpad

exit:
  %p = phi i32 [ 7, %a ], [ 11, %b ]
  %sum = add i32 %arg, %p
  ret i32 %sum

lpad:
  %lp = landingpad { i8*, i32 }
  cleanup
  resume { i8*, i32 } undef
}

define i32 @test_no_spec_landingpad(i32 %arg, i32* %ptr) personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
; CHECK-LABEL: @test_no_spec_landingpad(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    invoke void @g()
; CHECK-NEXT:    to label [[INVOKE_CONT:%.*]] unwind label [[LPAD:%.*]]
; CHECK:       invoke.cont:
; CHECK-NEXT:    invoke void @g()
; CHECK-NEXT:    to label [[EXIT:%.*]] unwind label [[LPAD]]
; CHECK:       lpad:
; CHECK-NEXT:    [[P:%.*]] = phi i32 [ 7, [[ENTRY:%.*]] ], [ 11, [[INVOKE_CONT]] ]
; CHECK-NEXT:    [[LP:%.*]] = landingpad { i8*, i32 }
; CHECK-NEXT:    cleanup
; CHECK-NEXT:    [[SUM:%.*]] = add i32 [[ARG:%.*]], [[P]]
; CHECK-NEXT:    store i32 [[SUM]], i32* [[PTR:%.*]]
; CHECK-NEXT:    resume { i8*, i32 } undef
; CHECK:       exit:
; CHECK-NEXT:    ret i32 0
;
entry:
  invoke void @g()
  to label %invoke.cont unwind label %lpad

invoke.cont:
  invoke void @g()
  to label %exit unwind label %lpad

lpad:
  %p = phi i32 [ 7, %entry ], [ 11, %invoke.cont ]
  %lp = landingpad { i8*, i32 }
  cleanup
  %sum = add i32 %arg, %p
  store i32 %sum, i32* %ptr
  resume { i8*, i32 } undef

exit:
  ret i32 0
}

declare i32 @__CxxFrameHandler3(...)

define i32 @test_no_spec_cleanuppad(i32 %arg, i32* %ptr) personality i32 (...)* @__CxxFrameHandler3 {
; CHECK-LABEL: @test_no_spec_cleanuppad(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    invoke void @g()
; CHECK-NEXT:    to label [[INVOKE_CONT:%.*]] unwind label [[LPAD:%.*]]
; CHECK:       invoke.cont:
; CHECK-NEXT:    invoke void @g()
; CHECK-NEXT:    to label [[EXIT:%.*]] unwind label [[LPAD]]
; CHECK:       lpad:
; CHECK-NEXT:    [[P:%.*]] = phi i32 [ 7, [[ENTRY:%.*]] ], [ 11, [[INVOKE_CONT]] ]
; CHECK-NEXT:    [[CP:%.*]] = cleanuppad within none []
; CHECK-NEXT:    [[SUM:%.*]] = add i32 [[ARG:%.*]], [[P]]
; CHECK-NEXT:    store i32 [[SUM]], i32* [[PTR:%.*]]
; CHECK-NEXT:    cleanupret from [[CP]] unwind to caller
; CHECK:       exit:
; CHECK-NEXT:    ret i32 0
;
entry:
  invoke void @g()
  to label %invoke.cont unwind label %lpad

invoke.cont:
  invoke void @g()
  to label %exit unwind label %lpad

lpad:
  %p = phi i32 [ 7, %entry ], [ 11, %invoke.cont ]
  %cp = cleanuppad within none []
  %sum = add i32 %arg, %p
  store i32 %sum, i32* %ptr
  cleanupret from %cp unwind to caller

exit:
  ret i32 0
}

; Check that we don't fall over when confronted with seemingly reasonable code
; for us to handle but in an unreachable region and with non-PHI use-def
; cycles.
define i32 @test_unreachable_non_phi_cycles(i1 %flag, i32 %arg) {
; CHECK-LABEL: @test_unreachable_non_phi_cycles(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    ret i32 42
; CHECK:       a:
; CHECK-NEXT:    br label [[EXIT:%.*]]
; CHECK:       b:
; CHECK-NEXT:    br label [[EXIT]]
; CHECK:       exit:
; CHECK-NEXT:    [[P:%.*]] = phi i32 [ 7, [[A:%.*]] ], [ 11, [[B:%.*]] ]
; CHECK-NEXT:    [[ZEXT:%.*]] = zext i32 [[SUM:%.*]] to i64
; CHECK-NEXT:    [[TRUNC:%.*]] = trunc i64 [[ZEXT]] to i32
; CHECK-NEXT:    [[SUM]] = add i32 [[TRUNC]], [[P]]
; CHECK-NEXT:    br i1 [[FLAG:%.*]], label [[A]], label [[B]]
;
entry:
  ret i32 42

a:
  br label %exit

b:
  br label %exit

exit:
  %p = phi i32 [ 7, %a ], [ 11, %b ]
  %zext = zext i32 %sum to i64
  %trunc = trunc i64 %zext to i32
  %sum = add i32 %trunc, %p
  br i1 %flag, label %a, label %b
}

; Check that we don't speculate in the face of an expensive immediate. There
; are two reasons this should never speculate. First, even a local analysis
; should fail because it makes some paths (%a) potentially more expensive due
; to multiple uses of the immediate. Additionally, when we go to speculate the
; instructions, their cost will also be too high.
; FIXME: The goal is really to test the first property, but there doesn't
; happen to be any way to use free-to-speculate instructions here so that it
; would be the only interesting property.
define i64 @test_expensive_imm(i32 %flag, i64 %arg) {
; CHECK-LABEL: @test_expensive_imm(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    switch i32 [[FLAG:%.*]], label [[A:%.*]] [
; CHECK-NEXT:    i32 1, label [[B:%.*]]
; CHECK-NEXT:    i32 2, label [[C:%.*]]
; CHECK-NEXT:    i32 3, label [[D:%.*]]
; CHECK-NEXT:    ]
; CHECK:       a:
; CHECK-NEXT:    br label [[EXIT:%.*]]
; CHECK:       b:
; CHECK-NEXT:    br label [[EXIT]]
; CHECK:       c:
; CHECK-NEXT:    br label [[EXIT]]
; CHECK:       d:
; CHECK-NEXT:    br label [[EXIT]]
; CHECK:       exit:
; CHECK-NEXT:    [[P:%.*]] = phi i64 [ 4294967296, [[A]] ], [ 1, [[B]] ], [ 1, [[C]] ], [ 1, [[D]] ]
; CHECK-NEXT:    [[SUM1:%.*]] = add i64 [[ARG:%.*]], [[P]]
; CHECK-NEXT:    [[SUM2:%.*]] = add i64 [[SUM1]], [[P]]
; CHECK-NEXT:    ret i64 [[SUM2]]
;
entry:
  switch i32 %flag, label %a [
  i32 1, label %b
  i32 2, label %c
  i32 3, label %d
  ]

a:
  br label %exit

b:
  br label %exit

c:
  br label %exit

d:
  br label %exit

exit:
  %p = phi i64 [ 4294967296, %a ], [ 1, %b ], [ 1, %c ], [ 1, %d ]
  %sum1 = add i64 %arg, %p
  %sum2 = add i64 %sum1, %p
  ret i64 %sum2
}

define i32 @test_no_spec_non_postdominating_uses(i1 %flag1, i1 %flag2, i32 %arg) {
; CHECK-LABEL: @test_no_spec_non_postdominating_uses(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    br i1 [[FLAG1:%.*]], label [[A:%.*]], label [[B:%.*]]
; CHECK:       a:
; CHECK-NEXT:    [[SUM1_0:%.*]] = add i32 [[ARG:%.*]], 7
; CHECK-NEXT:    br label [[MERGE:%.*]]
; CHECK:       b:
; CHECK-NEXT:    [[SUM1_1:%.*]] = add i32 [[ARG]], 11
; CHECK-NEXT:    br label [[MERGE]]
; CHECK:       merge:
; CHECK-NEXT:    [[SUM1_PHI:%.*]] = phi i32 [ [[SUM1_0]], [[A]] ], [ [[SUM1_1]], [[B]] ]
; CHECK-NEXT:    [[P2:%.*]] = phi i32 [ 13, [[A]] ], [ 42, [[B]] ]
; CHECK-NEXT:    br i1 [[FLAG2:%.*]], label [[EXIT1:%.*]], label [[EXIT2:%.*]]
; CHECK:       exit1:
; CHECK-NEXT:    ret i32 [[SUM1_PHI]]
; CHECK:       exit2:
; CHECK-NEXT:    [[SUM2:%.*]] = add i32 [[ARG]], [[P2]]
; CHECK-NEXT:    ret i32 [[SUM2]]
;
entry:
  br i1 %flag1, label %a, label %b

a:
  br label %merge

b:
  br label %merge

merge:
  %p1 = phi i32 [ 7, %a ], [ 11, %b ]
  %p2 = phi i32 [ 13, %a ], [ 42, %b ]
  %sum1 = add i32 %arg, %p1
  br i1 %flag2, label %exit1, label %exit2

exit1:
  ret i32 %sum1

exit2:
  %sum2 = add i32 %arg, %p2
  ret i32 %sum2
}
