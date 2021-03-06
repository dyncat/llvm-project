// RUN: llvm-mc -triple x86_64-unknown-unknown --show-encoding %s | FileCheck %s

// CHECK: aesdec 485498096, %xmm15 
// CHECK: encoding: [0x66,0x44,0x0f,0x38,0xde,0x3c,0x25,0xf0,0x1c,0xf0,0x1c]       
aesdec 485498096, %xmm15 

// CHECK: aesdec 485498096, %xmm6 
// CHECK: encoding: [0x66,0x0f,0x38,0xde,0x34,0x25,0xf0,0x1c,0xf0,0x1c]       
aesdec 485498096, %xmm6 

// CHECK: aesdec 64(%rdx,%rax,4), %xmm15 
// CHECK: encoding: [0x66,0x44,0x0f,0x38,0xde,0x7c,0x82,0x40]       
aesdec 64(%rdx,%rax,4), %xmm15 

// CHECK: aesdec -64(%rdx,%rax,4), %xmm15 
// CHECK: encoding: [0x66,0x44,0x0f,0x38,0xde,0x7c,0x82,0xc0]       
aesdec -64(%rdx,%rax,4), %xmm15 

// CHECK: aesdec 64(%rdx,%rax,4), %xmm6 
// CHECK: encoding: [0x66,0x0f,0x38,0xde,0x74,0x82,0x40]       
aesdec 64(%rdx,%rax,4), %xmm6 

// CHECK: aesdec -64(%rdx,%rax,4), %xmm6 
// CHECK: encoding: [0x66,0x0f,0x38,0xde,0x74,0x82,0xc0]       
aesdec -64(%rdx,%rax,4), %xmm6 

// CHECK: aesdec 64(%rdx,%rax), %xmm15 
// CHECK: encoding: [0x66,0x44,0x0f,0x38,0xde,0x7c,0x02,0x40]       
aesdec 64(%rdx,%rax), %xmm15 

// CHECK: aesdec 64(%rdx,%rax), %xmm6 
// CHECK: encoding: [0x66,0x0f,0x38,0xde,0x74,0x02,0x40]       
aesdec 64(%rdx,%rax), %xmm6 

// CHECK: aesdec 64(%rdx), %xmm15 
// CHECK: encoding: [0x66,0x44,0x0f,0x38,0xde,0x7a,0x40]       
aesdec 64(%rdx), %xmm15 

// CHECK: aesdec 64(%rdx), %xmm6 
// CHECK: encoding: [0x66,0x0f,0x38,0xde,0x72,0x40]       
aesdec 64(%rdx), %xmm6 

// CHECK: aesdeclast 485498096, %xmm15 
// CHECK: encoding: [0x66,0x44,0x0f,0x38,0xdf,0x3c,0x25,0xf0,0x1c,0xf0,0x1c]       
aesdeclast 485498096, %xmm15 

// CHECK: aesdeclast 485498096, %xmm6 
// CHECK: encoding: [0x66,0x0f,0x38,0xdf,0x34,0x25,0xf0,0x1c,0xf0,0x1c]       
aesdeclast 485498096, %xmm6 

// CHECK: aesdeclast 64(%rdx,%rax,4), %xmm15 
// CHECK: encoding: [0x66,0x44,0x0f,0x38,0xdf,0x7c,0x82,0x40]       
aesdeclast 64(%rdx,%rax,4), %xmm15 

// CHECK: aesdeclast -64(%rdx,%rax,4), %xmm15 
// CHECK: encoding: [0x66,0x44,0x0f,0x38,0xdf,0x7c,0x82,0xc0]       
aesdeclast -64(%rdx,%rax,4), %xmm15 

// CHECK: aesdeclast 64(%rdx,%rax,4), %xmm6 
// CHECK: encoding: [0x66,0x0f,0x38,0xdf,0x74,0x82,0x40]       
aesdeclast 64(%rdx,%rax,4), %xmm6 

// CHECK: aesdeclast -64(%rdx,%rax,4), %xmm6 
// CHECK: encoding: [0x66,0x0f,0x38,0xdf,0x74,0x82,0xc0]       
aesdeclast -64(%rdx,%rax,4), %xmm6 

