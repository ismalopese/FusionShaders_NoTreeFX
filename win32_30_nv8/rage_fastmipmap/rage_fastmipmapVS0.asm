//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
    vs_3_0
    def c0, 1, 0, -1, 0
    dcl_position v0
    dcl_color v1
    dcl_texcoord v2
    dcl_texcoord1 v3
    dcl_position o0
    dcl_color o1
    dcl_texcoord o2.xy
    dcl_texcoord1 o3.xy
    dcl_texcoord2 o4.xyz
    mad o0, v0.xyzx, c0.xxxy, c0.yyyx
    mov o1, v1
    mov o2.xy, v2
    mov o3.xy, v3
    mov o4.xyz, c0.yyzw

// approximately 5 instruction slots used
