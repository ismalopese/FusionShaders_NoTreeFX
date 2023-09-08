// Added FXAA, fixed blurry screen, improved Definition setting behavior (doesn't affect stipple smoothing and DOF, only motion blur), console-like gamma, fixed DOF resolution scaling
// Custom registers: c222 (postfx toggles), c220 (stipple filter toggle)
// Generated by Microsoft (R) HLSL Shader Compiler 9.26.952.2844
//
// Parameters:
//
//   sampler2D AdapLumSampler;
//   sampler2D BloomSampler;
//   float4 ColorCorrect;
//   float4 ColorShift;
//   float Exposure;
//   sampler2D GBufferTextureSampler2;
//   sampler2D GBufferTextureSampler3;
//   sampler2D HDRSampler;
//   sampler2D JitterSampler;
//   float PLAYER_MASK;
//   sampler2D StencilCopySampler;
//   float4 TexelSize;
//   float4 ToneMapParams;
//   float4 deSatContrastGamma;
//   float4 dofBlur;
//   float4 dofDist;
//   float4 dofProj;
//   float gDirectionalMotionBlurLength;
//   float4 globalScreenSize;
//   row_major float4x4 motionBlurMatrix;
//
//
// Registers:
//
//   Name                         Reg   Size
//   ---------------------------- ----- ----
//   globalScreenSize             c44      1
//   Exposure                     c66      1
//   motionBlurMatrix             c72      4
//   TexelSize                    c76      1
//   dofProj                      c77      1
//   dofDist                      c78      1
//   dofBlur                      c79      1
//   gDirectionalMotionBlurLength c80      1
//   ToneMapParams                c81      1
//   deSatContrastGamma           c82      1
//   ColorCorrect                 c83      1
//   ColorShift                   c84      1
//   PLAYER_MASK                  c85      1
//   GBufferTextureSampler2       s0       1
//   GBufferTextureSampler3       s1       1
//   HDRSampler                   s2       1
//   BloomSampler                 s3       1
//   AdapLumSampler               s4       1
//   JitterSampler                s5       1
//   StencilCopySampler           s6       1
//

    ps_3_0
    def c127, 0.9999999, 1, 0, 0	// LogDepth constants
    def c0, 58.1640015, 47.1300011, 0, 0
    def c1, 0, 0.212500006, 0.715399981, 0.0720999986
    def c2, 0.25, 1, 256, 0
    def c3, 0, 2, 4, 8
    def c4, -0.5, -1.5, 1.5, 0.5
    def c5, 2, -1, 0.125, 0
    def c6, 256, 2, 4, 8
	def c10, 1.3333333, 1.0526316, 1.05577, 0.0762		// Gamma Constants
	// --------------------------------------------------------------- FXAA Constants ---------------------------------------------------------------
	// NVIDIA FXAA 3.11 by Timothy Lottes
	def c20, 0, 0, 0, 0			// Subpix				0.25, 0, 0, 0
	def c21, 0.125, 0, 0, 0		// EdgeThreshold		0.125, 0, 0, 0
	def c22, 0, 0, 0, 0			// EdgeThresholdMin		0, 0, 0, 0
    def c23, 0.0833333358, 0.5, -2, 3
    def c24, 0.25, 1.5, 4, 12
    def c25, 1, 0, -1, -2
	def c26, 0.298999995, 0.587000012, 0.114, 0
	// ----------------------------------------------------------------------------------------------------------------------------------------------
	// ---------------------------------------------------------------- DOF Constants ---------------------------------------------------------------
	// Circular Kernel from GPU Zen 'Practical Gather-based Bokeh Depth of Field' by Wojciech Sterna
	def c99, 0.0013889, 0.0416667, 0.6666667, 1080
	// first ring
	def c100, 1.000000, 0.000000, 0.707107, 0.707107
	def c101, -0.000000, 1.000000, -0.707107, 0.707107
	def c102, -1.000000, -0.000000, -0.707106, -0.707107
	def c103, 0.000000, -1.000000, 0.707107, -0.707107
	// second ring
	def c104, 2.000000, 0.000000, 1.847760, 0.765366
	def c105, 1.414214, 1.414214, 0.765366, 1.847760
	def c106, -0.000000, 2.000000, -0.765368, 1.847758
	def c107, -1.414214, 1.414214, -1.847760, 0.765366
	def c108, -2.000000, -0.000000, -1.847758, -0.765368
	def c109, -1.414212, -1.414214, -0.765366, -1.847760
	def c110, 0.000000, -2.000000, 0.765368, -1.847758
	def c111, 1.414214, -1.414214, 1.847760, -0.765366
	// third ring
	def c112, 3.000000, 0.000000, 2.897778, 0.776457
	def c113, 2.598075, 1.500000, 2.121321, 2.121321
	def c114, 1.500000, 2.598078, 0.776457, 2.897778
	def c115, -0.000000, 3.000000, -0.776457, 2.897778
	def c116, -1.500000, 2.598075, -2.121321, 2.121321
	def c117, -2.598078, 1.500000, -2.897778, 0.776457
	def c118, -3.000000, -0.000000, -2.897778, -0.776460
	def c119, -2.598075, -1.500000, -2.121318, -2.121321
	def c120, -1.499997, -2.598078, -0.776457, -2.897778
	def c121, 0.000000, -3.000000, 0.776457, -2.897778
	def c122, 1.500000, -2.598075, 2.121321, -2.121321
	def c123, 2.598078, -1.499997, 2.897778, -0.776454
	// ----------------------------------------------------------------------------------------------------------------------------------------------
    defi i0, 7, 0, 0, 0
    dcl_texcoord v0.xy
    dcl_2d s0
    dcl_2d s1
    dcl_2d s2
    dcl_2d s3
    dcl_2d s4
    dcl_2d s5
    dcl_2d s6
    texld r0, v0, s1
	// ----------------------------------------------------------------- Log2Linear -----------------------------------------------------------------
	if_ne r0.x, c127.y
		rcp r20.x, c128.x
		mul r20.x, r20.x, c128.y
		pow r20.x, r20.x, r0.x
		mul r20.x, r20.x, c128.x	// W_clip
		
		add r20.y, r20.x, -c128.x
		add r20.z, c128.y, -c128.x
		mul r20.y, r20.y, c128.y
		mul r20.z, r20.z, r20.x
		rcp r20.z, r20.z
		mul r20.w, r20.y, r20.z		// Linear depth
		
		min r0, r20.w, c127.x		// FP error hack
	endif
	// ----------------------------------------------------------------------------------------------------------------------------------------------
    add r0.y, -c77.x, c77.y
    rcp r0.y, r0.y
    mul r0.z, r0.y, c77.y
    mul r0.z, r0.z, -c77.x
    mad r0.x, c77.y, -r0.y, r0.x
    rcp r0.x, r0.x
    mul r0.y, r0.z, r0.x
	// -------------------------------------------------------------------- FXAA --------------------------------------------------------------------
	if_eq c222.x, c222.w
		mov r20, c76
		mul r22, c25.xxyy, v0.xyxx
		texldl r22, r22, s2
		mul r21.xyz, r22, r22
		dp3 r22.w, r21, c26
		rsq r22.w, r22.w
		rcp r22.w, r22.w
		mov r23.xyz, c25
		mad r24.xyz, r20.yxyw, r23.xxyw, v0.yxyw
		mul r25.xzw, c25.xyyy, v0.x
		mov r25.y, r24.x
		texldl r25, r25, s2
		mul r21.xyz, r25, r25
		dp3 r25.w, r21, c26
		rsq r25.w, r25.w
		rcp r25.w, r25.w
		mul r24, r24.yzyy, c25.xxyy
		texldl r24, r24, s2
		mul r21.xyz, r24, r24
		dp3 r24.w, r21, c26
		rsq r24.w, r24.w
		rcp r24.w, r24.w
		mad r24.xyz, r20.yxyw, r23.zzyw, v0.yxyw
		mul r26.xzw, c25.xyyy, v0.x
		mov r26.y, r24.x
		texldl r26, r26, s2
		mul r21.xyz, r26, r26
		dp3 r26.w, r21, c26
		rsq r26.w, r26.w
		rcp r26.w, r26.w
		mul r27, r24.yzyy, c25.xxyy
		texldl r27, r27, s2
		mul r21.xyz, r27, r27
		dp3 r27.w, r21, c26
		rsq r27.w, r27.w
		rcp r27.w, r27.w
		max r23.w, r25.w, r22.w
		min r24.x, r22.w, r25.w
		max r25.x, r24.w, r23.w
		min r23.w, r24.x, r24.w
		max r24.x, r26.w, r27.w
		min r24.y, r27.w, r26.w
		max r26.x, r24.x, r25.x
		min r25.x, r23.w, r24.y
		mul r23.w, r26.x, c21.x
		add r24.x, -r25.x, r26.x
		max r24.y, c22.x, r23.w
		if_lt r24.x, r24.y
		else
		add r28.xy, -r20, v0
		mov r28.zw, c25.y
		texldl r28, r28, s2
		mul r21.xyz, r28, r28
		dp3 r28.w, r21, c26
		rsq r28.w, r28.w
		rcp r28.w, r28.w
		add r29.xy, r20, v0
		mov r29.zw, c25.y
		texldl r29, r29, s2
		mul r21.xyz, r29, r29
		dp3 r29.w, r21, c26
		rsq r29.w, r29.w
		rcp r29.w, r29.w
		mad r30, r20.xyxy, r23.xzzx, v0.xyxy
		mul r31, r30.xyxx, c25.xxyy
		texldl r31, r31, s2
		mul r21.xyz, r31, r31
		dp3 r31.w, r21, c26
		rsq r31.w, r31.w
		rcp r31.w, r31.w
		mul r30, r30.zwxx, c25.xxyy
		texldl r30, r30, s2
		mul r21.xyz, r30, r30
		dp3 r30.w, r21, c26
		rsq r30.w, r30.w
		rcp r30.w, r30.w
		add r23.x, r25.w, r26.w
		add r23.z, r24.w, r27.w
		rcp r23.w, r24.x
		add r24.x, r23.z, r23.x
		mad r23.x, r22.w, c25.w, r23.x
		mad r23.z, r22.w, c25.w, r23.z
		add r24.y, r29.w, r31.w
		add r24.z, r28.w, r31.w
		mad r25.x, r24.w, c25.w, r24.y
		mad r24.z, r26.w, c25.w, r24.z
		add r25.y, r28.w, r30.w
		add r25.z, r29.w, r30.w
		mad r23.x, r23_abs.x, -c25.w, r25_abs.x
		mad r23.z, r23_abs.z, -c25.w, r24_abs.z
		mad r24.z, r27.w, c25.w, r25.y
		mad r25.x, r25.w, c25.w, r25.z
		add r23.x, r23.x, r24_abs.z
		add r23.z, r23.z, r25_abs.x
		add r24.y, r24.y, r25.y
		add r23.x, -r23.z, r23.x
		mad r23.z, r24.x, -c25.w, r24.y
		cmp r24.x, r23.x, r26.w, r27.w
		cmp r24.y, r23.x, r25.w, r24.w
		cmp r24.z, r23.x, r20.y, r20.x
		mad r23.z, r23.z, c23.x, -r22.w
		add r24.w, -r22.w, r24.x
		add r25.x, -r22.w, r24.y
		add r24.xy, r22.w, r24
		add r25.y, r24_abs.w, -r25_abs.x
		max r26.x, r24_abs.w, r25_abs.x
		cmp r24.z, r25.y, -r24.z, r24.z
		mul_sat r23.z, r23.w, r23_abs.z
		cmp r23.w, r23.x, r20.x, r23.y
		cmp r23.y, r23.x, r23.y, r20.y
		mad r25.xz, r24.z, c23.y, v0.xyyw
		cmp r24.w, r23.x, v0.x, r25.x
		cmp r25.x, r23.x, r25.z, v0.y
		add r27.x, -r23.w, r24.w
		add r27.y, -r23.y, r25.x
		add r28.x, r23.w, r24.w
		add r28.y, r23.y, r25.x
		mad r24.w, r23.z, c23.z, c23.w
		mov r27.zw, c25.y
		texldl r29, r27, s2
		mul r21.xyz, r29, r29
		dp3 r29.w, r21, c26
		rsq r29.w, r29.w
		rcp r29.w, r29.w
		mul r23.z, r23.z, r23.z
		mov r28.zw, c25.y
		texldl r30, r28, s2
		mul r21.xyz, r30, r30
		dp3 r30.w, r21, c26
		rsq r30.w, r30.w
		rcp r30.w, r30.w
		cmp r24.x, r25.y, r24.x, r24.y
		mul r24.y, r26.x, c24.x
		mad r25.x, r24.x, -c23.y, r22.w
		mul r23.z, r23.z, r24.w
		mad r25.y, r24.x, -c23.y, r29.w
		mad r25.z, r24.x, -c23.y, r30.w
		mad r26.yz, r26.x, -c24.x, r25_abs
		mad r24.w, r23.w, -c24.y, r27.x
		cmp r29.x, r26.y, r27.x, r24.w
		mad r24.w, r23.y, -c24.y, r27.y
		cmp r29.y, r26.y, r27.y, r24.w
		cmp r27.xy, r26.yzzw, c25.y, c25.x
		add r24.w, r27.y, r27.x
		mad r25.w, r23.w, c24.y, r28.x
		cmp r27.x, r26.z, r28.x, r25.w
		mad r25.w, r23.y, c24.y, r28.y
		cmp r27.y, r26.z, r28.y, r25.w
		if_lt -r24.w, c25.y
			if_ge r25_abs.y, r24.y
			else
			mov r29.zw, c25.y
			texldl r28, r29, s2
			mul r21.xyz, r28, r28
			dp3 r28.w, r21, c26
			rsq r28.w, r28.w
			rcp r28.w, r28.w
			mov r25.y, r28.w
			endif
			if_ge r25_abs.z, r24.y
			else
			mov r27.zw, c25.y
			texldl r28, r27, s2
			mul r21.xyz, r28, r28
			dp3 r28.w, r21, c26
			rsq r28.w, r28.w
			rcp r28.w, r28.w
			mov r25.z, r28.w
			endif
			mad r24.w, r24.x, -c23.y, r25.y
			cmp r25.y, r26.y, r25.y, r24.w
			mad r24.w, r24.x, -c23.y, r25.z
			cmp r25.z, r26.z, r25.z, r24.w
			mad r26.yz, r26.x, -c24.x, r25_abs
			mad r24.w, r23.w, c25.w, r29.x
			cmp r29.x, r26.y, r29.x, r24.w
			mad r24.w, r23.y, c25.w, r29.y
			cmp r29.y, r26.y, r29.y, r24.w
			cmp r28.xy, r26.yzzw, c25.y, c25.x
			add r24.w, r28.y, r28.x
			mad r25.w, r23.w, -c25.w, r27.x
			cmp r27.x, r26.z, r27.x, r25.w
			mad r25.w, r23.y, -c25.w, r27.y
			cmp r27.y, r26.z, r27.y, r25.w
			if_lt -r24.w, c25.y
			if_ge r25_abs.y, r24.y
			else
				mov r29.zw, c25.y
				texldl r28, r29, s2
				mul r21.xyz, r28, r28
				dp3 r28.w, r21, c26
				rsq r28.w, r28.w
				rcp r28.w, r28.w
				mov r25.y, r28.w
			endif
			if_ge r25_abs.z, r24.y
			else
				mov r27.zw, c25.y
				texldl r28, r27, s2
				mul r21.xyz, r28, r28
				dp3 r28.w, r21, c26
				rsq r28.w, r28.w
				rcp r28.w, r28.w
				mov r25.z, r28.w
			endif
			mad r24.w, r24.x, -c23.y, r25.y
			cmp r25.y, r26.y, r25.y, r24.w
			mad r24.w, r24.x, -c23.y, r25.z
			cmp r25.z, r26.z, r25.z, r24.w
			mad r26.yz, r26.x, -c24.x, r25_abs
			mad r24.w, r23.w, c25.w, r29.x
			cmp r29.x, r26.y, r29.x, r24.w
			mad r24.w, r23.y, c25.w, r29.y
			cmp r29.y, r26.y, r29.y, r24.w
			cmp r28.xy, r26.yzzw, c25.y, c25.x
			add r24.w, r28.y, r28.x
			mad r25.w, r23.w, -c25.w, r27.x
			cmp r27.x, r26.z, r27.x, r25.w
			mad r25.w, r23.y, -c25.w, r27.y
			cmp r27.y, r26.z, r27.y, r25.w
			if_lt -r24.w, c25.y
				if_ge r25_abs.y, r24.y
				else
				mov r29.zw, c25.y
				texldl r28, r29, s2
				mul r21.xyz, r28, r28
				dp3 r28.w, r21, c26
				rsq r28.w, r28.w
				rcp r28.w, r28.w
				mov r25.y, r28.w
				endif
				if_ge r25_abs.z, r24.y
				else
				mov r27.zw, c25.y
				texldl r28, r27, s2
				mul r21.xyz, r28, r28
				dp3 r28.w, r21, c26
				rsq r28.w, r28.w
				rcp r28.w, r28.w
				mov r25.z, r28.w
				endif
				mad r24.w, r24.x, -c23.y, r25.y
				cmp r25.y, r26.y, r25.y, r24.w
				mad r24.w, r24.x, -c23.y, r25.z
				cmp r25.z, r26.z, r25.z, r24.w
				mad r26.yz, r26.x, -c24.x, r25_abs
				mad r24.w, r23.w, c25.w, r29.x
				cmp r29.x, r26.y, r29.x, r24.w
				mad r24.w, r23.y, c25.w, r29.y
				cmp r29.y, r26.y, r29.y, r24.w
				cmp r28.xy, r26.yzzw, c25.y, c25.x
				add r24.w, r28.y, r28.x
				mad r25.w, r23.w, -c25.w, r27.x
				cmp r27.x, r26.z, r27.x, r25.w
				mad r25.w, r23.y, -c25.w, r27.y
				cmp r27.y, r26.z, r27.y, r25.w
				if_lt -r24.w, c25.y
				if_ge r25_abs.y, r24.y
				else
					mov r29.zw, c25.y
					texldl r28, r29, s2
					mul r21.xyz, r28, r28
					dp3 r28.w, r21, c26
					rsq r28.w, r28.w
					rcp r28.w, r28.w
					mov r25.y, r28.w
				endif
				if_ge r25_abs.z, r24.y
				else
					mov r27.zw, c25.y
					texldl r28, r27, s2
					mul r21.xyz, r28, r28
					dp3 r28.w, r21, c26
					rsq r28.w, r28.w
					rcp r28.w, r28.w
					mov r25.z, r28.w
				endif
				mad r24.w, r24.x, -c23.y, r25.y
				cmp r25.y, r26.y, r25.y, r24.w
				mad r24.w, r24.x, -c23.y, r25.z
				cmp r25.z, r26.z, r25.z, r24.w
				mad r26.yz, r26.x, -c24.x, r25_abs
				mad r24.w, r23.w, c25.w, r29.x
				cmp r29.x, r26.y, r29.x, r24.w
				mad r24.w, r23.y, c25.w, r29.y
				cmp r29.y, r26.y, r29.y, r24.w
				cmp r28.xy, r26.yzzw, c25.y, c25.x
				add r24.w, r28.y, r28.x
				mad r25.w, r23.w, -c25.w, r27.x
				cmp r27.x, r26.z, r27.x, r25.w
				mad r25.w, r23.y, -c25.w, r27.y
				cmp r27.y, r26.z, r27.y, r25.w
				if_lt -r24.w, c25.y
					if_ge r25_abs.y, r24.y
					else
					mov r29.zw, c25.y
					texldl r28, r29, s2
					mul r21.xyz, r28, r28
					dp3 r28.w, r21, c26
					rsq r28.w, r28.w
					rcp r28.w, r28.w
					mov r25.y, r28.w
					endif
					if_ge r25_abs.z, r24.y
					else
					mov r27.zw, c25.y
					texldl r28, r27, s2
					mul r21.xyz, r28, r28
					dp3 r28.w, r21, c26
					rsq r28.w, r28.w
					rcp r28.w, r28.w
					mov r25.z, r28.w
					endif
					mad r24.w, r24.x, -c23.y, r25.y
					cmp r25.y, r26.y, r25.y, r24.w
					mad r24.w, r24.x, -c23.y, r25.z
					cmp r25.z, r26.z, r25.z, r24.w
					mad r26.yz, r26.x, -c24.x, r25_abs
					mad r24.w, r23.w, -c24.z, r29.x
					cmp r29.x, r26.y, r29.x, r24.w
					mad r24.w, r23.y, -c24.z, r29.y
					cmp r29.y, r26.y, r29.y, r24.w
					cmp r28.xy, r26.yzzw, c25.y, c25.x
					add r24.w, r28.y, r28.x
					mad r25.w, r23.w, c24.z, r27.x
					cmp r27.x, r26.z, r27.x, r25.w
					mad r25.w, r23.y, c24.z, r27.y
					cmp r27.y, r26.z, r27.y, r25.w
					if_lt -r24.w, c25.y
					if_ge r25_abs.y, r24.y
					else
						mov r29.zw, c25.y
						texldl r28, r29, s2
						mul r21.xyz, r28, r28
						dp3 r28.w, r21, c26
						rsq r28.w, r28.w
						rcp r28.w, r28.w
						mov r25.y, r28.w
					endif
					if_ge r25_abs.z, r24.y
					else
						mov r27.zw, c25.y
						texldl r28, r27, s2
						mul r21.xyz, r28, r28
						dp3 r28.w, r21, c26
						rsq r28.w, r28.w
						rcp r28.w, r28.w
						mov r25.z, r28.w
					endif
					mad r24.y, r24.x, -c23.y, r25.y
					mad r24.x, r24.x, -c23.y, r25.z
					cmp r25.yz, r26, r25, r24.xyxw
					mad r24.xy, r26.x, -c24.x, r25_abs.yzzw
					mad r24.w, r23.w, -c24.w, r29.x
					cmp r29.x, r24.x, r29.x, r24.w
					mad r24.w, r23.y, -c24.w, r29.y
					cmp r29.y, r24.x, r29.y, r24.w
					mad r23.w, r23.w, c24.w, r27.x
					mad r23.y, r23.y, c24.w, r27.y
					cmp r27.xy, r24.y, r27, r23.wyzw
					endif
				endif
				endif
			endif
			endif
		endif
		add r23.y, -r29.x, v0.x
		add r23.w, r27.x, -v0.x
		add r24.x, -r29.y, v0.y
		cmp r23.y, r23.x, r23.y, r24.x
		add r24.x, r27.y, -v0.y
		cmp r23.w, r23.x, r23.w, r24.x
		cmp r24.xy, r25.yzzw, c25.y, c25.x
		cmp r24.w, r25.x, -c25.y, -c25.x
		add r24.xy, r24.w, r24
		add r24.w, r23.y, r23.w
		rcp r24.w, r24.w
		add r25.x, -r23.w, r23.y
		min r25.y, r23.w, r23.y
		cmp r23.y, r25.x, r24_abs.y, r24_abs.x
		mul r23.z, r23.z, r23.z
		mad r23.w, r25.y, -r24.w, c23.y
		mul r23.z, r23.z, c20.x
		cmp r23.y, -r23.y, c25.y, r23.w
		max r24.x, r23.y, r23.z
		mad r23.yz, r24.x, r24.z, v0.xxyw
		cmp r24.x, r23.x, v0.x, r23.y
		cmp r24.y, r23.x, r23.z, v0.y
		mov r24.zw, c25.y
		texldl r23, r24, s2
		mul r21.xyz, r23, r23
		dp3 r23.w, r21, c26
		rsq r23.w, r23.w
		rcp r23.w, r23.w
		mov r22.xyz, r23
		endif
		mov r1, r22
	else
		texld r1, v0, s2
	endif
	// ----------------------------------------------------------------------------------------------------------------------------------------------
    texld r2, v0, s3
    abs r0.w, c79.w
    mov r3, c4
    mad r4.xy, c76, r3, v0
    texld r4, r4, s2
    mad r5.xy, c76, r3.zxzw, v0
    texld r5, r5, s2
    mad r3.xz, c76.xyyw, r3.wyzw, v0.xyyw
    texld r6, r3.xzzw, s2
    mad r3.xy, c76, r3.ywzw, v0
    texld r7, r3, s2
    dp3 r1.w, r4, r4
    rcp r1.w, r1.w
    cmp r3.xyz, -r1_abs.w, c1.x, r4
    dp3 r1.w, r5, r5
    rcp r1.w, r1.w
    cmp r4.xyz, -r1_abs.w, c1.x, r5
    dp3 r1.w, r6, r6
    rcp r1.w, r1.w
    cmp r5.xyz, -r1_abs.w, c1.x, r6
    dp3 r1.w, r7, r7
    rcp r1.w, r1.w
    cmp r6.xyz, -r1_abs.w, c1.x, r7
    dp3 r1.w, r1, r1
    rcp r1.w, r1.w
    cmp r7.xyz, -r1_abs.w, c1.x, r1
    mad r0.x, r0.z, r0.x, -c78.w
    mad r0.x, c78.y, -r3.w, r0.x
    max r1.w, r0.x, c1.x
    rcp r0.x, c78.z
    mul r0.x, r1.w, r0.x
    lrp r1.w, r0.x, c79.z, c79.y
    min r0.x, c79.z, r1.w
	if_ne c222.y, c222.w	// DOF toggle
		mov r0.x, c1.x
	endif
    dp3 r0.z, r7, c1.yzww
    dp3 r8.x, r3, c1.yzww
    dp3 r8.y, r4, c1.yzww
    dp3 r8.z, r5, c1.yzww
    dp3 r8.w, r6, c1.yzww
    dp4 r1.w, r8, c2.x
    add r8, r8, -r1.w
    dp4 r2.w, r8, r8
    add r0.z, r0.z, -r1.w
    mad r0.z, r0.z, r0.z, -r2.w
    mul r0.x, r0.x, r0.x
	if_eq c220.x, c220.w	// Stipple filter toggle
		cmp r0.x, r0.z, c2.y, r0.x
	endif
    texld r8, v0, s0
    mov r8.yz, c2
    mad r9, r8.w, -r8.z, c3
    cmp r9, r9, c2.y, c2.w
    mad r10, r8.w, -c6.x, c6.yzwx
    cmp r10, r10, -c2.y, -c2.w
    add r9, r9, r10
    mul r9, r9, c1.x // disable static PC blur
    dp4 r0.z, r9, c2.y
    add r0.z, r0.z, c4.w
    rcp r0.z, r0.z
    mul r8.xzw, r3.xyyz, r9.x
    mad r7.xyz, r7, c4.w, r8.xzww
    mad r7.xyz, r4, r9.y, r7
    mad r7.xyz, r5, r9.z, r7
    mad r7.xyz, r6, r9.w, r7
    mul r7.xyz, r0.z, r7
    add r0.z, -r0.x, c2.y
    mul r1.w, r0.x, c2.x
	// --------------------------------------------------------------- Depth of Field ---------------------------------------------------------------
	if_eq c222.y, c222.w
		mov r20.z, c79.z
		if_gt r20.z, c1.x		// don't run if DOF intensity = 0
			mov r20, c99
			mov r21, c1.x		// sum = 0
			mov r22, c76
			if_gt c44.y, r20.w
				mul r22, r22, r20.z
			endif
			mul r22, r22, c44.y // multiply by resolution height
			mul r22, r22, r20.x // divide by 720
		
			// first ring
		
			mad r23.xy, r22, c100.xy, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c100.zw, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c101.xy, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c101.zw, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c102.xy, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c102.zw, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c103.xy, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c103.zw, v0
			texldl r23, r23, s2
			add r21, r21, r23
			
			// second ring
		
			mad r23.xy, r22, c104.xy, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c104.zw, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c105.xy, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c105.zw, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c106.xy, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c106.zw, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c107.xy, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c107.zw, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c108.xy, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c108.zw, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c109.xy, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c109.zw, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c110.xy, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c110.zw, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c111.xy, v0
			texldl r23, r23, s2
			add r21, r21, r23
			mad r23.xy, r22, c111.zw, v0
			texldl r23, r23, s2
			add r21, r21, r23
			
			// third ring
			
			if_gt c44.y, r20.w
				mad r23.xy, r22, c112.xy, v0
				texldl r23, r23, s2
				add r21, r21, r23
				mad r23.xy, r22, c112.zw, v0
				texldl r23, r23, s2
				add r21, r21, r23
				mad r23.xy, r22, c113.xy, v0
				texldl r23, r23, s2
				add r21, r21, r23
				mad r23.xy, r22, c113.zw, v0
				texldl r23, r23, s2
				add r21, r21, r23
				mad r23.xy, r22, c114.xy, v0
				texldl r23, r23, s2
				add r21, r21, r23
				mad r23.xy, r22, c114.zw, v0
				texldl r23, r23, s2
				add r21, r21, r23
				mad r23.xy, r22, c115.xy, v0
				texldl r23, r23, s2
				add r21, r21, r23
				mad r23.xy, r22, c115.zw, v0
				texldl r23, r23, s2
				add r21, r21, r23
				mad r23.xy, r22, c116.xy, v0
				texldl r23, r23, s2
				add r21, r21, r23
				mad r23.xy, r22, c116.zw, v0
				texldl r23, r23, s2
				add r21, r21, r23
				mad r23.xy, r22, c117.xy, v0
				texldl r23, r23, s2
				add r21, r21, r23
				mad r23.xy, r22, c117.zw, v0
				texldl r23, r23, s2
				add r21, r21, r23
				mad r23.xy, r22, c118.xy, v0
				texldl r23, r23, s2
				add r21, r21, r23
				mad r23.xy, r22, c118.zw, v0
				texldl r23, r23, s2
				add r21, r21, r23
				mad r23.xy, r22, c119.xy, v0
				texldl r23, r23, s2
				add r21, r21, r23
				mad r23.xy, r22, c119.zw, v0
				texldl r23, r23, s2
				add r21, r21, r23
				mad r23.xy, r22, c120.xy, v0
				texldl r23, r23, s2
				add r21, r21, r23
				mad r23.xy, r22, c120.zw, v0
				texldl r23, r23, s2
				add r21, r21, r23
				mad r23.xy, r22, c121.xy, v0
				texldl r23, r23, s2
				add r21, r21, r23
				mad r23.xy, r22, c121.zw, v0
				texldl r23, r23, s2
				add r21, r21, r23
				mad r23.xy, r22, c122.xy, v0
				texldl r23, r23, s2
				add r21, r21, r23
				mad r23.xy, r22, c122.zw, v0
				texldl r23, r23, s2
				add r21, r21, r23
				mad r23.xy, r22, c123.xy, v0
				texldl r23, r23, s2
				add r21, r21, r23
				mad r23.xy, r22, c123.zw, v0
				texldl r23, r23, s2
				add r21, r21, r23
				mul r20.y, r20.y, c4.w
			endif
			mul r21, r21, r20.y	// average
			mov r3, r21
			mov r4, r21
			mov r5, r21
			mov r6, r21
		endif
	endif
	// ----------------------------------------------------------------------------------------------------------------------------------------------
    mul r3.xyz, r3, r1.w
    mad r3.xyz, r7, r0.z, r3
    mad r3.xyz, r4, r1.w, r3
    mad r3.xyz, r5, r1.w, r3
    mad r3.yzw, r6.xxyz, r1.w, r3.xxyz
    mul r3.x, r0.x, r3.y
    mad r4.xyz, v0.yxyw, c5.x, c5.y
    mul r0.z, r4.y, c77.z
    mul r0.z, r0.y, r0.z
    mul r1.w, -r4.x, c77.w
    mul r1.w, r0.y, r1.w
    mul r5.xyz, r1.w, c73
    mad r5.xyz, r0.z, c72, r5
    mad r5.xyz, -r0.y, c74, r5
    add r5.xyz, r5, c75
    mul r0.y, -r5.z, c77.z
    rcp r0.y, r0.y
    mul r6.x, r5.x, r0.y
    mul r0.y, r5.z, c77.w
    rcp r0.y, r0.y
    mul r6.y, r5.y, r0.y
    add r0.yz, -r4, r6.xxyw
    mul r0.yz, r0, c80.x
    mul r4.xy, r0.yzzw, c5.z
    texld r5, v0, s6
    add r1.w, r5.x, -c85.x
    mul r4.zw, r3.xyxz, c3.w
    mad r4.zw, v0.xyxy, c0.xyxy, r4
    texld r5, r4.zwzw, s5
    add r2.w, r5.x, c4.x
    mad r4.zw, r4.xyxy, r2.w, v0.xyxy
    mov r5.xyz, r3.xzww
    mov r2.w, c2.y
    mov r3.y, c2.y
	// ---------------------------------------------------------- Motion Blur Optimization ----------------------------------------------------------
	if_ne r0.w, c1.x	// don't run if Definition = OFF
		rep i0
		mad r6.xy, r4, r3.y, r4.zwzw
		texldl r7, r6, s6
		add r5.w, r7.x, -c85.x
		cmp r5.w, r5.w, c2.w, c2.y
		texldl r6, r6, s2
		mad r5.xyz, r6, r5.w, r5
		add r2.w, r2.w, r5.w
		add r3.y, r3.y, c2.y
		endrep
	endif
	// ----------------------------------------------------------------------------------------------------------------------------------------------
    rcp r2.w, r2.w
    mul r0.yz, r0, c44.xxyw
    dp2add r0.y, r0.yzzw, r0.yzzw, c1.x
    rsq r0.y, r0.y
    rcp r0.y, r0.y
    mul r0.y, r0.y, c4.w
    add r0.x, r0.x, c2.y
    rcp r0.x, r0.x
    mul_sat r0.x, r0.y, r0.x
    mad r4.xyz, r5, r2.w, -r3.xzww
    mad r0.xyz, r0.x, r4, r3.xzww
    cmp r0.xyz, r1.w, r3.xzww, r0
    // cmp r0.xyz, -r0.w, r0, r1	// Disable vanilla Definition behavior
    texld r1, c1.x, s4
    rcp r0.w, r1.x
    mul r0.w, r0.w, c81.y
    rcp r1.x, r0.w
    mul r1.x, r1.x, c81.x
    mad r1.xyz, r2, c66.x, -r1.x
    mul r2.xyz, r1, c81.z
    mul r2.xyz, r2, c2.x
    cmp r1.xyz, r1, r2, c1.x
    mad r0.xyz, r0, c66.x, r1
    mul r1.xyz, r0.w, r0
    dp3 r1.x, r1, c1.yzww
    mad r0.xyz, r0, r0.w, -r1.x
    mad r0.xyz, c82.x, r0, r1.x
    mul r0.w, r1.x, c84.w
    mul r1.yzw, r0.w, c84.xxyz
    mov_sat r2.x, r0.w
    mad r0.xyz, c84, -r0.w, r0
    mad r0.xyz, r2.x, r0, r1.yzww
    mul r0.xyz, r0, c83
    add r0.xyz, r0, r0
    mov_sat r1.x, r1.x
    add r0.w, -r8.y, c82.z
    pow r2.x, r1.x, r0.w
	mul r12, r0, r2.x
	// ------------------------------------------------------------- Console-like Gamma -------------------------------------------------------------
	// Piecewise function to approximate Xbox gamma correction
	max r12, r12, c1.x
	if_ne c222.z, c222.w
		mov r20, c10						// copy c10
		add r21, r12, -c5.z					// r21 = r12 - 0.125
		cmp r22, r21, c2.w, c2.y			// r22 = r12 >= 0.125 ? 1 : 0
		lrp r23, r22, r20.x, r20.y			// mix(1.3333333, 1.0526316, r22(r12 >= 0.125))
		pow r24.x, r12.x, r23.x				// if r12 >= 0.125 ? 1.3333333 : 1.0526316
		pow r24.y, r12.y, r23.y				// if r12 >= 0.125 ? 1.3333333 : 1.0526316
		pow r24.z, r12.z, r23.z				// if r12 >= 0.125 ? 1.3333333 : 1.0526316
		add r25, r24, -c5.z					// if r12 >= 0.125
		mad r25, r25, r20.z, r20.w			// if r12 >= 0.125
		lrp r12.xyz, r22, r24, r25			// mix(r24, r25, r22(r12 >= 0.125))
	endif
	// ----------------------------------------------------------------------------------------------------------------------------------------------
    mov oC0.xyz, r12
    mov oC0.w, c2.y

// approximately 162 instruction slots used (13 texture, 149 arithmetic)
