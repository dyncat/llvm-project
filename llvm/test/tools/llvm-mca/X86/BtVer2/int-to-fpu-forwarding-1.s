# NOTE: Assertions have been autogenerated by utils/update_mca_test_checks.py
# RUN: llvm-mca -mtriple=x86_64-unknown-unknown -mcpu=btver2 -iterations=500 < %s | FileCheck %s

# Throughput for all the code snippet below should be 1.00 IPC.

# LLVM-MCA-BEGIN
vpinsrb $0, %eax, %xmm0, %xmm0
vpinsrb $1, %eax, %xmm0, %xmm0
# LLVM-MCA-END

# LLVM-MCA-BEGIN
vpinsrw $0, %eax, %xmm0, %xmm0
vpinsrw $1, %eax, %xmm0, %xmm0
# LLVM-MCA-END

# LLVM-MCA-BEGIN
vpinsrd $0, %eax, %xmm0, %xmm0
vpinsrd $1, %eax, %xmm0, %xmm0
# LLVM-MCA-END

# LLVM-MCA-BEGIN
vpinsrq $0, %rax, %xmm0, %xmm0
vpinsrq $1, %rax, %xmm0, %xmm0
# LLVM-MCA-END

# CHECK:      [0] Code Region

# CHECK:      Iterations:        500
# CHECK-NEXT: Instructions:      1000
# CHECK-NEXT: Total Cycles:      1003
# CHECK-NEXT: Total uOps:        2000

# CHECK:      Dispatch Width:    2
# CHECK-NEXT: uOps Per Cycle:    1.99
# CHECK-NEXT: IPC:               1.00
# CHECK-NEXT: Block RThroughput: 2.0

# CHECK:      Instruction Info:
# CHECK-NEXT: [1]: #uOps
# CHECK-NEXT: [2]: Latency
# CHECK-NEXT: [3]: RThroughput
# CHECK-NEXT: [4]: MayLoad
# CHECK-NEXT: [5]: MayStore
# CHECK-NEXT: [6]: HasSideEffects (U)

# CHECK:      [1]    [2]    [3]    [4]    [5]    [6]    Instructions:
# CHECK-NEXT:  2      7     0.50                        vpinsrb	$0, %eax, %xmm0, %xmm0
# CHECK-NEXT:  2      7     0.50                        vpinsrb	$1, %eax, %xmm0, %xmm0

# CHECK:      Resources:
# CHECK-NEXT: [0]   - JALU0
# CHECK-NEXT: [1]   - JALU1
# CHECK-NEXT: [2]   - JDiv
# CHECK-NEXT: [3]   - JFPA
# CHECK-NEXT: [4]   - JFPM
# CHECK-NEXT: [5]   - JFPU0
# CHECK-NEXT: [6]   - JFPU1
# CHECK-NEXT: [7]   - JLAGU
# CHECK-NEXT: [8]   - JMul
# CHECK-NEXT: [9]   - JSAGU
# CHECK-NEXT: [10]  - JSTC
# CHECK-NEXT: [11]  - JVALU0
# CHECK-NEXT: [12]  - JVALU1
# CHECK-NEXT: [13]  - JVIMUL

# CHECK:      Resource pressure per iteration:
# CHECK-NEXT: [0]    [1]    [2]    [3]    [4]    [5]    [6]    [7]    [8]    [9]    [10]   [11]   [12]   [13]
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00    -      -      -      -     1.00   1.00    -

# CHECK:      Resource pressure by instruction:
# CHECK-NEXT: [0]    [1]    [2]    [3]    [4]    [5]    [6]    [7]    [8]    [9]    [10]   [11]   [12]   [13]   Instructions:
# CHECK-NEXT:  -      -      -      -      -      -     1.00    -      -      -      -      -     1.00    -     vpinsrb	$0, %eax, %xmm0, %xmm0
# CHECK-NEXT:  -      -      -      -      -     1.00    -      -      -      -      -     1.00    -      -     vpinsrb	$1, %eax, %xmm0, %xmm0

# CHECK:      [1] Code Region

