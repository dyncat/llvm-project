; RUN: llc < %s -asm-verbose=false -disable-wasm-fallthrough-return-opt -wasm-keep-registers | FileCheck %s
; RUN: llc < %s -asm-verbose=false -disable-wasm-fallthrough-return-opt -wasm-keep-registers -fast-isel -fast-isel-abort=1 | FileCheck %s

; Test that basic loads are assembled properly.

target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32-unknown-unknown"

; CHECK-LABEL: ldi32:
; CHECK-NEXT: .functype ldi32 (i32) -> (i32){{$}}
; CHECK-NEXT: local.get $push[[L0:[0-9]+]]=, 0{{$}}
; CHECK-NEXT: i32.load $push[[NUM:[0-9]+]]=, 0($pop[[L0]]){{$}}
; CHECK-NEXT: return $pop[[NUM]]{{$}}
define i32 @ldi32(i32 *%p) {
  %v = load i32, i32* %p
  ret i32 %v
}

; CHECK-LABEL: ldi64:
; CHECK-NEXT: .functype ldi64 (i32) -> (i64){{$}}
; CHECK-NEXT: local.get $push[[L0:[0-9]+]]=, 0{{$}}
; CHECK-NEXT: i64.load $push[[NUM:[0-9]+]]=, 0($pop[[L0]]){{$}}
; CHECK-NEXT: return $pop[[NUM]]{{$}}
define i64 @ldi64(i64 *%p) {
  %v = load i64, i64* %p
  ret i64 %v
}

; CHECK-LABEL: ldf32:
; CHECK-NEXT: .functype ldf32 (i32) -> (f32){{$}}
; CHECK-NEXT: local.get $push[[L0:[0-9]+]]=, 0{{$}}
; CHECK-NEXT: f32.load $push[[NUM:[0-9]+]]=, 0($pop[[L0]]){{$}}
; CHECK-NEXT: return $pop[[NUM]]{{$}}
define float @ldf32(float *%p) {
  %v = load float, float* %p
  ret float %v
}

; CHECK-LABEL: ldf64:
; CHECK-NEXT: .functype ldf64 (i32) -> (f64){{$}}
; CHECK-NEXT: local.get $push[[L0:[0-9]+]]=, 0{{$}}
; CHECK-NEXT: f64.load $push[[NUM:[0-9]+]]=, 0($pop[[L0]]){{$}}
; CHECK-NEXT: return $pop[[NUM]]{{$}}
define double @ldf64(double *%p) {
  %v = load double, double* %p
  ret double %v
}