// CHECK: aesdeclast 64(%rdx,%rax), %xmm15 
// CHECK: encoding: [0x66,0x44,0x0f,0x38,0xdf,0x7c,0x02,0x40]       
aesdeclast 64(%rdx,%rax), %xmm15 

// CHECK: aesdeclast 64(%rdx,%rax), %xmm6 
// CHECK: encoding: [0x66,0x0f,0x38,0xdf,0x74,0x02,0x40]       
aesdeclast 64(%rdx,%rax), %xmm6 

// CHECK: aesdeclast 64(%rdx), %xmm15 
// CHECK: encoding: [0x66,0x44,0x0f,0x38,0xdf,0x7a,0x40]       
aesdeclast 64(%rdx), %xmm15 

// CHECK: aesdeclast 64(%rdx), %xmm6 
// CHECK: encoding: [0x66,0x0f,0x38,0xdf,0x72,0x40]       
aesdeclast 64(%rdx), %xmm6 

// CHECK: aesdeclast (%rdx), %xmm15 
// CHECK: encoding: [0x66,0x44,0x0f,0x38,0xdf,0x3a]       
aesdeclast (%rdx), %xmm15 

// CHECK: aesdeclast (%rdx), %xmm6 
// CHECK: encoding: [0x66,0x0f,0x38,0xdf,0x32]       
aesdeclast (%rdx), %xmm6 

// CHECK: aesdeclast %xmm15, %xmm15 
// CHECK: encoding: [0x66,0x45,0x0f,0x38,0xdf,0xff]       
aesdeclast %xmm15, %xmm15 

// CHECK: aesdeclast %xmm6, %xmm6 
// CHECK: encoding: [0x66,0x0f,0x38,0xdf,0xf6]       
aesdeclast %xmm6, %xmm6 

// CHECK: aesdec (%rdx), %xmm15 
// CHECK: encoding: [0x66,0x44,0x0f,0x38,0xde,0x3a]       
aesdec (%rdx), %xmm15 

// CHECK: aesdec (%rdx), %xmm6 
// CHECK: encoding: [0x66,0x0f,0x38,0xde,0x32]       
aesdec (%rdx), %xmm6 

// CHECK: aesdec %xmm15, %xmm15 
// CHECK: encoding: [0x66,0x45,0x0f,0x38,0xde,0xff]       
aesdec %xmm15, %xmm15 

// CHECK: aesdec %xmm6, %xmm6 
// CHECK: encoding: [0x66,0x0f,0x38,0xde,0xf6]       
aesdec %xmm6, %xmm6 

// CHECK: aesenc 485498096, %xmm15 
// CHECK: encoding: [0x66,0x44,0x0f,0x38,0xdc,0x3c,0x25,0xf0,0x1c,0xf0,0x1c]       
aesenc 485498096, %xmm15 

// CHECK: aesenc 485498096, %xmm6 
// CHECK: encoding: [0x66,0x0f,0x38,0xdc,0x34,0x25,0xf0,0x1c,0xf0,0x1c]       
aesenc 485498096, %xmm6 

// CHECK: aesenc 64(%rdx,%rax,4), %xmm15 
// CHECK: encoding: [0x66,0x44,0x0f,0x38,0xdc,0x7c,0x82,0x40]       
aesenc 64(%rdx,%rax,4), %xmm15 

// CHECK: aesenc -64(%rdx,%rax,4), %xmm15 
// CHECK: encoding: [0x66,0x44,0x0f,0x38,0xdc,0x7c,0x82,0xc0]       
aesenc -64(%rdx,%rax,4), %xmm15 

// CHECK: aesenc 64(%rdx,%rax,4), %xmm6 
// CHECK: encoding: [0x66,0x0f,0x38,0xdc,0x74,0x82,0x40]       
aesenc 64(%rdx,%rax,4), %xmm6 

// CHECK: aesenc -64(%rdx,%rax,4), %xmm6 
// CHECK: encoding: [0x66,0x0f,0x38,0xdc,0x74,0x82,0xc0]       
aesenc -64(%rdx,%rax,4), %xmm6 

