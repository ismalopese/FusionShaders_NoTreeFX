//
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D GBufferTextureSampler0;
//   sampler2D GBufferTextureSampler1;
//   sampler2D GBufferTextureSampler3;
//   row_major float4x4 dShadowMatrix;
//   float4 dShadowOffsetScale;
//   float4 dShadowParam0123;
//   float4 dShadowParam891113;
//   float4 gDeferredLightColourAndIntensity;
//   float gDeferredLightConeOffset;
//   float gDeferredLightConeScale;
//   float3 gDeferredLightDirection;
//   float gDeferredLightInvSqrRadius;
//   float3 gDeferredLightPosition;
//   float4 gDeferredProjParams;
//   sampler2D gShadowZSamplerCache;
//   row_major float4x4 gViewInverse;
//   float4 gooDeferredLightScreenSize;
//
//
// Registers:
//
//   Name                             Reg   Size
//   -------------------------------- ----- ----
//   gViewInverse                     c12      4
//   dShadowParam0123                 c66      1
//   dShadowMatrix                    c72      4
//   dShadowParam891113               c76      1
//   dShadowOffsetScale               c77      1
//   gDeferredLightPosition           c78      1
//   gDeferredLightDirection          c79      1
//   gDeferredLightInvSqrRadius       c80      1
//   gDeferredLightConeOffset         c81      1
//   gDeferredLightConeScale          c82      1
//   gDeferredLightColourAndIntensity c83      1
//   gooDeferredLightScreenSize       c84      1
//   gDeferredProjParams              c85      1
//   GBufferTextureSampler0           s0       1
//   GBufferTextureSampler1           s1       1
//   GBufferTextureSampler3           s2       1
//   gShadowZSamplerCache             s14      1
//

    ps_3_0
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 2.8025969286e-44 // 20
    def c127, 0.9999999, 1, 0, 0	// LogDepth constants
    def c0, 0.50999999, 2, -0.999989986, 9.99999975e-006
    def c1, 1, -0.333333343, 1.5, 0.100000001
    def c2, 1, 0, 0.5, -0.5
    def c3, 3, 4.27199984, 0, 0.75
    def c4, 0.159154937, 0.5, 6.28318548, -3.14159274
    def c5, -1, 1, 0.25, 0
	// ------------------------------------------------------ Improved Shadow Filter Constants ------------------------------------------------------
    def c110, -0.25, 1, -1, 0
    def c111, 0.159154937, 0.5, 6.28318548, -3.14159274
    def c112, 3, 4.27199984, 3, 0.25
    def c113, 0.75, -0.5, 0.5, 0
	defi i1, 4, 0, 0, 0
	// ----------------------------------------------------------------------------------------------------------------------------------------------
    dcl_texcoord v0
    dcl vPos.xy
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s1
    dcl_2d s2
    dcl_2d s14
    add r0.xy, c0.x, vPos
    mul r0.xy, r0, c84.zwzw
    texld r1, r0, s2
	// ----------------------------------------------------------------- Log2Linear -----------------------------------------------------------------
	if_ne r1.x, c127.y
		rcp r20.x, c128.x
		mul r20.x, r20.x, c128.y
		pow r20.x, r20.x, r1.x
		mul r20.x, r20.x, c128.x	// W_clip
		
		add r20.y, r20.x, -c128.x
		add r20.z, c128.y, -c128.x
		mul r20.y, r20.y, c128.y
		mul r20.z, r20.z, r20.x
		rcp r20.z, r20.z
		mul r20.w, r20.y, r20.z		// Linear depth
		
		min r1, r20.w, c127.x		// FP error hack
	endif
	// ----------------------------------------------------------------------------------------------------------------------------------------------
    mad r0.z, r1.x, c85.z, -c85.w
    mul r0.z, r0.z, v0.w
    rcp r0.z, r0.z
    mad r1.xyz, v0, -r0.z, c15
    texld r2, r0, s1
    texld r0, r0, s0
    mad r2.xyz, r2, c0.y, c0.z
    nrm r3.xyz, r2
    mad r2.xyz, r3, c1.w, r1
    add r1.xyz, -r1, c78
    mul r4.xyz, r2.y, c73
    mad r2.xyw, r2.x, c72.xyzz, r4.xyzz
    mad r2.xyz, r2.z, c74, r2.xyww
    add r2.xyz, r2, c75
    add r0.w, r2.z, c76.z
    mov r2.w, -r0_abs.w
    dp3 r1.w, r2.xyww, r2.xyww
    rsq r1.w, r1.w
    rcp r1.w, r1.w
    add r2.z, r0_abs.w, r1.w
    cmp r4.xy, -r0.w, c2, c2.yxzw
    rcp r0.w, r2.z
    mul r2.xy, r2, r0.w
    mad r2.xy, r2, c2.zwzw, c2.z
    /* removed original filter
    dp2add r0.w, vPos, c3, c3.z
    mad r0.w, r0.w, c4.x, c4.y
    frc r0.w, r0.w
    mad r0.w, r0.w, c4.z, c4.w
    sincos r5.xy, r0.w
    mul r2.zw, r5.xyyx, c77.z
    mad_sat r2.zw, r2, c3.w, r2.xyxy
    mad r2.zw, r2, c77.w, c77.xyxy
    texld r6, r2.zwzw, s14
    dp2add r6.y, r6, r4, c2.y
    mul r2.zw, -r5.xyyx, c77.z
    mul r5, r5.xyxy, c5.xyyx
    mad_sat r2.zw, r2, c5.z, r2.xyxy
    mad r2.zw, r2, c77.w, c77.xyxy
    texld r7, r2.zwzw, s14
    dp2add r6.w, r7, r4, c2.y
    mul r2.zw, r5.xyxy, c77.z
    mad_sat r4.zw, r5, c77.z, r2.xyxy
    mad_sat r2.xy, r2.zwzw, c2.z, r2
    mad r2.xy, r2, c77.w, c77
    texld r2, r2, s14
    dp2add r6.z, r2, r4, c2.y
    mad r2.xy, r4.zwzw, c77.w, c77
    texld r2, r2, s14
    dp2add r6.x, r2, r4, c2.y
    mad r2, r1.w, c66.w, r6
    cmp r2, r2, c2.x, c2.y
    dp4 r0.w, r2, c5.z
    removed original filter */
	// ----------------------------------------------------------- Improved Shadow Filter -----------------------------------------------------------
    mov r21.xy, c112.xy
    dp2add r21.y, vPos, r21, c110.w		// v0.x * r21.x + v0.y * r21.y
    mad r21.y, r21.y, c111.x, c111.y
    frc r21.y, r21.y
    mad r21.y, r21.y, c111.z, c111.w	// r21.y * 2pi - pi
    sincos r22.xy, r21.y				// sine & cosine of r21.y

	mov r20.x, c77.z					// copy texel size
	mul r20.x, r20.x, c112.w			// compensate blur for extra iterations
	
	mov r20.zw, c110.w
	
	mov r26, c110.xxyz					// copy offsets for 1st and 4th samples, respectively
	mov r27, c113.xxyz					// copy offsets for 3rd and 2nd samples, respectively
	
	rep i1
		mul r23, r22.yxxy, r26
		mul r21, r22.yxxy, r27
		
		mad_sat r24.xy, r23.xy, r20.x, r2.xy	// offset * texel size + UV
		mad r24.xy, r24, c77.w, c77
		texld r24, r24, s14						// 1st sample
		dp2add r25.x, r24, r4.xy, c110.w		// copy to r25
		mad_sat r24.xy, r21.zw, r20.x, r2.xy	// offset * texel size + UV
		mad r24.xy, r24, c77.w, c77
		texld r24, r24, s14						// 2nd sample
		dp2add r25.y, r24, r4.xy, c110.w		// copy to r25
		mad_sat r24.xy, r21.xy, r20.x, r2.xy	// offset * texel size + UV
		mad r24.xy, r24, c77.w, c77
		texld r24, r24, s14						// 3rd sample
		dp2add r25.z, r24, r4.xy, c110.w		// copy to r25
		mad_sat r24.xy, r23.zw, r20.x, r2.xy	// offset * texel size + UV
		mad r24.xy, r24, c77.w, c77
		texld r24, r24, s14						// 4th sample
		dp2add r25.w, r24, r4.xy, c110.w		// copy to r25
	
		mad r25, r1.w, c66.w, r25				// depth bias
		cmp r25, r25, c110.y, c110.w
		dp4 r20.w, r25, -c110.x					// average samples of current iteration
		add r20.z, r20.z, r20.w
		
		add r26, r26, c110.zzyz				// add (-1, -1, 1, -1)
		add r27, r27, -c110.zzyz			// add (1, 1, -1, 1)
	endrep
	
	mul r0.w, r20.z, c112.w					// average all iterations
	// ----------------------------------------------------------------------------------------------------------------------------------------------
    add r2.xyz, r1, c0.w
    dp3 r1.x, r1, r1
    mov r4.x, c1.x
    mad_sat r1.x, r1.x, -c80.x, r4.x
    mad r1.x, r1.x, r1.x, c1.y
    nrm r4.xyz, r2
    dp3 r1.y, r4, -c79
    dp3 r1.z, r3, r4
    add r1.z, r1.z, c1.y
    mul_sat r1.z, r1.z, c1.z
    add r1.y, r1.y, -c81.x
    mul_sat r1.y, r1.y, c82.x
    mul r1.w, r1.x, c1.z
    mul r1.y, r1.y, r1.w
    mul r1.y, r1.z, r1.y
    mul r0.w, r0.w, r1.y
    mul r1.yzw, c83.w, c83.xxyz
    mul r1.yzw, r0.w, r1
    mul r0.xyz, r0, r1.yzww
    cmp oC0.xyz, r1.x, r0, c2.y
    mov oC0.w, c1.x
	// ----------------------------------------------------------------- Linear2Log -----------------------------------------------------------------
	if_ne v9.y, c127.y
		rcp r20.z, c128.x
		mul r20.x, v9.w, r20.z
		mul r20.y, c128.y, r20.z
		log r20.x, r20.x
		log r20.y, r20.y
		rcp r20.y, r20.y
	else
		mov r20.x, v9.z
		rcp r20.y, v9.w
	endif
	mul oDepth, r20.x, r20.y
	// ----------------------------------------------------------------------------------------------------------------------------------------------

// approximately 92 instruction slots used (7 texture, 85 arithmetic)
