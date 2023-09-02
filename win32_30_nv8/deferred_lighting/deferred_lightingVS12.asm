//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   row_major float4x4 gWorldViewProj;
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   gWorldViewProj c8       4
//

    vs_3_0
    dcl_position v0
    dcl_color v1
    dcl_texcoord v2
    dcl_position o0
    dcl_texcoord9 o10
    dcl_texcoord o1.xy
    dcl_texcoord1 o2.xyz
    mul r0, c9, v0.y
    mad r0, v0.x, c8, r0
    mad r0, v0.z, c10, r0
    add o0, r0, c11
    add o10.zw, r0, c11
    mov r0.xyz, v1
    mul o2.xyz, r0, v2.y
    mov o1.x, v2.x
    mov o1.y, v1.w
    mov r20.x, c8.w
    add r20.x, r20.x, c9.w
    add r20.x, r20.x, c10.w
    add o10.y, r20.x, c11.w
    
// approximately 8 instruction slots used