// CHECK: aesenc 64(%rdx,%rax), %xmm15 
// CHECK: encoding: [0x66,0x44,0x0f,0x38,0xdc,0x7c,0x02,0x40]       
aesenc 64(%rdx,%rax), %xmm15 

// CHECK: aesenc 64(%rdx,%rax), %xmm6 
// CHECK: encoding: [0x66,0x0f,0x38,0xdc,0x74,0x02,0x40]       
aesenc 64(%rdx,%rax), %xmm6 

// CHECK: aesenc 64(%rdx), %xmm15 
// CHECK: encoding: [0x66,0x44,0x0f,0x38,0xdc,0x7a,0x40]       
aesenc 64(%rdx), %xmm15 

// CHECK: aesenc 64(%rdx), %xmm6 
// CHECK: encoding: [0x66,0x0f,0x38,0xdc,0x72,0x40]       
aesenc 64(%rdx), %xmm6 

// CHECK: aesenclast 485498096, %xmm15 
// CHECK: encoding: [0x66,0x44,0x0f,0x38,0xdd,0x3c,0x25,0xf0,0x1c,0xf0,0x1c]       
aesenclast 485498096, %xmm15 

// CHECK: aesenclast 485498096, %xmm6 
// CHECK: encoding: [0x66,0x0f,0x38,0xdd,0x34,0x25,0xf0,0x1c,0xf0,0x1c]       
aesenclast 485498096, %xmm6 

// CHECK: aesenclast 64(%rdx,%rax,4), %xmm15 
// CHECK: encoding: [0x66,0x44,0x0f,0x38,0xdd,0x7c,0x82,0x40]       
aesenclast 64(%rdx,%rax,4), %xmm15 

// CHECK: aesenclast -64(%rdx,%rax,4), %xmm15 
// CHECK: encoding: [0x66,0x44,0x0f,0x38,0xdd,0x7c,0x82,0xc0]       
aesenclast -64(%rdx,%rax,4), %xmm15 

// CHECK: aesenclast 64(%rdx,%rax,4), %xmm6 
// CHECK: encoding: [0x66,0x0f,0x38,0xdd,0x74,0x82,0x40]       
aesenclast 64(%rdx,%rax,4), %xmm6 

// CHECK: aesenclast -64(%rdx,%rax,4), %xmm6 
// CHECK: encoding: [0x66,0x0f,0x38,0xdd,0x74,0x82,0xc0]       
aesenclast -64(%rdx,%rax,4), %xmm6 

// CHECK: aesenclast 64(%rdx,%rax), %xmm15 
// CHECK: encoding: [0x66,0x44,0x0f,0x38,0xdd,0x7c,0x02,0x40]       
aesenclast 64(%rdx,%rax), %xmm15 

// CHECK: aesenclast 64(%rdx,%rax), %xmm6 
// CHECK: encoding: [0x66,0x0f,0x38,0xdd,0x74,0x02,0x40]       
aesenclast 64(%rdx,%rax), %xmm6 

// CHECK: aesenclast 64(%rdx), %xmm15 
// CHECK: encoding: [0x66,0x44,0x0f,0x38,0xdd,0x7a,0x40]       
aesenclast 64(%rdx), %xmm15 

// CHECK: aesenclast 64(%rdx), %xmm6 
// CHECK: encoding: [0x66,0x0f,0x38,0xdd,0x72,0x40]       
aesenclast 64(%rdx), %xmm6 

// CHECK: aesenclast (%rdx), %xmm15 
// CHECK: encoding: [0x66,0x44,0x0f,0x38,0xdd,0x3a]       
aesenclast (%rdx), %xmm15 

// CHECK: aesenclast (%rdx), %xmm6 
// CHECK: encoding: [0x66,0x0f,0x38,0xdd,0x32]       
aesenclast (%rdx), %xmm6 

// CHECK: aesenclast %xmm15, %xmm15 
// CHECK: encoding: [0x66,0x45,0x0f,0x38,0xdd,0xff]       
aesenclast %xmm15, %xmm15 

