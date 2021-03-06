; NOTE: Assertions have been autogenerated by utils/update_test_checks.py UTC_ARGS: --function-signature --scrub-attributes
; RUN: opt -attributor -attributor-manifest-internal  -attributor-max-iterations-verify -attributor-annotate-decl-cs -attributor-max-iterations=4 -S < %s | FileCheck %s --check-prefixes=CHECK,NOT_CGSCC_NPM,NOT_CGSCC_OPM,NOT_TUNIT_NPM,IS__TUNIT____,IS________OPM,IS__TUNIT_OPM
; RUN: opt -aa-pipeline=basic-aa -passes=attributor -attributor-manifest-internal  -attributor-max-iterations-verify -attributor-annotate-decl-cs -attributor-max-iterations=4 -S < %s | FileCheck %s --check-prefixes=CHECK,NOT_CGSCC_OPM,NOT_CGSCC_NPM,NOT_TUNIT_OPM,IS__TUNIT____,IS________NPM,IS__TUNIT_NPM
; RUN: opt -attributor-cgscc -attributor-manifest-internal  -attributor-annotate-decl-cs -S < %s | FileCheck %s --check-prefixes=CHECK,NOT_TUNIT_NPM,NOT_TUNIT_OPM,NOT_CGSCC_NPM,IS__CGSCC____,IS________OPM,IS__CGSCC_OPM
; RUN: opt -aa-pipeline=basic-aa -passes=attributor-cgscc -attributor-manifest-internal  -attributor-annotate-decl-cs -S < %s | FileCheck %s --check-prefixes=CHECK,NOT_TUNIT_NPM,NOT_TUNIT_OPM,NOT_CGSCC_OPM,IS__CGSCC____,IS________NPM,IS__CGSCC_NPM

@_ZL6test1g = internal global i32 42, align 4

define void @_Z7test1f1v() nounwind {
; CHECK-LABEL: define {{[^@]+}}@_Z7test1f1v()
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[TMP:%.*]] = load i32, i32* @_ZL6test1g, align 4
; CHECK-NEXT:    [[CMP:%.*]] = icmp eq i32 [[TMP]], 0
; CHECK-NEXT:    br i1 [[CMP]], label [[IF_THEN:%.*]], label [[IF_END:%.*]]
; CHECK:       if.then:
; CHECK-NEXT:    store i32 0, i32* @_ZL6test1g, align 4
; CHECK-NEXT:    br label [[IF_END]]
; CHECK:       if.end:
; CHECK-NEXT:    ret void
;
entry:
  %tmp = load i32, i32* @_ZL6test1g, align 4
  %cmp = icmp eq i32 %tmp, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* @_ZL6test1g, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

define i32 @_Z7test1f2v() nounwind {
; CHECK-LABEL: define {{[^@]+}}@_Z7test1f2v()
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[TMP:%.*]] = load i32, i32* @_ZL6test1g, align 4
; CHECK-NEXT:    ret i32 [[TMP]]
;
entry:
  %tmp = load i32, i32* @_ZL6test1g, align 4
  ret i32 %tmp
}
