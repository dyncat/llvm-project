# REQUIRES: x86
# RUN: llvm-mc -filetype=obj -triple=x86_64-unknown-linux %s -o %t.o
# RUN: not ld.lld -shared %t.o -o /dev/null 2>&1 | FileCheck %s

# CHECK: relocation R_X86_64_32 cannot be used against symbol _shared; recompile with -fPIC
# CHECK: >>> defined in {{.*}}
# CHECK: >>> referenced by {{.*}}:(.data+0x0)

.data
.long _shared