// CHECK: aesenclast %xmm6, %xmm6 
// CHECK: encoding: [0x66,0x0f,0x38,0xdd,0xf6]       
aesenclast %xmm6, %xmm6 

// CHECK: aesenc (%rdx), %xmm15 
// CHECK: encoding: [0x66,0x44,0x0f,0x38,0xdc,0x3a]       
aesenc (%rdx), %xmm15 

// CHECK: aesenc (%rdx), %xmm6 
// CHECK: encoding: [0x66,0x0f,0x38,0xdc,0x32]       
aesenc (%rdx), %xmm6 

// CHECK: aesenc %xmm15, %xmm15 
// CHECK: encoding: [0x66,0x45,0x0f,0x38,0xdc,0xff]       
aesenc %xmm15, %xmm15 

// CHECK: aesenc %xmm6, %xmm6 
// CHECK: encoding: [0x66,0x0f,0x38,0xdc,0xf6]       
aesenc %xmm6, %xmm6 

// CHECK: aesimc 485498096, %xmm15 
// CHECK: encoding: [0x66,0x44,0x0f,0x38,0xdb,0x3c,0x25,0xf0,0x1c,0xf0,0x1c]       
aesimc 485498096, %xmm15 

// CHECK: aesimc 485498096, %xmm6 
// CHECK: encoding: [0x66,0x0f,0x38,0xdb,0x34,0x25,0xf0,0x1c,0xf0,0x1c]       
aesimc 485498096, %xmm6 

// CHECK: aesimc 64(%rdx,%rax,4), %xmm15 
// CHECK: encoding: [0x66,0x44,0x0f,0x38,0xdb,0x7c,0x82,0x40]       
aesimc 64(%rdx,%rax,4), %xmm15 

// CHECK: aesimc -64(%rdx,%rax,4), %xmm15 
// CHECK: encoding: [0x66,0x44,0x0f,0x38,0xdb,0x7c,0x82,0xc0]       
aesimc -64(%rdx,%rax,4), %xmm15 

// CHECK: aesimc 64(%rdx,%rax,4), %xmm6 
// CHECK: encoding: [0x66,0x0f,0x38,0xdb,0x74,0x82,0x40]       
aesimc 64(%rdx,%rax,4), %xmm6 

// CHECK: aesimc -64(%rdx,%rax,4), %xmm6 
// CHECK: encoding: [0x66,0x0f,0x38,0xdb,0x74,0x82,0xc0]       
aesimc -64(%rdx,%rax,4), %xmm6 

// CHECK: aesimc 64(%rdx,%rax), %xmm15 
// CHECK: encoding: [0x66,0x44,0x0f,0x38,0xdb,0x7c,0x02,0x40]       
aesimc 64(%rdx,%rax), %xmm15 

// CHECK: aesimc 64(%rdx,%rax), %xmm6 
// CHECK: encoding: [0x66,0x0f,0x38,0xdb,0x74,0x02,0x40]       
aesimc 64(%rdx,%rax), %xmm6 

// CHECK: aesimc 64(%rdx), %xmm15 
// CHECK: encoding: [0x66,0x44,0x0f,0x38,0xdb,0x7a,0x40]       
aesimc 64(%rdx), %xmm15 

// CHECK: aesimc 64(%rdx), %xmm6 
// CHECK: encoding: [0x66,0x0f,0x38,0xdb,0x72,0x40]       
aesimc 64(%rdx), %xmm6 

// CHECK: aesimc (%rdx), %xmm15 
// CHECK: encoding: [0x66,0x44,0x0f,0x38,0xdb,0x3a]       
aesimc (%rdx), %xmm15 

// CHECK: aesimc (%rdx), %xmm6 
// CHECK: encoding: [0x66,0x0f,0x38,0xdb,0x32]       
aesimc (%rdx), %xmm6 

// CHECK: aesimc %xmm15, %xmm15 
// CHECK: encoding: [0x66,0x45,0x0f,0x38,0xdb,0xff]       
aesimc %xmm15, %xmm15 

