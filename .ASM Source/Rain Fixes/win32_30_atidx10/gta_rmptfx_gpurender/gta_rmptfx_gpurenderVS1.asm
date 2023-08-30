// Improved rain visibility
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D PositionTexSampler;
//   sampler2D VelocityTexSampler;
//   float gAmbientAmount;
//   float4 gColorTint;
//   float4 gColorTintPhase2;
//   float4 gDirectionalColour;
//   float4 gDirectionalLight;
//   float4 gLightAmbient0;
//   float4 gLightAmbient1;
//   float4 gLightColB;
//   float4 gLightColG;
//   float4 gLightColR;
//   float4 gLightConeOffset;
//   float4 gLightConeOffset2;
//   float4 gLightConeScale;
//   float4 gLightConeScale2;
//   float4 gLightDir2X;
//   float4 gLightDir2Y;
//   float4 gLightDir2Z;
//   float4 gLightDirX;
//   float4 gLightDirY;
//   float4 gLightDirZ;
//   float4 gLightFallOff;
//   float4 gLightPointFallOff;
//   float4 gLightPointPosX;
//   float4 gLightPointPosY;
//   float4 gLightPointPosZ;
//   float4 gLightPosX;
//   float4 gLightPosY;
//   float4 gLightPosZ;
//   float gMotionBlur;
//   float4 gRadius;
//   float4 gTextureAnimation;
//   row_major float4x4 gViewInverse;
//   row_major float4x4 gWorldView;
//   row_major float4x4 gWorldViewProj;
//   float gWrapBias;
//   float gWrapScale;
//
//
// Registers:
//
//   Name               Reg   Size
//   ------------------ ----- ----
//   gWorldView         c4       3
//   gWorldViewProj     c8       4
//   gViewInverse       c12      4
//   gDirectionalLight  c17      1
//   gDirectionalColour c18      1
//   gLightPosX         c19      1
//   gLightPosY         c20      1
//   gLightPosZ         c21      1
//   gLightDirX         c22      1
//   gLightDirY         c23      1
//   gLightDirZ         c24      1
//   gLightFallOff      c25      1
//   gLightConeScale    c26      1
//   gLightConeOffset   c27      1
//   gLightColR         c29      1
//   gLightColG         c30      1
//   gLightColB         c31      1
//   gLightAmbient0     c37      1
//   gLightAmbient1     c38      1
//   gLightPointPosX    c64      1
//   gLightPointPosY    c65      1
//   gLightPointPosZ    c66      1
//   gLightPointFallOff c67      1
//   gLightDir2X        c68      1
//   gLightDir2Y        c69      1
//   gLightDir2Z        c70      1
//   gLightConeScale2   c71      1
//   gLightConeOffset2  c72      1
//   gMotionBlur        c73      1
//   gRadius            c74      1
//   gTextureAnimation  c75      1
//   gColorTint         c76      1
//   gColorTintPhase2   c77      1
//   gWrapScale         c78      1
//   gWrapBias          c79      1
//   gAmbientAmount     c80      1
//   PositionTexSampler s0       1
//   VelocityTexSampler s1       1
//

    vs_3_0
    def c0, 0, 0.5, -0.5, 0.699999988
    def c1, 0.0500000007, -10, 0.100000001, 9.99999975e-006
    def c2, 1, 1.11111116, 0.200000003, 0
	def c3, 4, 0, 0, 0.25
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
    if_ge -r1_abs.w, r1_abs.w
      mov r2.xy, c0
      mad r2.xyz, c74.x, r2.xxyw, r0
      add r1.w, c0.z, v1.x
      nrm r3.xyz, r1
      add r4.xyz, -r2.yzxw, c15.yzxw
      dp3 r2.w, r4, r4
      rsq r2.w, r2.w
      mul r4.xyz, r4, r2.w
      mul r5.xyz, r3.zxyw, r4
      mad r4.xyz, r3.yzxw, r4.yzxw, -r5
      nrm r5.xyz, r4
      mul r1.xyz, r1, c73.x
      mad r1.xyz, c74.x, r3, r1
      mul r3.xyz, r5, c74.x
      add r2.w, c0.w, -v1.y
      mul r1.xyz, -r1, r2.w
      mad r1.xyz, r1.w, r3, r1
      nrm r3.xyz, r1
      add r1.xyz, r2, r1
      mul r2, r1.y, c9
      mad r2, r1.x, c8, r2
      mad r2, r1.z, c10, r2
      add o0, r2, c11
    add o10, r2, c11
      mov r2.x, c1.x
      add r1.w, r2.x, c76.w
      mov r2.xyz, c76
      mov o3.xyz, r1
      mov r4.x, v1.x
    else
      mov r5.xy, c0
      mad r5, c74.z, r5.xxyx, r0
      add r4.zw, c0.z, v1.xyxy
      nrm r6.xyz, c12
      mul r6.xyz, r6, c74.z
      nrm r7.xyz, -c13
      mul r7.xyz, r7, c74.z
      mul r7.xyz, r4.w, r7
      mad r6.xyz, r4.z, r6, r7
      nrm r3.xyz, r6
      add r1.xyz, r5, r6
      mul r6, r1.y, c9
      mad r6, r1.x, c8, r6
      mad r6, r1.z, c10, r6
      add o0, r6, c11
    add o10, r6, c11
      mad r0.w, r5.w, c75.x, -c75.y
      frc r2.w, r0.w
      add r3.w, r0.w, -r2.w
      slt r0.w, r0.w, -r0.w
      slt r2.w, -r2.w, r2.w
      mad r0.w, r0.w, r2.w, r3.w
      mul_sat r0.w, r0.w, c75.z
      mad r0.w, c75.z, v1.x, r0.w
      add r4.x, r0.w, c1.y
      mov r4.z, c1.z
      add r1.w, r4.z, c77.w
      mov r2.xyz, c77
      mov o3.xyz, r1
    endif
    add r5, -r1.x, c19
    add r6, -r1.y, c20
    add r7, -r1.z, c21
    mul r8, r5, r5
    mad r8, r6, r6, r8
    mad r8, r7, r7, r8
    add r9, r8, c1.w
    rsq r10.x, r9.x
    rsq r10.y, r9.y
    rsq r10.z, r9.z
    rsq r10.w, r9.w
    mov r9.x, c2.x
    mad r8, r8, -c25, r9.x
    max r8, r8, c0.x
    mul r8, r8, r8
    mad r8, r8, r8, -c1.z
    max r8, r8, c0.x
    mul r8, r8, c2.y
    min r8, r8, c2.x
    mov r11.x, r5.x
    mov r11.y, r6.x
    mov r11.z, r7.x
    add r9.yzw, r11.xxyz, c1.w
    nrm r11.xyz, r9.yzww
    mov r12.x, r5.y
    mov r12.y, r6.y
    mov r12.z, r7.y
    add r9.yzw, r12.xxyz, c1.w
    nrm r12.xyz, r9.yzww
    mov r7.x, r5.z
    mov r7.y, r6.z
    add r5.xyz, r7, c1.w
    nrm r13.xyz, r5
    mov r7.x, r5.w
    mov r7.y, r6.w
    add r5.xyz, r7.xyww, c1.w
    nrm r6.xyz, r5
    mov r5.x, r11.x
    mov r5.y, r12.x
    mov r5.z, r13.x
    mov r5.w, r6.x
    mul r7, r5, -c22
    mov r14.x, r11.y
    mov r14.y, r12.y
    mov r14.z, r13.y
    mov r14.w, r6.y
    mad r7, r14, -c23, r7
    mov r13.x, r11.z
    mov r13.y, r12.z
    mov r13.w, r6.z
    mad r6, r13, -c24, r7
    mov r7, c26
    mad_sat r6, r6, r7, c27
    mul r6, r8, r6
    mul r6, r10, r6
    mul r5, r5, r6
    mul r7, r14, r6
    mul r6, r13, r6
    add r8, -r1.x, c64
    add r10, -r1.y, c65
    add r11, -r1.z, c66
    mul r12, r8, r8
    mad r12, r10, r10, r12
    mad r12, r11, r11, r12
    add r13, r12, c1.w
    rsq r14.x, r13.x
    rsq r14.y, r13.y
    rsq r14.z, r13.z
    rsq r14.w, r13.w
    mad r9, r12, -c67, r9.x
    max r9, r9, c0.x
    mul r9, r9, r9
    mad r9, r9, r9, -c1.z
    max r9, r9, c0.x
    mul r9, r9, c2.y
    min r9, r9, c2.x
    mov r1.x, r8.x
    mov r1.y, r10.x
    mov r1.z, r11.x
    add r1.xyz, r1, c1.w
    nrm r12.xyz, r1
    mov r1.x, r8.y
    mov r1.y, r10.y
    mov r1.z, r11.y
    add r1.xyz, r1, c1.w
    nrm r13.xyz, r1
    mov r11.x, r8.z
    mov r11.y, r10.z
    add r1.xyz, r11, c1.w
    nrm r15.xyz, r1
    mov r11.x, r8.w
    mov r11.y, r10.w
    add r1.xyz, r11.xyww, c1.w
    nrm r8.xyz, r1
    mov r10.x, r12.x
    mov r10.y, r13.x
    mov r10.z, r15.x
    mov r10.w, r8.x
    mul r11, r10, -c68
    mov r16.x, r12.y
    mov r16.y, r13.y
    mov r16.z, r15.y
    mov r16.w, r8.y
    mad r11, r16, -c69, r11
    mov r15.x, r12.z
    mov r15.y, r13.z
    mov r15.w, r8.z
    mad r8, r15, -c70, r11
    mov r11, c71
    mad_sat r8, r8, r11, c72
    mul r8, r9, r8
    mul r8, r14, r8
    mul r9, r10, r8
    mul r10, r16, r8
    mul r11, r15, r8
    mul r0.w, r8.x, c79.x
    dp3 r1.x, r3, -c17
    mad_sat r0.w, r1.x, c78.x, r0.w
    mul r1.xyz, r0.w, c18
    mul r5, r3.x, r5
    mad r5, r3.y, r7, r5
    mad r5, r3.z, r6, r5
    mad_sat r5, c79.x, r8.x, r5
    dp4 r6.x, c29, r5
    dp4 r6.y, c30, r5
    dp4 r6.z, c31, r5
	// ---------------------------------------------------------- Improved Rain Visibility ----------------------------------------------------------
	mov r20, c3
	mul r21.x, c80.x, r20.x	// increase ambient influence
	mul r21.w, c18.w, r20.w	// decrease directional influence
	// ----------------------------------------------------------------------------------------------------------------------------------------------
    mad r5.xyz, r1, r21.w, r6
    dp3 r0.w, r3, c6
    mad_sat r0.w, r0.w, c0.z, c0.y
    mov r6.xyz, c38
    mad r6.xyz, r6, r0.w, c37
    mad r5.xyz, r6, r21.x, r5
    mul r7, r3.x, r9
    mad r7, r3.y, r10, r7
    mad r3, r3.z, r11, r7
    mad_sat r3, c79.x, r8.x, r3
    dp4 r7.x, c29, r3
    dp4 r7.y, c30, r3
    dp4 r7.z, c31, r3
    mad r1.xyz, r1, r21.w, r7
    mad r1.xyz, r6, r21.x, r1
    add r1.xyz, r5, r1
    mul o1.xyz, r2, r1
    add r0.xyz, -r0, c15
    dp3 r0.x, r0, r0
    rsq r0.x, r0.x
    rcp r0.x, r0.x
    mul r0.x, r0.x, c2.z
    mul r0.y, r0.x, r0.x
    mul r0.x, r0.x, r0.y
    min r0.x, r0.x, c2.x
    mul o1.w, r1.w, r0.x
    mov r4.y, v1.y
    mov o2.xy, r4

// approximately 247 instruction slots used (4 texture, 243 arithmetic)
