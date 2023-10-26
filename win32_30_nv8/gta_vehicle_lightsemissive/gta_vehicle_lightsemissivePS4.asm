// Disabled PC parameters that cause the dirt level in vehicle.ide to affect reflection intensity + console-like ambient reflection intensity + improved shadow filter + added PCSS thanks to robi29
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D DirtSampler;
//   sampler2D EnvironmentSampler;
//   sampler2D SpecSampler;
//   sampler2D TextureSampler;
//   float3 dirtColor;
//   float dirtLevel;
//   float emissiveMultiplier;
//   float4 gDepthFxParams;
//   float4 gDirectionalColour;
//   float4 gDirectionalLight;
//   float4 gFacetCentre;
//   float4 gLightAmbient0;
//   float4 gLightAmbient1;
//   float4 gLightColB;
//   float4 gLightColG;
//   float4 gLightColR;
//   float4 gLightConeOffset;
//   float4 gLightConeScale;
//   float4 gLightDirX;
//   float4 gLightDirY;
//   float4 gLightDirZ;
//   float4 gLightFallOff;
//   float4 gLightPosX;
//   float4 gLightPosY;
//   float4 gLightPosZ;
//   row_major float4x4 gShadowMatrix;
//   float4 gShadowParam0123;
//   float4 gShadowParam14151617;
//   float4 gShadowParam18192021;
//   float4 gShadowParam4567;
//   float4 gShadowParam891113;
//   sampler2D gShadowZSamplerDir;
//   row_major float4x4 gViewInverse;
//   float4 globalFogColor;
//   float4 globalFogColorN;
//   float4 globalFogParams;
//   float4 globalScalars;
//   float3 matDiffuseColor;
//   float reflectivePowerED;
//   float3 specMapIntMask;
//
//
// Registers:
//
//   Name                 Reg   Size
//   -------------------- ----- ----
//   gViewInverse         c12      4
//   gDepthFxParams       c16      1
//   gDirectionalLight    c17      1
//   gDirectionalColour   c18      1
//   gLightPosX           c19      1
//   gLightPosY           c20      1
//   gLightPosZ           c21      1
//   gLightDirX           c22      1
//   gLightDirY           c23      1
//   gLightDirZ           c24      1
//   gLightFallOff        c25      1
//   gLightConeScale      c26      1
//   gLightConeOffset     c27      1
//   gLightColR           c29      1
//   gLightColG           c30      1
//   gLightColB           c31      1
//   gLightAmbient0       c37      1
//   gLightAmbient1       c38      1
//   globalScalars        c39      1
//   globalFogParams      c41      1
//   globalFogColor       c42      1
//   globalFogColorN      c43      1
//   gShadowParam18192021 c53      1
//   gFacetCentre         c54      1
//   gShadowParam14151617 c56      1
//   gShadowParam0123     c57      1
//   gShadowParam4567     c58      1
//   gShadowParam891113   c59      1
//   gShadowMatrix        c60      4
//   matDiffuseColor      c66      1
//   emissiveMultiplier   c72      1
//   dirtLevel            c73      1
//   dirtColor            c74      1
//   specMapIntMask       c75      1
//   reflectivePowerED    c76      1
//   TextureSampler       s0       1
//   DirtSampler          s1       1
//   SpecSampler          s2       1
//   EnvironmentSampler   s4       1
//   gShadowZSamplerDir   s15      1
//

    ps_3_0
	// ------------------------------------------------------ 1.0.4.0 Shadow Filter Constants -------------------------------------------------------
    def c110, -0.25, 1, -1, 0
    def c111, 0.159154937, 0.5, 6.28318548, -3.14159274
    def c112, 3, 7.13800001, 3, 0.25
    def c113, 0.75, -0.5, 0.5, 0
	defi i1, 4, 0, 0, 0
	// ----------------------------------------------------------------------------------------------------------------------------------------------
	// --------------------------------------------------------- Filter Utilities Constants ---------------------------------------------------------
	def c120, 0.25, 0.5, 0.75, 0 // cascade identifiers
	
    def c121, 1, 0.475, 0, 0.12 // x,y = 1st & 2nd cascade blur | z,w = 1st & 2nd cascade bias
	def c122, 0.19, 0.0542857, 0.4, 0.7 // x,y = 3rd & 4th cascade blur | z,w = 3rd & 4th cascade bias
	
	def c130, 9.5, 0.0246914, 9.210526, 0.15 // smooth distance blur | x = start, y = 1/(end - start), z = maximum blur, w = maximum bias
	def c131, 0.0001220703125, 0.00048828125, 0, 0 // x,y = "Very High" setting texel size
	
	def c132, 0, 1, 2, 3 // filter ID's
	def c133, 0.5, 1, 1.5, 2 // blur multipliers
	
	// PCSS constants
    def c140, 49, 0.2333333, 0.5, 0.045
    def c141, -33, 6, 0, 1
    defi i2, 12, 0, 0, 0
	// ----------------------------------------------------------------------------------------------------------------------------------------------
    def c219, 1.8395173895e+25, 3.9938258725e+24, 4.5435787456e+30, 9.4167256803e-43 // 672
    def c127, 0.9999999, 1, 0, 0	// LogDepth constants
    def c0, 1.33333337, 9.99999975e-005, 190, 1.5
    def c1, 9.99999975e-006, 47.5, 0.224999994, 1
    def c2, 0.800000012, 0.5, 0.200000003, 0
    def c3, 5, 18, -0.5, 0.5
    def c4, 0, 1, -0, -0.25
    def c5, 1, -0.100000001, 1.11111116, 1.00000001e-007
    def c6, 0.212500006, 0.715399981, 0.0720999986, 0
    def c7, 1, -1, 0, -0
    def c8, -0.321940005, -0.932614982, -0.791558981, -0.597710013
    def c9, 0.507430971, 0.0644249991, 0.896420002, 0.412458003
    def c10, 0.519456029, 0.767022014, 0.185461, -0.893123984
    def c11, 0.962339997, -0.194983006, 0.473434001, -0.480026007
    def c12, -0.69591397, 0.457136989, -0.203345001, 0.620715976
    def c13, -0.326211989, -0.405809999, -0.840143979, -0.0735799968
	def c100, 1.6666667, 0, 0, 0	// Reflection intensity multiplier
    dcl_texcoord v0.xy
    dcl_texcoord1 v1
    dcl_texcoord3 v2.xyz
    dcl_color v3
    dcl_texcoord2 v4.xyz
    dcl_texcoord7 v5.xy
    dcl_texcoord9 v9
    dcl_2d s0
    dcl_2d s1
    dcl_2d s2
    dcl_2d s4
    dcl_2d s15
    texld r0, v0, s0
    add r1.xyz, c1.x, v1
    nrm r2.xyz, r1
    texld r1, v0, s2
    mul r1.w, r1.w, c1.w
    mul r2.w, r1.w, c1.y
    dp3 r1.x, r1, c75
    mul r1.x, r1.x, c1.w
    mul r1.x, r1.x, c1.z
    add r3.xyz, c1.x, v2
    nrm r4.xyz, r3
    dp3 r1.y, r4, r2
    add r1.y, -r1_abs.y, c1.w
    mul r1.y, r1.y, r1.y
    mul r1.y, r1.y, r1.y
    mad r1.yz, r1.y, c2.xyxw, c2
    add r1.z, r1.z, r1.z
    min r3.x, r1.x, c1.w
    dp3 r1.x, -r4, r2
    add r1.x, r1.x, r1.x
    mad r3.yzw, r2.xxyz, -r1.x, -r4.xxyz
    add r4.xyz, r3.yzww, c1.x
    nrm r5.xyz, r4
    mov_sat r1.x, r5.z
    add r1.x, r1.x, c1.w
    add r1.x, r1.x, r1.x
    rcp r1.x, r1.x
    mad r4.xy, r5, r1.x, c2.y
    add r4.xy, -r4, c1.w
    mov r4.zw, c2.w
    texldl r4, r4, s4
	mul r4, r4, c100.x
    mul_sat r1.x, r5.z, c3.x
    mul r4.xyz, r4, r1.x
    mul r4.xyz, r1.z, r4
    mul r4.xyz, r4, c1.w
    mul r4.xyz, r4, c3.y
    mul r0.xyz, r0, c66
    mul r5, r0, v3
    mov r4.w, c2.w
    if_lt -c73.x, r4.w
      texld r6, v5, s1
      mul r1.x, r6.x, c73.x
      mov r4.w, c1.w
      mad r7.x, r6.x, -c73.x, r4.w
      lrp r7.yzw, r1.x, c74.xxyz, r0.xxyz
      mad r8, r0.xxyz, c4.xyyy, c4.yzzz
      cmp r0, -r6.x, r8.yzwx, r7.yzwx
    else
      mov r0.w, c1.w
    endif
    mul r1.x, r3.x, r0.w
    mad_sat r1.z, r2.z, c3.z, c3.w
    mov r6.xyz, c38
    mad r6.xyz, r6, r1.z, c37
    mul r7.xyz, c18.w, c18
    dp3 r1.z, r2, -c17
    add r1.z, r1.z, c4.w
    mul_sat r1.z, r1.z, c0.x
    dp3_sat r3.x, -c17, r3.yzww
    add r3.x, r3.x, c0.y
    mad r1.w, r1.w, c0.z, c0.y
    pow r4.w, r3.x, r1.w
    mul r8.xyz, c61.xyww, v4.y
    mad r8.xyz, v4.x, c60.xyww, r8
    mad r8.xyz, v4.z, c62.xyww, r8
    add r8.xyz, r8, c63.xyww
    dp3 r1.w, c14, v4
    add r9.xyz, -r1.w, -c54
    cmp r9.yzw, r9.xxyz, c4.y, c4.x
    mov r9.x, c1.w
    dp4 r10.x, r9, c57
    dp4 r10.y, r9, c58
    dp4 r11.x, r9, c59
    dp4 r11.y, r9, c56
    mad r8.xy, r8, r10, r11
    add r9.xyz, c15, -v4
    dp3 r1.w, r9, r9
    rsq r1.w, r1.w
    rcp r1.w, r1.w
    rcp r3.x, c53.w
    mul r3.x, r1.w, r3.x
    mul r3.x, r3.x, r3.x // improved shadow fadeout
    mul r3.x, r3.x, r3.x
    mul r3.x, r3.x, c0.w
    /* removed 1.0.6.0 filter
    mov r9.y, c53.y
    mad r9.xz, r9.y, c13.xyyw, r8.xyyw
    texld r10, r9.xzzw, s15
    add r6.w, r8.z, -r10.x
    cmp r6.w, r6.w, c4.y, c4.x
    mad r9.xz, r9.y, c13.zyww, r8.xyyw
    texld r10, r9.xzzw, s15
    add r7.w, r8.z, -r10.x
    cmp r7.w, r7.w, c4.y, c4.x
    add r6.w, r6.w, r7.w
    mad r9.xz, r9.y, c12.xyyw, r8.xyyw
    texld r10, r9.xzzw, s15
    add r7.w, r8.z, -r10.x
    cmp r7.w, r7.w, c4.y, c4.x
    add r6.w, r6.w, r7.w
    mad r9.xz, r9.y, c12.zyww, r8.xyyw
    texld r10, r9.xzzw, s15
    add r7.w, r8.z, -r10.x
    cmp r7.w, r7.w, c4.y, c4.x
    add r6.w, r6.w, r7.w
    mad r9.xz, r9.y, c11.xyyw, r8.xyyw
    texld r10, r9.xzzw, s15
    add r7.w, r8.z, -r10.x
    cmp r7.w, r7.w, c4.y, c4.x
    add r6.w, r6.w, r7.w
    mad r9.xz, r9.y, c11.zyww, r8.xyyw
    texld r10, r9.xzzw, s15
    add r7.w, r8.z, -r10.x
    cmp r7.w, r7.w, c4.y, c4.x
    add r6.w, r6.w, r7.w
    mad r9.xz, r9.y, c10.xyyw, r8.xyyw
    texld r10, r9.xzzw, s15
    add r7.w, r8.z, -r10.x
    cmp r7.w, r7.w, c4.y, c4.x
    add r6.w, r6.w, r7.w
    mad r9.xz, r9.y, c10.zyww, r8.xyyw
    texld r10, r9.xzzw, s15
    add r7.w, r8.z, -r10.x
    cmp r7.w, r7.w, c4.y, c4.x
    add r6.w, r6.w, r7.w
    mad r9.xz, r9.y, c9.xyyw, r8.xyyw
    texld r10, r9.xzzw, s15
    add r7.w, r8.z, -r10.x
    cmp r7.w, r7.w, c4.y, c4.x
    add r6.w, r6.w, r7.w
    mad r9.xz, r9.y, c9.zyww, r8.xyyw
    texld r10, r9.xzzw, s15
    add r7.w, r8.z, -r10.x
    cmp r7.w, r7.w, c4.y, c4.x
    add r6.w, r6.w, r7.w
    mad r9.xz, r9.y, c8.xyyw, r8.xyyw
    texld r10, r9.xzzw, s15
    add r7.w, r8.z, -r10.x
    cmp r7.w, r7.w, c4.y, c4.x
    add r6.w, r6.w, r7.w
    mad r8.xy, r9.y, c8.zwzw, r8
    texld r9, r8, s15
    add r7.w, r8.z, -r9.x
    cmp r7.w, r7.w, c4.y, c4.x
    add r6.w, r6.w, r7.w
    removed 1.0.6.0 filter */
	// ------------------------------------------------------------- Per Cascade Tweaks -------------------------------------------------------------
    add r21.xyz, r8.x, -c120.xyz
    cmp r22.xy, r21.x, c121.yw, c121.xz
    cmp r22.xy, r21.y, c122.xz, r22.xy
    cmp r22.xy, r21.z, c122.yw, r22.xy	// r22.x = per cascade blur, r22.y = per cascade bias
	
	mov r20.xy, c53.xy
	max r20.xy, r20.xy, c131.xy			// limit minimum blur
    mul r20.xy, r20.xy, r22.x			// reduce cascade blur disparity
	add r8.z, r8.z, -r22.y				// improve depth bias for 2nd, 3rd and 4th cascade
	// ----------------------------------------------------------------------------------------------------------------------------------------------
	// -------------------------------------------------------------- Filter Selection --------------------------------------------------------------
	mov r20.z, c223.y
    add r21.xyz, r20.z, -c132.yzw
    cmp r20.w, r21.x, c133.y, c133.x
    cmp r20.w, r21.y, c133.z, r20.w
    cmp r20.w, r21.z, c133.w, r20.w // "Sharp", "Soft", "Softer" & "Softest"
	
	if_gt r20.z, c132.w // "PCSS"
		mov r21.y, c141.z // blockers
	
		mul r22.xy, r22.xx, c141.xy // pcss texel step
	
		mov r23.xy, r22.xx // x - inner loop index, y - outer loop index
		mov r24.x, c141.z // sum
	
		rep i2
			mul r21.w, r23.y, c140.w
	
			rep i2
				mad r25.xy, c53.xy, r23.xy, r8.xy
				texldl r26, r25.xy, s15
	
				add r25.x, r26.x, -r8.z
	
				if_gt r25.x, r21.w
					min r25.x, r25.x, c140.x // < 49
					add r24.x, r24.x, r25.x
					add r21.y, r21.y, c141.w
				endif
	
				add r23.x, r23.x, r22.y // j++
			endrep
			add r23.y, r23.y, r22.y // i++
			mov r23.x, r22.x // j = -33
		endrep
	
		// avg if any blockers
		if_gt r21.y, c141.z
			rcp r21.y, r21.y
			mul r24.x, r24.x, r21.y
			mul r24.x, r24.x, c140.y // maximum intensity
		else
			mov r24.x, c141.z
		endif
	
		max r20.w, r24.x, c140.z // minimum intensity
	endif
	// ----------------------------------------------------------------------------------------------------------------------------------------------
	// ------------------------------------------------------------ Smooth Distance Blur ------------------------------------------------------------
	mov r20.z, c110.w
	add r21.x, r1.w, -c130.x
	mul_sat r21.x, r21.x, c130.y
	mul r21.x, r21.x, r21.x
	lrp r22.xy, r21.x, c130.zw, r20.wz // r22.x = blur factor, r22.y = bias factor
	
	mul r20.xy, r20.xy, r22.x
	add r8.z, r8.z, r22.y
	// ----------------------------------------------------------------------------------------------------------------------------------------------
	// ----------------------------------------------------------- 1.0.4.0 Shadow Filter ------------------------------------------------------------
    mov r21.xy, c112.xy
    mul r21.xy, r21.xy, c44.xy			// r21.xy * screen dimensions
    dp2add r21.y, v0, r21, c110.w		// v0.x * r21.x + v0.y * r21.y
    mad r21.y, r21.y, c111.x, c111.y
    frc r21.y, r21.y
    mad r21.y, r21.y, c111.z, c111.w	// r21.y * 2pi - pi
    sincos r22.xy, r21.y				// sine & cosine of r21.y

	mul r20.xy, r20.xy, c112.z			// blur factor
	mul r20.xy, r20.xy, c112.w			// compensate blur for extra iterations
	
	mov r20.zw, c110.w
	
	mov r26, c110.xxyz					// copy offsets for 1st and 4th samples, respectively
	mov r27, c113.xxyz					// copy offsets for 3rd and 2nd samples, respectively
	
	rep i1
		mul r23, r22.yxxy, r26
		mul r21, r22.yxxy, r27
		
		mad r24.xy, r23.xy, r20.xy, r8.xy	// offset * texel size + UV
		texld r24, r24, s15					// 1st sample
		mov r25.x, r24.x					// copy to r25
		mad r24.xy, r21.zw, r20.xy, r8.xy	// offset * texel size + UV
		texld r24, r24, s15					// 2nd sample
		mov r25.y, r24.x					// copy to r25
		mad r24.xy, r21.xy, r20.xy, r8.xy	// offset * texel size + UV
		texld r24, r24, s15					// 3rd sample
		mov r25.z, r24.x					// copy to r25
		mad r24.xy, r23.zw, r20.xy, r8.xy	// offset * texel size + UV
		texld r24, r24, s15					// 4th sample
		mov r25.w, r24.x					// copy to r25
	
		add r25, r8.z, -r25					// depth bias
		cmp r25, r25, c110.y, c110.w
		dp4 r20.w, r25, -c110.x				// average samples of current iteration
		add r20.z, r20.z, r20.w
		
		add r26, r26, c110.zzyz				// add (-1, -1, 1, -1)
		add r27, r27, -c110.zzyz			// add (1, 1, -1, 1)
	endrep
	
	mul r6.w, r20.z, c112.w					// average all iterations
	// ----------------------------------------------------------------------------------------------------------------------------------------------
    mad r3.x, r6.w, c5.x, r3.x
    add r1.w, r1.w, -c53.w
    cmp r8.xy, r1.w, c7, c7.zwzw
    add r1.w, r3.x, r8.y
    cmp_sat r1.w, r1.w, r3.x, r8.x
    mul r8.xyz, r7, r4.w
    mul r8.xyz, r1.w, r8
    mul r7.xyz, r7, r1.z
    mul r7.xyz, r1.w, r7
    mad r6.xyz, r6, c39.z, r7
    add r7, c19, -v4.x
    add r9, c20, -v4.y
    add r10, c21, -v4.z
    mul r11, r7, r7
    mad r11, r9, r9, r11
    mad r11, r10, r10, r11
    add r12, r11, c1.x
    rsq r13.x, r12.x
    rsq r13.y, r12.y
    rsq r13.z, r12.z
    rsq r13.w, r12.w
    mov r1.w, c1.w
    mad r11, r11, -c25, r1.w
    max r12, r11, c2.w
    mul r11, r12, r12
    mad r11, r11, r11, c5.y
    mul r12, r11, c5.z
    cmp r11, r11, r12, c2.w
    mul r12, r2.x, r7
    mad r12, r9, r2.y, r12
    mad r12, r10, r2.z, r12
    mul r11, r11, r12
    mul_sat r11, r13, r11
    mul r12, r7, -c22
    mad r12, r9, -c23, r12
    mad r12, r10, -c24, r12
    mul r12, r13, r12
    mov r14, c26
    mad_sat r12, r12, r14, c27
    mul r11, r11, r12
    mul r7, r3.y, r7
    mad r7, r3.z, r9, r7
    mad r3, r3.w, r10, r7
    mul r3, r13, r3
    log r7.x, r3_abs.x
    log r7.y, r3_abs.y
    log r7.z, r3_abs.z
    log r7.w, r3_abs.w
    mul r2, r2.w, r7
    exp r3.x, r2.x
    exp r3.y, r2.y
    exp r3.z, r2.z
    exp r3.w, r2.w
    mul r2, r11, r3
    dp4 r3.x, c29, r11
    dp4 r3.y, c30, r11
    dp4 r3.z, c31, r11
    dp4 r7.x, c29, r2
    dp4 r7.y, c30, r2
    dp4 r7.z, c31, r2
    add r2.xyz, r6, r3
    mad r3.xyz, r8, c17.w, r7
    mov_sat r1.y, r1.y
    mul r1.x, r1.x, r1.y
    mul r4.xyz, r4, r1.x
    mad r3.xyz, r4, c39.z, r3
    mov r0.w, r5.w
    mov r2.w, c1.w
    mul r0, r0, r2
    mad r0.xyz, r1.x, r3, r0
    mad r0.xyz, r5, c72.x, r0
    mul oC0.w, r0.w, c39.x
    add r0.w, c16.w, -v1.w
    add r1.x, -c16.z, c16.w
    rcp r1.x, r1.x
    mul_sat r0.w, r0.w, r1.x
    add r0.w, -r0.w, c1.w
    add r1.xy, -r1.w, c16
    mul r1.y, r0.w, r1.y
    mad r0.w, r0.w, r1.x, c1.w
    dp3 r1.x, r0, c6
    lrp r2.xyz, r0.w, r0, r1.x
    add r0.x, r1.x, c5.w
    pow r2.w, r0_abs.x, r1.y
    mul r0.xyz, r2, r2.w
    rcp r0.w, c41.x
    mul_sat r0.w, r0.w, v1.w
    add r1.x, -c41.x, v1.w
    add r1.y, -c41.x, c41.y
    rcp r1.y, r1.y
    mul_sat r1.x, r1.x, r1.y
    lrp r3.x, c41.w, r0.w, r1.x
    add r0.w, r3.x, c41.z
    mov r3.xyz, c43
    add r1.yzw, -r3.xxyz, c42.xxyz
    mad r1.xyz, r1.x, r1.yzww, c43
    mad r1.xyz, r2, -r2.w, r1
    mad oC0.xyz, r0.w, r1, r0
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

// approximately 254 instruction slots used (17 texture, 237 arithmetic)