# CHECK:      Iterations:        500
# CHECK-NEXT: Instructions:      1000
# CHECK-NEXT: Total Cycles:      1003
# CHECK-NEXT: Total uOps:        2000

# CHECK:      Dispatch Width:    2
# CHECK-NEXT: uOps Per Cycle:    1.99
# CHECK-NEXT: IPC:               1.00
# CHECK-NEXT: Block RThroughput: 2.0

# CHECK:      Instruction Info:
# CHECK-NEXT: [1]: #uOps
# CHECK-NEXT: [2]: Latency
# CHECK-NEXT: [3]: RThroughput
# CHECK-NEXT: [4]: MayLoad
# CHECK-NEXT: [5]: MayStore
# CHECK-NEXT: [6]: HasSideEffects (U)

# CHECK:      [1]    [2]    [3]    [4]    [5]    [6]    Instructions:
# CHECK-NEXT:  2      7     0.50                        vpinsrw	$0, %eax, %xmm0, %xmm0
# CHECK-NEXT:  2      7     0.50                        vpinsrw	$1, %eax, %xmm0, %xmm0

# CHECK:      Resources:
# CHECK-NEXT: [0]   - JALU0
# CHECK-NEXT: [1]   - JALU1
# CHECK-NEXT: [2]   - JDiv
# CHECK-NEXT: [3]   - JFPA
# CHECK-NEXT: [4]   - JFPM
# CHECK-NEXT: [5]   - JFPU0
# CHECK-NEXT: [6]   - JFPU1
# CHECK-NEXT: [7]   - JLAGU
# CHECK-NEXT: [8]   - JMul
# CHECK-NEXT: [9]   - JSAGU
# CHECK-NEXT: [10]  - JSTC
# CHECK-NEXT: [11]  - JVALU0
# CHECK-NEXT: [12]  - JVALU1
# CHECK-NEXT: [13]  - JVIMUL

# CHECK:      Resource pressure per iteration:
# CHECK-NEXT: [0]    [1]    [2]    [3]    [4]    [5]    [6]    [7]    [8]    [9]    [10]   [11]   [12]   [13]
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00    -      -      -      -     1.00   1.00    -

# CHECK:      Resource pressure by instruction:
# CHECK-NEXT: [0]    [1]    [2]    [3]    [4]    [5]    [6]    [7]    [8]    [9]    [10]   [11]   [12]   [13]   Instructions:
# CHECK-NEXT:  -      -      -      -      -      -     1.00    -      -      -      -      -     1.00    -     vpinsrw	$0, %eax, %xmm0, %xmm0
# CHECK-NEXT:  -      -      -      -      -     1.00    -      -      -      -      -     1.00    -      -     vpinsrw	$1, %eax, %xmm0, %xmm0

# CHECK:      [2] Code Region

# CHECK:      Iterations:        500
# CHECK-NEXT: Instructions:      1000
# CHECK-NEXT: Total Cycles:      1003
# CHECK-NEXT: Total uOps:        2000

# CHECK:      Dispatch Width:    2
# CHECK-NEXT: uOps Per Cycle:    1.99
# CHECK-NEXT: IPC:               1.00
# CHECK-NEXT: Block RThroughput: 2.0

# CHECK:      Instruction Info:
# CHECK-NEXT: [1]: #uOps
# CHECK-NEXT: [2]: Latency
# CHECK-NEXT: [3]: RThroughput
# CHECK-NEXT: [4]: MayLoad
# CHECK-NEXT: [5]: MayStore
# CHECK-NEXT: [6]: HasSideEffects (U)

# CHECK:      [1]    [2]    [3]    [4]    [5]    [6]    Instructions:
# CHECK-NEXT:  2      7     0.50                        vpinsrd	$0, %eax, %xmm0, %xmm0
# CHECK-NEXT:  2      7     0.50                        vpinsrd	$1, %eax, %xmm0, %xmm0

