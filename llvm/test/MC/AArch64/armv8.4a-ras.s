// RUN: not llvm-mc -triple aarch64-none-linux-gnu -show-encoding -mattr=+v8.4a < %s 2> %t | FileCheck %s --check-prefix=CHECK
// RUN: FileCheck --check-prefix=CHECK-RO < %t %s

// RUN: not llvm-mc -triple aarch64-none-linux-gnu -show-encoding -mattr=-v8.4a < %s 2>&1 | FileCheck %s --check-prefix=CHECK-ERROR

//------------------------------------------------------------------------------
// ARMV8.4-A RAS Extensions
//------------------------------------------------------------------------------

// Read/Write registers:

  msr ERXPFGCTL_EL1, x0
  mrs x0,ERXPFGCTL_EL1

//CHECK:  msr ERXPFGCTL_EL1, x0       // encoding: [0xa0,0x54,0x18,0xd5]
//CHECK:  mrs x0, ERXPFGCTL_EL1       // encoding: [0xa0,0x54,0x38,0xd5]
//CHECK-ERROR: error: expected writable system register or pstate
//CHECK-ERROR: error: expected readable system register

  msr ERXPFGCDN_EL1, x0
  mrs x0,ERXPFGCDN_EL1

//CHECK:  msr ERXPFGCDN_EL1, x0       // encoding: [0xc0,0x54,0x18,0xd5]
//CHECK:  mrs x0, ERXPFGCDN_EL1       // encoding: [0xc0,0x54,0x38,0xd5]
//CHECK-ERROR: error: expected writable system register or pstate
//CHECK-ERROR: error: expected readable system register

  msr ERXMISC2_EL1, x0
  mrs x0, ERXMISC2_EL1

//CHECK:   msr ERXMISC2_EL1, x0        // encoding: [0x40,0x55,0x18,0xd5]
//CHECK:   mrs x0, ERXMISC2_EL1        // encoding: [0x40,0x55,0x38,0xd5]
//CHECK-ERROR: error: expected writable system register or pstate
//CHECK-ERROR: error: expected readable system register

  msr ERXMISC3_EL1, x0
  mrs x0, ERXMISC3_EL1

//CHECK:  msr ERXMISC3_EL1, x0        // encoding: [0x60,0x55,0x18,0xd5]
//CHECK:  mrs x0, ERXMISC3_EL1        // encoding: [0x60,0x55,0x38,0xd5]
//CHECK-ERROR: error: expected writable system register or pstate
//CHECK-ERROR: error: expected readable system register

// Read-only registers:

  mrs x0,ERXPFGF_EL1
  msr ERXPFGF_EL1, x0

//CHECK:  mrs x0, ERXPFGF_EL1         // encoding: [0x80,0x54,0x38,0xd5]
//CHECK-RO: error: expected writable system register or pstate
//CHECK-ERROR: error: expected readable system register
//CHECK-ERROR: error: expected writable system register or pstate
