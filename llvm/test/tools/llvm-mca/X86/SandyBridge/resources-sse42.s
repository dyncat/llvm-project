# NOTE: Assertions have been autogenerated by utils/update_mca_test_checks.py
# RUN: llvm-mca -mtriple=x86_64-unknown-unknown -mcpu=sandybridge -instruction-tables < %s | FileCheck %s

crc32b      %al, %ecx
crc32b      (%rax), %ecx

crc32l      %eax, %ecx
crc32l      (%rax), %ecx

crc32w      %ax, %ecx
crc32w      (%rax), %ecx

crc32b      %al, %rcx
crc32b      (%rax), %rcx

crc32q      %rax, %rcx
crc32q      (%rax), %rcx

pcmpestri   $1, %xmm0, %xmm2
pcmpestri   $1, (%rax), %xmm2

pcmpestrm   $1, %xmm0, %xmm2
pcmpestrm   $1, (%rax), %xmm2

pcmpistri   $1, %xmm0, %xmm2
pcmpistri   $1, (%rax), %xmm2

pcmpistrm   $1, %xmm0, %xmm2
pcmpistrm   $1, (%rax), %xmm2

pcmpgtq     %xmm0, %xmm2
pcmpgtq     (%rax), %xmm2

# CHECK:      Instruction Info:
# CHECK-NEXT: [1]: #uOps
# CHECK-NEXT: [2]: Latency
# CHECK-NEXT: [3]: RThroughput
# CHECK-NEXT: [4]: MayLoad
# CHECK-NEXT: [5]: MayStore
# CHECK-NEXT: [6]: HasSideEffects (U)

# CHECK:      [1]    [2]    [3]    [4]    [5]    [6]    Instructions:
# CHECK-NEXT:  1      3     1.00                        crc32b	%al, %ecx
# CHECK-NEXT:  2      8     1.00    *                   crc32b	(%rax), %ecx
# CHECK-NEXT:  1      3     1.00                        crc32l	%eax, %ecx
# CHECK-NEXT:  2      8     1.00    *                   crc32l	(%rax), %ecx
# CHECK-NEXT:  1      3     1.00                        crc32w	%ax, %ecx
# CHECK-NEXT:  2      8     1.00    *                   crc32w	(%rax), %ecx
# CHECK-NEXT:  1      3     1.00                        crc32b	%al, %rcx
# CHECK-NEXT:  2      8     1.00    *                   crc32b	(%rax), %rcx
# CHECK-NEXT:  1      3     1.00                        crc32q	%rax, %rcx
# CHECK-NEXT:  2      8     1.00    *                   crc32q	(%rax), %rcx
# CHECK-NEXT:  1      4     2.67                        pcmpestri	$1, %xmm0, %xmm2
# CHECK-NEXT:  1      10    2.33    *                   pcmpestri	$1, (%rax), %xmm2
# CHECK-NEXT:  1      11    2.67                        pcmpestrm	$1, %xmm0, %xmm2
# CHECK-NEXT:  1      17    2.33    *                   pcmpestrm	$1, (%rax), %xmm2
# CHECK-NEXT:  3      11    3.00                        pcmpistri	$1, %xmm0, %xmm2
# CHECK-NEXT:  4      17    3.00    *                   pcmpistri	$1, (%rax), %xmm2
# CHECK-NEXT:  3      11    3.00                        pcmpistrm	$1, %xmm0, %xmm2
# CHECK-NEXT:  4      17    3.00    *                   pcmpistrm	$1, (%rax), %xmm2
# CHECK-NEXT:  1      5     1.00                        pcmpgtq	%xmm0, %xmm2
# CHECK-NEXT:  2      11    1.00    *                   pcmpgtq	(%rax), %xmm2

# CHECK:      Resources:
# CHECK-NEXT: [0]   - SBDivider
# CHECK-NEXT: [1]   - SBFPDivider
# CHECK-NEXT: [2]   - SBPort0
# CHECK-NEXT: [3]   - SBPort1
# CHECK-NEXT: [4]   - SBPort4
# CHECK-NEXT: [5]   - SBPort5
# CHECK-NEXT: [6.0] - SBPort23
# CHECK-NEXT: [6.1] - SBPort23

# CHECK:      Resource pressure per iteration:
# CHECK-NEXT: [0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]
# CHECK-NEXT:  -      -     24.00  20.00   -     10.00  5.00   5.00

# CHECK:      Resource pressure by instruction:
# CHECK-NEXT: [0]    [1]    [2]    [3]    [4]    [5]    [6.0]  [6.1]  Instructions:
# CHECK-NEXT:  -      -      -     1.00    -      -      -      -     crc32b	%al, %ecx
# CHECK-NEXT:  -      -      -     1.00    -      -     0.50   0.50   crc32b	(%rax), %ecx
# CHECK-NEXT:  -      -      -     1.00    -      -      -      -     crc32l	%eax, %ecx
# CHECK-NEXT:  -      -      -     1.00    -      -     0.50   0.50   crc32l	(%rax), %ecx
# CHECK-NEXT:  -      -      -     1.00    -      -      -      -     crc32w	%ax, %ecx
# CHECK-NEXT:  -      -      -     1.00    -      -     0.50   0.50   crc32w	(%rax), %ecx
# CHECK-NEXT:  -      -      -     1.00    -      -      -      -     crc32b	%al, %rcx
# CHECK-NEXT:  -      -      -     1.00    -      -     0.50   0.50   crc32b	(%rax), %rcx
# CHECK-NEXT:  -      -      -     1.00    -      -      -      -     crc32q	%rax, %rcx
# CHECK-NEXT:  -      -      -     1.00    -      -     0.50   0.50   crc32q	(%rax), %rcx
# CHECK-NEXT:  -      -     2.67   2.67    -     2.67    -      -     pcmpestri	$1, %xmm0, %xmm2
# CHECK-NEXT:  -      -     2.33   2.33    -     2.33   0.50   0.50   pcmpestri	$1, (%rax), %xmm2
# CHECK-NEXT:  -      -     2.67   2.67    -     2.67    -      -     pcmpestrm	$1, %xmm0, %xmm2
# CHECK-NEXT:  -      -     2.33   2.33    -     2.33   0.50   0.50   pcmpestrm	$1, (%rax), %xmm2
# CHECK-NEXT:  -      -     3.00    -      -      -      -      -     pcmpistri	$1, %xmm0, %xmm2
# CHECK-NEXT:  -      -     3.00    -      -      -     0.50   0.50   pcmpistri	$1, (%rax), %xmm2
# CHECK-NEXT:  -      -     3.00    -      -      -      -      -     pcmpistrm	$1, %xmm0, %xmm2
# CHECK-NEXT:  -      -     3.00    -      -      -     0.50   0.50   pcmpistrm	$1, (%rax), %xmm2
# CHECK-NEXT:  -      -     1.00    -      -      -      -      -     pcmpgtq	%xmm0, %xmm2
# CHECK-NEXT:  -      -     1.00    -      -      -     0.50   0.50   pcmpgtq	(%rax), %xmm2