# CHECK:      Resources:
# CHECK-NEXT: [0]   - JALU0
# CHECK-NEXT: [1]   - JALU1
# CHECK-NEXT: [2]   - JDiv
# CHECK-NEXT: [3]   - JFPA
# CHECK-NEXT: [4]   - JFPM
# CHECK-NEXT: [5]   - JFPU0
# CHECK-NEXT: [6]   - JFPU1
# CHECK-NEXT: [7]   - JLAGU
# CHECK-NEXT: [8]   - JMul
# CHECK-NEXT: [9]   - JSAGU
# CHECK-NEXT: [10]  - JSTC
# CHECK-NEXT: [11]  - JVALU0
# CHECK-NEXT: [12]  - JVALU1
# CHECK-NEXT: [13]  - JVIMUL

# CHECK:      Resource pressure per iteration:
# CHECK-NEXT: [0]    [1]    [2]    [3]    [4]    [5]    [6]    [7]    [8]    [9]    [10]   [11]   [12]   [13]
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00    -      -      -      -     1.00   1.00    -

# CHECK:      Resource pressure by instruction:
# CHECK-NEXT: [0]    [1]    [2]    [3]    [4]    [5]    [6]    [7]    [8]    [9]    [10]   [11]   [12]   [13]   Instructions:
# CHECK-NEXT:  -      -      -      -      -      -     1.00    -      -      -      -      -     1.00    -     vpinsrd	$0, %eax, %xmm0, %xmm0
# CHECK-NEXT:  -      -      -      -      -     1.00    -      -      -      -      -     1.00    -      -     vpinsrd	$1, %eax, %xmm0, %xmm0

# CHECK:      [3] Code Region

# CHECK:      Iterations:        500
# CHECK-NEXT: Instructions:      1000
# CHECK-NEXT: Total Cycles:      1003
# CHECK-NEXT: Total uOps:        2000

# CHECK:      Dispatch Width:    2
# CHECK-NEXT: uOps Per Cycle:    1.99
# CHECK-NEXT: IPC:               1.00
# CHECK-NEXT: Block RThroughput: 2.0

# CHECK:      Instruction Info:
# CHECK-NEXT: [1]: #uOps
# CHECK-NEXT: [2]: Latency
# CHECK-NEXT: [3]: RThroughput
# CHECK-NEXT: [4]: MayLoad
# CHECK-NEXT: [5]: MayStore
# CHECK-NEXT: [6]: HasSideEffects (U)

# CHECK:      [1]    [2]    [3]    [4]    [5]    [6]    Instructions:
# CHECK-NEXT:  2      7     0.50                        vpinsrq	$0, %rax, %xmm0, %xmm0
# CHECK-NEXT:  2      7     0.50                        vpinsrq	$1, %rax, %xmm0, %xmm0

# CHECK:      Resources:
# CHECK-NEXT: [0]   - JALU0
# CHECK-NEXT: [1]   - JALU1
# CHECK-NEXT: [2]   - JDiv
# CHECK-NEXT: [3]   - JFPA
# CHECK-NEXT: [4]   - JFPM
# CHECK-NEXT: [5]   - JFPU0
# CHECK-NEXT: [6]   - JFPU1
# CHECK-NEXT: [7]   - JLAGU
# CHECK-NEXT: [8]   - JMul
# CHECK-NEXT: [9]   - JSAGU
# CHECK-NEXT: [10]  - JSTC
# CHECK-NEXT: [11]  - JVALU0
# CHECK-NEXT: [12]  - JVALU1
# CHECK-NEXT: [13]  - JVIMUL

# CHECK:      Resource pressure per iteration:
# CHECK-NEXT: [0]    [1]    [2]    [3]    [4]    [5]    [6]    [7]    [8]    [9]    [10]   [11]   [12]   [13]
# CHECK-NEXT:  -      -      -      -      -     1.00   1.00    -      -      -      -     1.00   1.00    -

# CHECK:      Resource pressure by instruction:
# CHECK-NEXT: [0]    [1]    [2]    [3]    [4]    [5]    [6]    [7]    [8]    [9]    [10]   [11]   [12]   [13]   Instructions:
# CHECK-NEXT:  -      -      -      -      -      -     1.00    -      -      -      -      -     1.00    -     vpinsrq	$0, %rax, %xmm0, %xmm0
# CHECK-NEXT:  -      -      -      -      -     1.00    -      -      -      -      -     1.00    -      -     vpinsrq	$1, %rax, %xmm0, %xmm0
