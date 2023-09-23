//
// Generated by Microsoft (R) HLSL Shader Compiler 9.29.952.3111
//
// Parameters:
//
//   sampler2D PositionTexSampler;
//   sampler2D VelocityTexSampler;
//   float4 gColorTint;
//   float4 gColorTintPhase2;
//   float gMotionBlur;
//   float4 gRadius;
//   float4 gTextureAnimation;
//   row_major float4x4 gViewInverse;
//   row_major float4x4 gWorldViewProj;
//
//
// Registers:
//
//   Name               Reg   Size
//   ------------------ ----- ----
//   gWorldViewProj     c8       4
//   gViewInverse       c12      4
//   gMotionBlur        c64      1
//   gRadius            c65      1
//   gTextureAnimation  c66      1
//   gColorTint         c67      1
//   gColorTintPhase2   c68      1
//   PositionTexSampler s0       1
//   VelocityTexSampler s1       1
//

    vs_3_0
    def c0, 100, 32, 64, -32
    def c1, 0.03125, -0.5, 0.699999988, -10
    def c2, 0, 0.0500000007, 0.100000001, 0
    dcl_position v0
    dcl_texcoord v1
    dcl_2d s0
    dcl_2d s1
    dcl_position o0
    dcl_texcoord9 o10
    dcl_color o1
    dcl_texcoord o2.xy
    dcl_texcoord1 o3.xyz
    texldl r0, v0, s0
    texldl r1, v0, s1
    mul r2.x, r0.x, c0.x
    frc r2.y, r2.x
    add r2.z, r2.x, -r2.y
    slt r2.x, r2.x, -r2.x
    slt r2.y, -r2.y, r2.y
    mad r2.x, r2.x, r2.y, r2.z
    mul r2.y, r2.x, c0.y
    sge r2.y, r2.y, -r2.y
    mad r2.y, r2.y, c0.z, c0.w
    rcp r2.z, r2.y
    mul r2.x, r2.z, r2.x
    frc r2.x, r2.x
    mul r2.x, r2.x, r2.y
    frc r2.y, r2.x
    add r2.z, r2.x, -r2.y
    slt r2.x, r2.x, -r2.x
    slt r2.y, -r2.y, r2.y
    mad r2.x, r2.x, r2.y, r2.z
    mul r2.x, r2.x, c1.x
    if_ge -r1_abs.w, r1_abs.w
      mad r1.w, c65.y, r2.x, c65.x
      add r2.y, c1.y, v1.x
      nrm r3.xyz, r1
      add r4.xyz, -r0.yzxw, c15.yzxw
      dp3 r2.z, r4, r4
      rsq r2.z, r2.z
      mul r4.xyz, r2.z, r4
      mul r5.xyz, r3.zxyw, r4
      mad r4.xyz, r3.yzxw, r4.yzxw, -r5
      nrm r5.xyz, r4
      mul r1.xyz, r1, c64.x
      mad r1.xyz, r1.w, r3, r1
      mul r3.xyz, r1.w, r5
      add r1.w, c1.z, -v1.y
      mul r1.xyz, -r1, r1.w
      mad r1.xyz, r2.y, r3, r1
      add r1.xyz, r0, r1
      mul r3, r1.y, c9
      mad r3, r1.x, c8, r3
      mad r3, r1.z, c10, r3
      add o0, r3, c11
    add o10.zw, r3, c11
      mov r3.xy, c2
      add o1, r3.xxxy, c67
      mov o3.xyz, r1
      mov r1.x, v1.x
    else
      mad r1.z, c65.w, r2.x, c65.z
      add r2.xy, c1.y, v1
      nrm r3.xyz, c12
      mul r3.xyz, r1.z, r3
      nrm r4.xyz, -c13
      mul r4.xyz, r1.z, r4
      mul r2.yzw, r2.y, r4.xxyz
      mad r2.xyz, r2.x, r3, r2.yzww
      add r0.xyz, r0, r2
      mul r2, r0.y, c9
      mad r2, r0.x, c8, r2
      mad r2, r0.z, c10, r2
      add o0, r2, c11
    add o10.zw, r2, c11
      mad r0.w, r0.w, c66.x, -c66.y
      frc r1.z, r0.w
      add r1.w, r0.w, -r1.z
      slt r0.w, r0.w, -r0.w
      slt r1.z, -r1.z, r1.z
      mad r0.w, r0.w, r1.z, r1.w
      mul_sat r0.w, r0.w, c66.z
      mad r0.w, c66.z, v1.x, r0.w
      add r1.x, r0.w, c1.w
      mov r2.xz, c2
      add o1, r2.xxxz, c68
      mov o3.xyz, r0
    endif
    mov r1.y, v1.y
    mov o2.xy, r1
    mov r20.x, c8.w
    add r20.x, r20.x, c9.w
    add r20.x, r20.x, c10.w
    add o10.y, r20.x, c11.w
    
// approximately 88 instruction slots used (4 texture, 84 arithmetic)