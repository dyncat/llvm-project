//=----- AArch64InstrGISel.td - AArch64 GISel target pseudos -*- tablegen -*-=//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// AArch64 GlobalISel target pseudo instruction definitions. This is kept
// separately from the other tablegen files for organizational purposes, but
// share the same infrastructure.
//
//===----------------------------------------------------------------------===//


class AArch64GenericInstruction : GenericInstruction {
  let Namespace = "AArch64";
}

// A pseudo to represent a relocatable add instruction as part of address
// computation.
def G_ADD_LOW : AArch64GenericInstruction {
  let OutOperandList = (outs type0:$dst);
  let InOperandList = (ins type1:$src, type2:$imm);
  let hasSideEffects = 0;
}

// Pseudo for a rev16 instruction. Produced post-legalization from
// G_SHUFFLE_VECTORs with appropriate masks.
def G_REV16 : AArch64GenericInstruction {
  let OutOperandList = (outs type0:$dst);
  let InOperandList = (ins type0:$src);
}

// Pseudo for a rev32 instruction. Produced post-legalization from
// G_SHUFFLE_VECTORs with appropriate masks.
def G_REV32 : AArch64GenericInstruction {
  let OutOperandList = (outs type0:$dst);
  let InOperandList = (ins type0:$src);
}

// Pseudo for a rev64 instruction. Produced post-legalization from
// G_SHUFFLE_VECTORs with appropriate masks.
def G_REV64 : AArch64GenericInstruction {
  let OutOperandList = (outs type0:$dst);
  let InOperandList = (ins type0:$src);
}

// Represents an uzp1 instruction. Produced post-legalization from
// G_SHUFFLE_VECTORs with appropriate masks.
def G_UZP1 : AArch64GenericInstruction {
  let OutOperandList = (outs type0:$dst);
  let InOperandList = (ins type0:$v1, type0:$v2);
}

// Represents an uzp2 instruction. Produced post-legalization from
// G_SHUFFLE_VECTORs with appropriate masks.
def G_UZP2 : AArch64GenericInstruction {
  let OutOperandList = (outs type0:$dst);
  let InOperandList = (ins type0:$v1, type0:$v2);
}

// Represents a zip1 instruction. Produced post-legalization from
// G_SHUFFLE_VECTORs with appropriate masks.
def G_ZIP1 : AArch64GenericInstruction {
  let OutOperandList = (outs type0:$dst);
  let InOperandList = (ins type0:$v1, type0:$v2);
}

// Represents a zip2 instruction. Produced post-legalization from
// G_SHUFFLE_VECTORs with appropriate masks.
def G_ZIP2 : AArch64GenericInstruction {
  let OutOperandList = (outs type0:$dst);
  let InOperandList = (ins type0:$v1, type0:$v2);
}

// Represents a dup instruction. Produced post-legalization from
// G_SHUFFLE_VECTORs with appropriate masks.
def G_DUP: AArch64GenericInstruction {
  let OutOperandList = (outs type0:$dst);
  let InOperandList = (ins type1:$lane);
}

def : GINodeEquiv<G_REV16, AArch64rev16>;
def : GINodeEquiv<G_REV32, AArch64rev32>;
def : GINodeEquiv<G_REV64, AArch64rev64>;
def : GINodeEquiv<G_UZP1, AArch64uzp1>;
def : GINodeEquiv<G_UZP2, AArch64uzp2>;
def : GINodeEquiv<G_ZIP1, AArch64zip1>;
def : GINodeEquiv<G_ZIP2, AArch64zip2>;
def : GINodeEquiv<G_DUP, AArch64dup>;
