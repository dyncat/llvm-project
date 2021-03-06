// RUN: not llvm-mc -arch=amdgcn -show-encoding %s 2>&1 | FileCheck --check-prefix=GCN --check-prefix=SICI %s
// RUN: not llvm-mc -arch=amdgcn -mcpu=tahiti -show-encoding %s 2>&1 | FileCheck --check-prefix=GCN --check-prefix=SICI %s
// RUN: not llvm-mc -arch=amdgcn -mcpu=fiji -show-encoding %s 2>&1 | FileCheck --check-prefix=GCN --check-prefix=VI --check-prefix=SICIVI %s
// RUN: not llvm-mc -arch=amdgcn -mcpu=gfx1010 -show-encoding %s 2>&1 | FileCheck --check-prefix=GCN %s

//===----------------------------------------------------------------------===//
// sendmsg
//===----------------------------------------------------------------------===//

s_sendmsg sendmsg(MSG_INTERRUPTX)
// GCN: error: expected absolute expression

s_sendmsg sendmsg(1 -)
// GCN: error: unknown token in expression

s_sendmsg sendmsg(MSG_INTERRUPT, 0)
// GCN: error: message does not support operations

s_sendmsg sendmsg(MSG_INTERRUPT, 0, 0)
// GCN: error: message does not support operations

s_sendmsg sendmsg(MSG_GS)
// GCN: error: missing message operation

s_sendmsg sendmsg(MSG_GS, GS_OP_NOP)
// GCN: error: invalid operation id

s_sendmsg sendmsg(MSG_GS, SYSMSG_OP_ECC_ERR_INTERRUPT)
// GCN: error: expected absolute expression

s_sendmsg sendmsg(MSG_GS, 0)
// GCN: error: invalid operation id

s_sendmsg sendmsg(MSG_GS, -1)
// GCN: error: invalid operation id

s_sendmsg sendmsg(MSG_GS, 4)
// GCN: error: invalid operation id

s_sendmsg sendmsg(MSG_GS, 8)
// GCN: error: invalid operation id

s_sendmsg sendmsg(15, -1)
// GCN: error: invalid operation id

s_sendmsg sendmsg(15, 8)
// GCN: error: invalid operation id

s_sendmsg sendmsg(MSG_GS, GS_OP_CUT, 0, 0)
// GCN: error: expected a closing parenthesis

s_sendmsg sendmsg(MSG_GSX, GS_OP_CUT, 0)
// GCN: error: expected absolute expression

s_sendmsg sendmsg(MSG_GS, GS_OP_CUTX, 0)
// GCN: error: expected absolute expression

s_sendmsg sendmsg(MSG_GS, 1 -)
// GCN: error: unknown token in expression

s_sendmsg sendmsg(MSG_GS, GS_OP_CUT, 4)
// GCN: error: invalid message stream id

s_sendmsg sendmsg(MSG_GS, GS_OP_CUT, 1 -)
// GCN: error: unknown token in expression

s_sendmsg sendmsg(2, 3, 0, 0)
// GCN: error: expected a closing parenthesis

s_sendmsg sendmsg(2, 2, -1)
// GCN: error: invalid message stream id

s_sendmsg sendmsg(2, 2, 4)
// GCN: error: invalid message stream id

s_sendmsg sendmsg(2, 2, 0, 0)
// GCN: error: expected a closing parenthesis

s_sendmsg sendmsg(MSG_GS_DONE, GS_OP_NOP, 0)
// GCN: error: message operation does not support streams

s_sendmsg sendmsg(MSG_GS_DONE, 0, 0)
// GCN: error: message operation does not support streams

s_sendmsg sendmsg(MSG_GS_ALLOC_REQ)
// SICIVI: error: invalid message id

s_sendmsg sendmsg(MSG_GS_ALLOC_REQ, 0)
// SICIVI: error: invalid message id

s_sendmsg sendmsg(-1)
// SICIVI: error: invalid message id

s_sendmsg sendmsg(16)
// SICIVI: error: invalid message id

s_sendmsg sendmsg(MSG_SYSMSG)
// GCN: error: missing message operation

s_sendmsg sendmsg(MSG_SYSMSG, SYSMSG_OP_ECC_ERR_INTERRUPT, 0)
// GCN: error: message operation does not support streams

s_sendmsg sendmsg(MSG_SYSMSG, 0)
// GCN: error: invalid operation id

s_sendmsg sendmsg(MSG_SYSMSG, 5)
// GCN: error: invalid operation id

//===----------------------------------------------------------------------===//
// waitcnt
//===----------------------------------------------------------------------===//

s_waitcnt lgkmcnt(16)
// SICIVI: error: too large value for lgkmcnt

s_waitcnt lgkmcnt(64)
// GCN: error: too large value for lgkmcnt

s_waitcnt expcnt(8)
// GCN: error: too large value for expcnt

s_waitcnt vmcnt(16)
// SICIVI: error: too large value for vmcnt

s_waitcnt vmcnt(64)
// GFX10: error: too large value for vmcnt

s_waitcnt vmcnt(0xFFFFFFFFFFFF0000)
// GCN: error: too large value for vmcnt

s_waitcnt vmcnt(0), expcnt(0), lgkmcnt(0),
// GCN: error: expected a counter name

s_waitcnt vmcnt(0) & expcnt(0) & lgkmcnt(0)&
// GCN: error: expected a counter name

s_waitcnt vmcnt(0) & expcnt(0) & x
// GCN: error: expected a left parenthesis

s_waitcnt vmcnt(0) & expcnt(0) x
// GCN: error: expected a left parenthesis

s_waitcnt vmcnt(0) & expcnt(0) & 1
// GCN: error: expected a counter name

s_waitcnt vmcnt(0) & expcnt(0) 1
// GCN: error: expected a counter name

s_waitcnt vmcnt(0) & expcnt(0) x(0)
// GCN: error: invalid counter name x

s_waitcnt vmcnt(x)
// GCN: error: expected absolute expression

s_waitcnt x
// GCN: error: expected absolute expression

s_waitcnt vmcnt(0
// GCN: error: expected a closing parenthesis

s_branch 0x80000000ffff
// GCN: error: expected a 16-bit signed jump offset

s_branch 0x10000
// GCN: error: expected a 16-bit signed jump offset

s_branch -32769
// GCN: error: expected a 16-bit signed jump offset

s_branch 1.0
// GCN: error: expected a 16-bit signed jump offset

s_branch s0
// GCN: error: invalid operand for instruction

s_branch offset:1
// GCN: error: not a valid operand