// CHECK: aesimc %xmm6, %xmm6 
// CHECK: encoding: [0x66,0x0f,0x38,0xdb,0xf6]       
aesimc %xmm6, %xmm6 

// CHECK: aeskeygenassist $0, 485498096, %xmm15 
// CHECK: encoding: [0x66,0x44,0x0f,0x3a,0xdf,0x3c,0x25,0xf0,0x1c,0xf0,0x1c,0x00]      
aeskeygenassist $0, 485498096, %xmm15 

// CHECK: aeskeygenassist $0, 485498096, %xmm6 
// CHECK: encoding: [0x66,0x0f,0x3a,0xdf,0x34,0x25,0xf0,0x1c,0xf0,0x1c,0x00]      
aeskeygenassist $0, 485498096, %xmm6 

// CHECK: aeskeygenassist $0, 64(%rdx,%rax,4), %xmm15 
// CHECK: encoding: [0x66,0x44,0x0f,0x3a,0xdf,0x7c,0x82,0x40,0x00]      
aeskeygenassist $0, 64(%rdx,%rax,4), %xmm15 

// CHECK: aeskeygenassist $0, -64(%rdx,%rax,4), %xmm15 
// CHECK: encoding: [0x66,0x44,0x0f,0x3a,0xdf,0x7c,0x82,0xc0,0x00]      
aeskeygenassist $0, -64(%rdx,%rax,4), %xmm15 

// CHECK: aeskeygenassist $0, 64(%rdx,%rax,4), %xmm6 
// CHECK: encoding: [0x66,0x0f,0x3a,0xdf,0x74,0x82,0x40,0x00]      
aeskeygenassist $0, 64(%rdx,%rax,4), %xmm6 

// CHECK: aeskeygenassist $0, -64(%rdx,%rax,4), %xmm6 
// CHECK: encoding: [0x66,0x0f,0x3a,0xdf,0x74,0x82,0xc0,0x00]      
aeskeygenassist $0, -64(%rdx,%rax,4), %xmm6 

// CHECK: aeskeygenassist $0, 64(%rdx,%rax), %xmm15 
// CHECK: encoding: [0x66,0x44,0x0f,0x3a,0xdf,0x7c,0x02,0x40,0x00]      
aeskeygenassist $0, 64(%rdx,%rax), %xmm15 

// CHECK: aeskeygenassist $0, 64(%rdx,%rax), %xmm6 
// CHECK: encoding: [0x66,0x0f,0x3a,0xdf,0x74,0x02,0x40,0x00]      
aeskeygenassist $0, 64(%rdx,%rax), %xmm6 

// CHECK: aeskeygenassist $0, 64(%rdx), %xmm15 
// CHECK: encoding: [0x66,0x44,0x0f,0x3a,0xdf,0x7a,0x40,0x00]      
aeskeygenassist $0, 64(%rdx), %xmm15 

// CHECK: aeskeygenassist $0, 64(%rdx), %xmm6 
// CHECK: encoding: [0x66,0x0f,0x3a,0xdf,0x72,0x40,0x00]      
aeskeygenassist $0, 64(%rdx), %xmm6 

// CHECK: aeskeygenassist $0, (%rdx), %xmm15 
// CHECK: encoding: [0x66,0x44,0x0f,0x3a,0xdf,0x3a,0x00]      
aeskeygenassist $0, (%rdx), %xmm15 

// CHECK: aeskeygenassist $0, (%rdx), %xmm6 
// CHECK: encoding: [0x66,0x0f,0x3a,0xdf,0x32,0x00]      
aeskeygenassist $0, (%rdx), %xmm6 

// CHECK: aeskeygenassist $0, %xmm15, %xmm15 
// CHECK: encoding: [0x66,0x45,0x0f,0x3a,0xdf,0xff,0x00]      
aeskeygenassist $0, %xmm15, %xmm15 

// CHECK: aeskeygenassist $0, %xmm6, %xmm6 
// CHECK: encoding: [0x66,0x0f,0x3a,0xdf,0xf6,0x00]      
aeskeygenassist $0, %xmm6, %xmm6 

