//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   float BoundRadius;
//   sampler2D DamageSampler;
//   row_major float4x4 gViewInverse;
//   row_major float4x4 gWorld;
//   row_major float4x4 gWorldViewProj;
//   bool switchOn;
//
//
// Registers:
//
//   Name           Reg   Size
//   -------------- ----- ----
//   switchOn       b8       1
//   gWorld         c0       4
//   gWorldViewProj c8       4
//   gViewInverse   c12      4
//   BoundRadius    c208     1
//   DamageSampler  s0       1
//

    vs_3_0
    def c4, 9.99999975e-006, 1, 0.5, 126.732674
    def c5, 0, 0.00789062493, 1.52587891e-005, 65536
    def c6, 0.00390625, 256, -128, 0.0078125
    def c7, 9.99999994e-009, 1, 0, 0
    def c12, -0.5, -0.492109388, 2, 1
    dcl_position v0
    dcl_color v1
    dcl_texcoord v2
    dcl_normal v3
    dcl_tangent v4
    dcl_2d s0
    dcl_position o0
    dcl_texcoord o1.xy
    dcl_texcoord1 o2
    dcl_texcoord3 o3.xyz
    dcl_texcoord4 o4.xyz
    dcl_texcoord5 o5.xyz
    dcl_color o6
    dcl_texcoord2 o7
    if b8
      dp3 r0.x, v0, v0
      rsq r0.x, r0.x
      rcp r0.x, r0.x
      add r0.y, r0.x, c4.x
      rcp r0.y, r0.y
      mad r0.z, v0.z, -r0.y, c4.y
      mul r0.z, r0.z, c4.z
      mad r0.yw, v0.xxzy, r0.y, c4.x
      mul r1.xy, r0.ywzw, r0.ywzw
      add r1.x, r1.y, r1.x
      rsq r1.x, r1.x
      mul r0.yw, r0, r1.x
      mul r0.yz, r0.z, r0.xyww
      mad r1.xy, r0.yzzw, c4.z, c4.z
      mul r0.yz, r1.xxyw, c4.w
      frc r2.xy, r0_abs.yzzw
      sge r0.yz, r0, -r0
      lrp r3.xy, r0.yzzw, r2, -r2
      mov r1.zw, c5.x
      texldl r2, r1, s0
      mad r0.yz, r3.xxyw, -c5.y, r1.xxyw
      add r1.xy, r0.yzzw, c5.yxzw
      mov r1.zw, c5.x
      texldl r1, r1, s0
      add r4.xy, r0.yzzw, c5
      mov r4.zw, c5.x
      texldl r4, r4, s0
      add r5.xy, r0.yzzw, c5.y
      mov r5.zw, c5.x
      texldl r5, r5, s0
      mul r0.w, r2.x, c5.z
      frc r1.y, r0.w
      add r1.z, r0.w, -r1.y
      slt r0.w, r0.w, -r0.w
      slt r1.y, -r1.y, r1.y
      mad r6.z, r0.w, r1.y, r1.z
      mad r0.w, r6.z, -c5.w, r2.x
      mul r1.y, r0.w, c6.x
      frc r1.z, r1.y
      add r1.w, r1.y, -r1.z
      slt r1.y, r1.y, -r1.y
      slt r1.z, -r1.z, r1.z
      mad r6.y, r1.y, r1.z, r1.w
      mad r6.x, r6.y, -c6.y, r0.w
      mul r0.w, r1.x, c5.z
      frc r1.y, r0.w
      add r1.z, r0.w, -r1.y
      slt r0.w, r0.w, -r0.w
      slt r1.y, -r1.y, r1.y
      mad r2.z, r0.w, r1.y, r1.z
      mad r0.w, r2.z, -c5.w, r1.x
      mul r1.x, r0.w, c6.x
      frc r1.y, r1.x
      add r1.z, r1.x, -r1.y
      slt r1.x, r1.x, -r1.x
      slt r1.y, -r1.y, r1.y
      mad r2.y, r1.x, r1.y, r1.z
      mad r2.x, r2.y, -c6.y, r0.w
      mul r0.w, r4.x, c5.z
      frc r1.x, r0.w
      add r1.y, r0.w, -r1.x
      slt r0.w, r0.w, -r0.w
      slt r1.x, -r1.x, r1.x
      mad r1.z, r0.w, r1.x, r1.y
      mad r0.w, r1.z, -c5.w, r4.x
      mul r1.w, r0.w, c6.x
      frc r2.w, r1.w
      add r3.z, r1.w, -r2.w
      slt r1.w, r1.w, -r1.w
      slt r2.w, -r2.w, r2.w
      mad r1.y, r1.w, r2.w, r3.z
      mad r1.x, r1.y, -c6.y, r0.w
      mul r0.w, r5.x, c5.z
      frc r1.w, r0.w
      add r2.w, r0.w, -r1.w
      slt r0.w, r0.w, -r0.w
      slt r1.w, -r1.w, r1.w
      mad r4.z, r0.w, r1.w, r2.w
      mad r0.w, r4.z, -c5.w, r5.x
      mul r1.w, r0.w, c6.x
      frc r2.w, r1.w
      add r3.z, r1.w, -r2.w
      slt r1.w, r1.w, -r1.w
      slt r2.w, -r2.w, r2.w
      mad r4.y, r1.w, r2.w, r3.z
      mad r4.x, r4.y, -c6.y, r0.w
      add r3.zw, -r3.xyxy, c4.y
      mul r5.xyz, r6, r3.z
      mul r7.xyz, r3.x, r2
      mul r7.xyz, r3.w, r7
      mad r5.xyz, r5, r3.w, r7
      mul r7.xyz, r1, r3.z
      mad r5.xyz, r7, r3.y, r5
      mul r3.xzw, r3.x, r4.xyyz
      mad r3.xyz, r3.xzww, r3.y, r5
      add r3.xyz, r3, c6.z
      mul r3.xyz, r3, c6.w
      rcp r0.w, c208.x
      mul r0.x, r0.x, r0.w
      min r0.x, r0.x, c4.y
      mul r3.xyz, r3, r0.x
      mad r3.xyz, r3, c4.z, v0
      add r4.xyz, -c4.y, v3
      sge r4.xyz, -r4_abs, r4_abs
      mul r0.w, r4.y, r4.x
      mul r0.w, r4.z, r0.w
      if_ne r0.w, -r0.w
        mov r4.x, c5.x
        mov r0.w, c5.x
        mov r1.w, v3.z
      else
        add r5, r0.yzyz, c12.xxyx
        add r5, r5, r5
        mul r7, r5, r5
        add r7.xy, r7.ywzw, r7.xzzw
        slt r7.zw, c5.x, r7.xyxy
        rsq r2.w, r7.x
        rcp r2.w, r2.w
        mul r2.w, r7.z, r2.w
        mad r3.w, r2.w, -c12.z, c12.w
        slt r4.w, r3.w, -c4.y
        lrp r8.z, r4.w, -c4.y, r3.w
        slt r3.w, r8.z, c4.y
        slt r4.w, -c4.y, r8.z
        mul r3.w, r3.w, r4.w
        slt r4.w, c5.x, r2.w
        mul r3.w, r3.w, r4.w
        mad r4.w, r8.z, -r8.z, c4.y
        rsq r4.w, r4.w
        rcp r4.w, r4.w
        rcp r2.w, r2.w
        mul r2.w, r4.w, r2.w
        mul r2.w, r3.w, r2.w
        mul r8.xy, r5, r2.w
        add r6.xyz, r6, c6.z
        mul r6.xyz, r0.x, r6
        mul r6.xyz, r6, c6.x
        rsq r2.w, r7.y
        rcp r2.w, r2.w
        mul r2.w, r7.w, r2.w
        mad r3.w, r2.w, -c12.z, c12.w
        slt r4.w, r3.w, -c4.y
        lrp r7.z, r4.w, -c4.y, r3.w
        slt r3.w, r7.z, c4.y
        slt r4.w, -c4.y, r7.z
        mul r3.w, r3.w, r4.w
        slt r4.w, c5.x, r2.w
        mul r3.w, r3.w, r4.w
        mad r4.w, r7.z, -r7.z, c4.y
        rsq r4.w, r4.w
        rcp r4.w, r4.w
        rcp r2.w, r2.w
        mul r2.w, r4.w, r2.w
        mul r2.w, r3.w, r2.w
        mul r7.xy, r5.zwzw, r2.w
        add r5.xyz, r7, c7.x
        add r2.xyz, r2, c6.z
        mul r2.xyz, r0.x, r2
        add r5.xyz, -r8, r5
        mad r2.xyz, r2, c6.x, -r6
        dp3 r2.x, r2, v3
        dp3 r2.y, r5, r5
        slt r2.z, c5.x, r2.y
        rcp r2.y, r2.y
        mul r2.x, -r2.x, r2.y
        mul r2.xyw, r5.xyzz, r2.x
        mad r2.xyz, r2.z, r2.xyww, v3
        add r0.yz, r0, c12.xxyw
        add r0.yz, r0, r0
        mul r5.xy, r0.yzzw, r0.yzzw
        add r2.w, r5.y, r5.x
        slt r3.w, c5.x, r2.w
        rsq r2.w, r2.w
        rcp r2.w, r2.w
        mul r2.w, r3.w, r2.w
        mad r3.w, r2.w, -c12.z, c12.w
        slt r4.w, r3.w, -c4.y
        lrp r5.z, r4.w, -c4.y, r3.w
        slt r3.w, r5.z, c4.y
        slt r4.w, -c4.y, r5.z
        mul r3.w, r3.w, r4.w
        slt r4.w, c5.x, r2.w
        mul r3.w, r3.w, r4.w
        mad r4.w, r5.z, -r5.z, c4.y
        rsq r4.w, r4.w
        rcp r4.w, r4.w
        rcp r2.w, r2.w
        mul r2.w, r4.w, r2.w
        mul r2.w, r3.w, r2.w
        mul r5.xy, r0.yzzw, r2.w
        add r1.xyz, r1, c6.z
        mul r0.xyz, r0.x, r1
        add r1.xyz, -r8, r5
        mad r0.xyz, r0, c6.x, -r6
        dp3 r0.x, r0, v3
        dp3 r0.y, r1, r1
        slt r0.z, c5.x, r0.y
        rcp r0.y, r0.y
        mul r0.x, -r0.x, r0.y
        mul r1.xyz, r1, r0.x
        mad r0.xyz, r0.z, r1, r2
        nrm r4.xyz, r0
        mov r0.w, r4.y
        mov r1.w, r4.z
      endif
    else
      mov r3.xyz, v0
      mov r4.x, v3.x
      mov r0.w, v3.y
      mov r1.w, v3.z
    endif
    mul r0.xyz, r3.y, c1
    mad r0.xyz, r3.x, c0, r0
    mad r0.xyz, r3.z, c2, r0
    add r0.xyz, r0, c3
    add r1.xyz, r0, c3
    add o3.xyz, -r1, c15
    mul r1.xyz, r0.w, c1
    mad r1.xyz, r4.x, c0, r1
    mad r1.xyz, r1.w, c2, r1
    add r1.xyz, r1, c4.x
    nrm r2.xyz, r1
    mul r1.xyz, c1, v4.y
    mad r1.xyz, v4.x, c0, r1
    mad r1.xyz, v4.z, c2, r1
    add r1.xyz, r1, c4.x
    nrm r4.xyz, r1
    mul r1.xyz, r2.yzxw, r4.zxyw
    mad r1.xyz, r4.yzxw, r2.zxyw, -r1
    mul o5.xyz, r1, v4.w
    mul r1, r3.y, c9
    mad r1, r3.x, c8, r1
    mad r1, r3.z, c10, r1
    add r1, r1, c11
    mov o0, r1
    mov o1.xy, v2
    mov o2.w, r1.w
    mov o2.xyz, r2
    mov o4.xyz, r4
    mad o6, v1.xyzx, c7.yyyz, c7.zzzy
    mov o7.xyz, r0
    mov o7.w, c4.y

// approximately 257 instruction slots used (8 texture, 249 arithmetic)