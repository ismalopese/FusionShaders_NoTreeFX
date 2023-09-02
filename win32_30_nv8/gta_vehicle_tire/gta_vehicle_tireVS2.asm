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
    dcl_normal v3
    dcl_tangent v4
    dcl_color v5
    dcl_position o0
    dcl_texcoord9 o10
    dcl_texcoord o1.xy
    dcl_texcoord1 o2
    dcl_texcoord3 o3.xyz
    dcl_texcoord4 o4.xyz
    dcl_texcoord5 o5.xyz
    dcl_color o6
    dcl_texcoord2 o7
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
    mov o7.xyz, r0
    dp3 r0.x, v3, c64[a0.x]
    dp3 r0.y, v3, c65[a0.x]
    dp3 r0.z, v3, c66[a0.x]
    dp3 r2.x, v4, c64[a0.x]
    dp3 r2.y, v4, c65[a0.x]
    dp3 r2.z, v4, c66[a0.x]
    mul r3.xyz, r0.yzxw, r2.zxyw
    mad r3.xyz, r2.yzxw, r0.zxyw, -r3
    mov o2.xyz, r0
    mov o4.xyz, r2
    mul o5.xyz, r3, v4.w
    mov o0, r1
    mov o10.zw, r1
    mov o2.w, r1.w
    mov o1.xy, v2
    mad o6, v5.xyzx, c0.yyyz, c0.zzzy
    mov o7.w, c0.y
    mov r20.x, c8.w
    add r20.x, r20.x, c9.w
    add r20.x, r20.x, c10.w
    add o10.y, r20.x, c11.w
    
// approximately 29 instruction slots used
