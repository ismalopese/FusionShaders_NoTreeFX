//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   float4x3 gBoneMtx[48];
//   row_major float4x4 gViewInverse;
//   row_major float4x4 gWorld;
//   row_major float4x4 gWorldViewProj;
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   gWorld         c0       4
//   gWorldViewProj c8       4
//   gViewInverse   c12      4
//   gBoneMtx       c64    144
//

    vs_3_0
    def c0, 765.005859, 1, 0, 0
    dcl_position v0
    dcl_blendindices v1
    dcl_texcoord v2
    dcl_texcoord1 v3
    dcl_normal v4
    dcl_color v5
    dcl_position o0
    dcl_texcoord9 o10
    dcl_texcoord o1.xy
    dcl_texcoord1 o2
    dcl_texcoord3 o3.xyz
    dcl_color o4
    dcl_texcoord2 o5
    dcl_texcoord7 o6.xy
    mad r0, v0.xyzx, c0.yyyz, c0.zzzy
    mul r1.x, c0.x, v1.x
    mova a0.x, r1.x
    dp4 r1.x, r0, c64[a0.x]
    dp4 r1.y, r0, c65[a0.x]
    dp4 r1.z, r0, c66[a0.x]
    add r0.xyz, r1, c3
    mul r2, r1.y, c9
    mad r2, r1.x, c8, r2
    mad r1, r1.z, c10, r2
    add r1, r1, c11
    add o3.xyz, -r0, c15
    mov o5.xyz, r0
    dp3 o2.x, v4, c64[a0.x]
    dp3 o2.y, v4, c65[a0.x]
    dp3 o2.z, v4, c66[a0.x]
    mov o0, r1
    mov o10.zw, r1
    mov o2.w, r1.w
    mov o1.xy, v2
    mad o4, v5.xyzx, c0.yyyz, c0.zzzy
    mov o5.w, c0.y
    mov o6.xy, v3
    mov r20.x, c8.w
    add r20.x, r20.x, c9.w
    add r20.x, r20.x, c10.w
    add o10.y, r20.x, c11.w
    
// approximately 22 instruction slots used
