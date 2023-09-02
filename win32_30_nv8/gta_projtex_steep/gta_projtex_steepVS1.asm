//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   float BoundRadius;
//   sampler2D DamageSampler;
//   float4x3 gBoneMtx[48];
//   float4 gDayNightEffects;
//   row_major float4x4 gViewInverse;
//   row_major float4x4 gWorld;
//   row_major float4x4 gWorldViewProj;
//   float4 globalScalars;
//   float4 globalScalars2;
//   bool switchOn;
//
//
// Registers:
//
//   Name             Reg   Size
//   ---------------- ----- ----
//   switchOn         b8       1
//   gWorld           c0       4
//   gWorldViewProj   c8       4
//   gViewInverse     c12      4
//   globalScalars    c39      1
//   globalScalars2   c40      1
//   gDayNightEffects c45      1
//   gBoneMtx         c64    144
//   BoundRadius      c208     1
//   DamageSampler    s0       1
//

    vs_3_0
    def c0, 9.99999975e-006, 1, 0.5, 126.732674
    def c1, 0, 0.00789062493, 1.52587891e-005, 65536
    def c2, 0.00390625, 256, -128, 0.0078125
    def c4, 9.99999994e-009, 0, 1, 765.005859
    def c5, -0.5, -0.492109388, 2, 1
    dcl_position v0
    dcl_blendweight v1
    dcl_blendindices v2
    dcl_texcoord v3
    dcl_normal v4
    dcl_tangent v5
    dcl_color v6
    dcl_2d s0
    dcl_position o0
    dcl_texcoord9 o10
    dcl_texcoord o1.xy
    dcl_texcoord1 o2
    dcl_texcoord3 o3.xyz
    dcl_texcoord4 o4.xyz
    dcl_texcoord5 o5.xyz
    dcl_color o6
    dcl_texcoord6 o7
    dcl_texcoord7 o8
    if b8
      dp3 r0.x, v0, v0
      rsq r0.x, r0.x
      rcp r0.x, r0.x
      add r0.y, r0.x, c0.x
      rcp r0.y, r0.y
      mad r0.z, v0.z, -r0.y, c0.y
      mul r0.z, r0.z, c0.z
      mad r0.yw, v0.xxzy, r0.y, c0.x
      mul r1.xy, r0.ywzw, r0.ywzw
      add r1.x, r1.y, r1.x
      rsq r1.x, r1.x
      mul r0.yw, r0, r1.x
      mul r0.yz, r0.z, r0.xyww
      mad r1.xy, r0.yzzw, c0.z, c0.z
      mul r0.yz, r1.xxyw, c0.w
      frc r2.xy, r0_abs.yzzw
      sge r0.yz, r0, -r0
      lrp r3.xy, r0.yzzw, r2, -r2
      mov r1.zw, c1.x
      texldl r2, r1, s0
      mad r0.yz, r3.xxyw, -c1.y, r1.xxyw
      add r1.xy, r0.yzzw, c1.yxzw
      mov r1.zw, c1.x
      texldl r1, r1, s0
      add r4.xy, r0.yzzw, c1
      mov r4.zw, c1.x
      texldl r4, r4, s0
      add r5.xy, r0.yzzw, c1.y
      mov r5.zw, c1.x
      texldl r5, r5, s0
      mul r0.w, r2.x, c1.z
      frc r1.y, r0.w
      add r1.z, r0.w, -r1.y
      slt r0.w, r0.w, -r0.w
      slt r1.y, -r1.y, r1.y
      mad r6.z, r0.w, r1.y, r1.z
      mad r0.w, r6.z, -c1.w, r2.x
      mul r1.y, r0.w, c2.x
      frc r1.z, r1.y
      add r1.w, r1.y, -r1.z
      slt r1.y, r1.y, -r1.y
      slt r1.z, -r1.z, r1.z
      mad r6.y, r1.y, r1.z, r1.w
      mad r6.x, r6.y, -c2.y, r0.w
      mul r0.w, r1.x, c1.z
      frc r1.y, r0.w
      add r1.z, r0.w, -r1.y
      slt r0.w, r0.w, -r0.w
      slt r1.y, -r1.y, r1.y
      mad r2.z, r0.w, r1.y, r1.z
      mad r0.w, r2.z, -c1.w, r1.x
      mul r1.x, r0.w, c2.x
      frc r1.y, r1.x
      add r1.z, r1.x, -r1.y
      slt r1.x, r1.x, -r1.x
      slt r1.y, -r1.y, r1.y
      mad r2.y, r1.x, r1.y, r1.z
      mad r2.x, r2.y, -c2.y, r0.w
      mul r0.w, r4.x, c1.z
      frc r1.x, r0.w
      add r1.y, r0.w, -r1.x
      slt r0.w, r0.w, -r0.w
      slt r1.x, -r1.x, r1.x
      mad r1.z, r0.w, r1.x, r1.y
      mad r0.w, r1.z, -c1.w, r4.x
      mul r1.w, r0.w, c2.x
      frc r2.w, r1.w
      add r3.z, r1.w, -r2.w
      slt r1.w, r1.w, -r1.w
      slt r2.w, -r2.w, r2.w
      mad r1.y, r1.w, r2.w, r3.z
      mad r1.x, r1.y, -c2.y, r0.w
      mul r0.w, r5.x, c1.z
      frc r1.w, r0.w
      add r2.w, r0.w, -r1.w
      slt r0.w, r0.w, -r0.w
      slt r1.w, -r1.w, r1.w
      mad r4.z, r0.w, r1.w, r2.w
      mad r0.w, r4.z, -c1.w, r5.x
      mul r1.w, r0.w, c2.x
      frc r2.w, r1.w
      add r3.z, r1.w, -r2.w
      slt r1.w, r1.w, -r1.w
      slt r2.w, -r2.w, r2.w
      mad r4.y, r1.w, r2.w, r3.z
      mad r4.x, r4.y, -c2.y, r0.w
      add r3.zw, -r3.xyxy, c0.y
      mul r5.xyz, r6, r3.z
      mul r7.xyz, r3.x, r2
      mul r7.xyz, r3.w, r7
      mad r5.xyz, r5, r3.w, r7
      mul r7.xyz, r1, r3.z
      mad r5.xyz, r7, r3.y, r5
      mul r3.xzw, r3.x, r4.xyyz
      mad r3.xyz, r3.xzww, r3.y, r5
      add r3.xyz, r3, c2.z
      mul r3.xyz, r3, c2.w
      rcp r0.w, c208.x
      mul r0.x, r0.x, r0.w
      min r0.x, r0.x, c0.y
      mul r3.xyz, r3, r0.x
      mad r3.xyz, r3, c0.z, v0
      add r4.xyz, -c0.y, v4
      sge r4.xyz, -r4_abs, r4_abs
      mul r0.w, r4.y, r4.x
      mul r0.w, r4.z, r0.w
      if_ne r0.w, -r0.w
        mul r4.xyz, c4.yyzw, v4.z
      else
        add r5, r0.yzyz, c5.xxyx
        add r5, r5, r5
        mul r7, r5, r5
        add r7.xy, r7.ywzw, r7.xzzw
        slt r7.zw, c1.x, r7.xyxy
        rsq r0.w, r7.x
        rcp r0.w, r0.w
        mul r0.w, r7.z, r0.w
        mad r1.w, r0.w, -c5.z, c5.w
        slt r2.w, r1.w, -c0.y
        lrp r8.z, r2.w, -c0.y, r1.w
        slt r1.w, r8.z, c0.y
        slt r2.w, -c0.y, r8.z
        mul r1.w, r1.w, r2.w
        slt r2.w, c1.x, r0.w
        mul r1.w, r1.w, r2.w
        mad r2.w, r8.z, -r8.z, c0.y
        rsq r2.w, r2.w
        rcp r2.w, r2.w
        rcp r0.w, r0.w
        mul r0.w, r2.w, r0.w
        mul r0.w, r1.w, r0.w
        mul r8.xy, r5, r0.w
        add r6.xyz, r6, c2.z
        mul r6.xyz, r0.x, r6
        mul r6.xyz, r6, c2.x
        rsq r0.w, r7.y
        rcp r0.w, r0.w
        mul r0.w, r7.w, r0.w
        mad r1.w, r0.w, -c5.z, c5.w
        slt r2.w, r1.w, -c0.y
        lrp r7.z, r2.w, -c0.y, r1.w
        slt r1.w, r7.z, c0.y
        slt r2.w, -c0.y, r7.z
        mul r1.w, r1.w, r2.w
        slt r2.w, c1.x, r0.w
        mul r1.w, r1.w, r2.w
        mad r2.w, r7.z, -r7.z, c0.y
        rsq r2.w, r2.w
        rcp r2.w, r2.w
        rcp r0.w, r0.w
        mul r0.w, r2.w, r0.w
        mul r0.w, r1.w, r0.w
        mul r7.xy, r5.zwzw, r0.w
        add r5.xyz, r7, c4.x
        add r2.xyz, r2, c2.z
        mul r2.xyz, r0.x, r2
        add r5.xyz, -r8, r5
        mad r2.xyz, r2, c2.x, -r6
        dp3 r0.w, r2, v4
        dp3 r1.w, r5, r5
        slt r2.x, c1.x, r1.w
        rcp r1.w, r1.w
        mul r0.w, -r0.w, r1.w
        mul r2.yzw, r5.xxyz, r0.w
        mad r2.xyz, r2.x, r2.yzww, v4
        add r0.yz, r0, c5.xxyw
        add r0.yz, r0, r0
        mul r5.xy, r0.yzzw, r0.yzzw
        add r0.w, r5.y, r5.x
        slt r1.w, c1.x, r0.w
        rsq r0.w, r0.w
        rcp r0.w, r0.w
        mul r0.w, r1.w, r0.w
        mad r1.w, r0.w, -c5.z, c5.w
        slt r2.w, r1.w, -c0.y
        lrp r5.z, r2.w, -c0.y, r1.w
        slt r1.w, r5.z, c0.y
        slt r2.w, -c0.y, r5.z
        mul r1.w, r1.w, r2.w
        slt r2.w, c1.x, r0.w
        mul r1.w, r1.w, r2.w
        mad r2.w, r5.z, -r5.z, c0.y
        rsq r2.w, r2.w
        rcp r2.w, r2.w
        rcp r0.w, r0.w
        mul r0.w, r2.w, r0.w
        mul r0.w, r1.w, r0.w
        mul r5.xy, r0.yzzw, r0.w
        add r0.yzw, r1.xxyz, c2.z
        mul r0.xyz, r0.x, r0.yzww
        add r1.xyz, -r8, r5
        mad r0.xyz, r0, c2.x, -r6
        dp3 r0.x, r0, v4
        dp3 r0.y, r1, r1
        slt r0.z, c1.x, r0.y
        rcp r0.y, r0.y
        mul r0.x, -r0.x, r0.y
        mul r0.xyw, r1.xyzz, r0.x
        mad r0.xyz, r0.z, r0.xyww, r2
        nrm r4.xyz, r0
      endif
    else
      mov r3.xyz, v0
      mov r4.xyz, v4
    endif
    mul r0, c4.w, v2
    mova a0, r0
    mul r0, v1.y, c64[a0.y]
    mul r1, v1.y, c65[a0.y]
    mul r2, v1.y, c66[a0.y]
    mad r0, c64[a0.x], v1.x, r0
    mad r1, c65[a0.x], v1.x, r1
    mad r2, c66[a0.x], v1.x, r2
    mad r0, c64[a0.z], v1.z, r0
    mad r1, c65[a0.z], v1.z, r1
    mad r2, c66[a0.z], v1.z, r2
    mad r0, c64[a0.w], v1.w, r0
    mad r1, c65[a0.w], v1.w, r1
    mad r2, c66[a0.w], v1.w, r2
    mov r3.w, c0.y
    dp4 r5.x, r3, r0
    dp4 r5.y, r3, r1
    dp4 r5.z, r3, r2
    add r3.xyz, -r5, c15
    dp3 r6.x, r4, r0
    dp3 r6.y, r4, r1
    dp3 r6.z, r4, r2
    dp3 r0.x, v5, r0
    dp3 r0.y, v5, r1
    dp3 r0.z, v5, r2
    mul r1.xyz, r6.yzxw, r0.zxyw
    mad r1.xyz, r0.yzxw, r6.zxyw, -r1
    mul r1.xyz, r1, v5.w
    dp3 o8.x, r0, r3
    dp3 o8.y, r1, r3
    dp3 o8.z, r6, r3
    mul r2, r5.y, c9
    mad r2, r5.x, c8, r2
    mad r2, r5.z, c10, r2
    add r2, r2, c11
    add o7.xyz, r5, c3
    mul r4.xy, c45, v6
    add r0.w, r4.y, r4.x
    mov r4.y, c0.y
    mad r0.w, r0.w, c39.z, -r4.y
    mad o6.xy, c40.z, r0.w, r4.y
    mov o0, r2
    mov o10.zw, r2
    mov o1.xy, v3
    mov o2.w, r2.w
    mov o2.xyz, r6
    mov o3.xyz, r3
    mov o4.xyz, r0
    mov o5.xyz, r1
    mov o6.zw, v6
    mov o7.w, c0.y
    mov o8.w, c0.y
    mov r20.x, c8.w
    add r20.x, r20.x, c9.w
    add r20.x, r20.x, c10.w
    add o10.y, r20.x, c11.w
    
// approximately 267 instruction slots used (8 texture, 259 arithmetic)
