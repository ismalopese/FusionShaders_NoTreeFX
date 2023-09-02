//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D BaseSampler;
//   float4 TexelSize;
//
//
// Registers:
//
//   Name         Reg   Size
//   ------------ ----- ----
//   TexelSize    c64      1
//   BaseSampler  s0       1
//

    ps_3_0
    def c0, 0.5, 0.25, 0, 0
    dcl_texcoord v0.xy
    dcl_2d s0
    mov r0.x, c0.x
    mad r1.x, c64.x, -r0.x, v0.x
    mad r1.y, c64.y, r0.x, v0.y
    texld r1, r1, s0
    mad r0.yz, c64.xxyw, r0.x, v0.xxyw
    texld r2, r0.yzzw, s0
    add r1, r1, r2
    mad r2.x, c64.x, r0.x, v0.x
    mad r2.y, c64.y, -r0.x, v0.y
    texld r2, r2, s0
    add r1, r1, r2
    mad r0.xy, c64, -r0.x, v0
    texld r0, r0, s0
    add r0, r1, r0
    mul r0, r0, c0.y
    mov oC0, r0
    mov oC1, r0
    mov oC2, r0
    mov oC3, r0

// approximately 19 instruction slots used (4 texture, 15 arithmetic)
