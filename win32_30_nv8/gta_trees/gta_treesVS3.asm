// Added wind sway to tree shadows + custom wind sway register
// Custom registers: c233
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   float4 CustomWindSway;
//   row_major float4x4 gShadowMatrix;
//   float4 colorize;
//   row_major float4x4 gWorld;
//
//
// Registers:
//
//   Name             Reg   Size
//   ---------------- ----- ----
//   gWorld           c0       4
//   colorize         c51      1
//   gShadowMatrix    c60      4
//

    vs_3_0
    def c230, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 3.6728032750e-42 // 2621
    def c4, 0.00499999989, 0.00999999978, 0, 1
    def c5, 9.99999975e-006, 0.5, 0.0318309888, 0
    def c6, 6.28318548, -3.14159274, 0, 0
    dcl_position v0
    dcl_texcoord v1
    dcl_position o0
    dcl_texcoord o1.xyz
    mul r0.xyz, c4.zwzw, v0.zxyw
    mad r0.xyz, v0.yzxw, c4.wzzw, -r0
    add r0.xyz, r0, c5.x
    nrm r1.xyz, r0
    dp3 r0.x, v0, v0
    rsq r0.x, r0.x
    rcp r0.x, r0.x
    mad r0.y, r0.x, c4.x, c4.y
	mul r0.x, r0.x, c233.w
    // mul r0.x, r0.x, c51.w
    mad r0.x, r0.x, c5.z, c5.y
    frc r0.x, r0.x
    mad r0.x, r0.x, c6.x, c6.y
    sincos r2.xy, r0.x
    mul r0.xzw, r1.xyyz, r0.y
    mul r1.xyz, r0.wxzw, v0.yzxw
    mad r1.xyz, r0.zwxw, v0.zxyw, -r1
    mad r0.xzw, r0, r2.y, v0.xyyz
    add r1.xyz, r1, c5.x
    nrm r3.xyz, r1
    mul r1.xyz, r0.y, r3
    mul r1.xyz, r1, c5.y
    mad r3.xyz, r1, r2.x, r0.xzww
    mul r0.xyz, c1, r3.y
    mad r0.xyz, r3.x, c0, r0
    mad r0.xyz, r3.z, c2, r0
    add r0.xyz, r0, c3
    mul r1, r0.y, c61
    mad r1, r0.x, c60, r1
    mad r0, r0.z, c62, r1
    add r0, r0, c63
    min r0.z, r0.z, c4.w
    add o0.z, -r0.z, c4.w
    mad o0.xyw, r0.xyzx, c4.wwzz, c4.zzzw
    mov o1.x, r0.w
    mov o1.yz, v1.xxyw

// approximately 13 instruction slots used
